import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'package:appoint_it/model/generic_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/retry.dart';
import '../services/app_host.dart';
import 'api_exceptions.dart';
import 'api_links.dart';

class ApiService {
  static final client = RetryClient(
    http.Client(),
    retries: 3, // Number of retries
    delay: (retryCount) => Duration(seconds: retryCount * 2),
  );

  // GET Request
  static Future<dynamic> apiGetRequest(String endPoint) async {
    try {
      final headers = await AppHost.apiHeaders;
      final response = await client
          .get(
            Uri.parse(ApiLinks.baseURL + endPoint),
            headers: headers,
          )
          .timeout(const Duration(seconds: 120));
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException(AppHost.noInternetMsg);
    } catch (e) {
      rethrow;
    }
  }

  // POST Request
  static Future<dynamic> apiPostRequest(String endPoint,
      {dynamic requestBody}) async {
    try {
      final headers = await AppHost.apiHeaders;
      final response = await client.post(
        Uri.parse(ApiLinks.baseURL + endPoint),
        headers: headers,
        body: jsonEncode(requestBody),
      );
      debugPrint(response.body);
      return _returnResponse(response);
    } 
    // on SocketException {
    //   log("errorrr");
    //   throw FetchDataException(AppHost.noInternetMsg);
    // } 
    catch (e) {
      log("errorrr $e");
      rethrow;
    }
  }

  // PUT Request
  static Future<dynamic> apiPutRequest(
      String endPoint, dynamic requestBody) async {
    try {
      final headers = await AppHost.apiHeaders;
      final response = await client.put(
        Uri.parse(ApiLinks.baseURL + endPoint),
        headers: headers,
        body: jsonEncode(requestBody),
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException(AppHost.noInternetMsg);
    } catch (e) {
      rethrow;
    }
  }

  // PATCH Request
  static Future<dynamic> apiPatchRequest(
      String endPoint, dynamic requestBody) async {
    try {
      final headers = await AppHost.apiHeaders;
      final response = await client.patch(
        Uri.parse(ApiLinks.baseURL + endPoint),
        headers: headers,
        body: jsonEncode(requestBody),
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException(AppHost.noInternetMsg);
    } catch (e) {
      rethrow;
    }
  }

  // DELETE Request
  static Future<dynamic> apiDeleteRequest(String endPoint,
      {dynamic body}) async {
    try {
      final headers = await AppHost.apiHeaders;
      final response = await client.delete(
        Uri.parse(ApiLinks.baseURL + endPoint),
        headers: headers,
        // body: jsonEncode(body),
      );
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException(AppHost.noInternetMsg);
    } catch (e) {
      rethrow;
    }
  }

  // Multipart POST Request
  static Future<dynamic> postMultipart({
    required String endPoint,
    required List<Map<String, String>> files,
    required Map<String, String> additionalFields,
  }) async {
    try {
      final headers = await AppHost.apiHeaders;
      final request = http.MultipartRequest(
        'POST',
        Uri.parse(ApiLinks.baseURL + endPoint),
      )..headers.addAll(headers);

      // Add files
      for (var file in files) {
        var multipartFile = await http.MultipartFile.fromPath(
            file['fieldName']!, file['filePath']!);
        request.files.add(multipartFile);
      }

      // Add fields
      request.fields.addAll(additionalFields);

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
      return _returnResponse(response);
    } on SocketException {
      throw FetchDataException(AppHost.noInternetMsg);
    } catch (e) {
      rethrow;
    }
  }

  // Handle API Response
  static dynamic _returnResponse(http.Response response) async {
    String? errorMessage;
    try {
      if (jsonDecode(response.body)['message'] != null &&
          !jsonDecode(response.body)['success']) {
        errorMessage =
            GenericModel.fromJson(jsonDecode(response.body)).message.first;
      }
    } catch (e) {
      throw FetchDataException(AppHost.apiExceptionMsg);
    }

    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 201:
        return jsonDecode(response.body);
      case 204:
        throw NoContentException(errorMessage);
      case 400:
        throw BadRequestException(errorMessage);
      // case 401:
      //   throw UnauthorisedException(errorMessage);
      case 403:
        throw ForbiddenException(errorMessage);
      case 404:
        throw ApiNotFoundException(errorMessage);
      case 409:
        throw ConflictException(errorMessage);
      case 422:
        throw UnprocessableEntityException(errorMessage);
      case 500:
        throw InternalServerException(errorMessage);
      case 502:
        throw InternalServerException(errorMessage);
      case 503:
        throw ServiceUnavailableException(errorMessage);
      default:
        throw FetchDataException(errorMessage);
    }
  }
}
