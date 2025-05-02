import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../services/app_images.dart';
import 'dispatchpro_asset_image.dart';

class DispatchProNetworkImage extends StatelessWidget {
  final String imagePath;
  final BoxFit fit;
  final BoxFit errorAndPlaceHolderFit;
  final double paddingValue;

  const DispatchProNetworkImage(
      {super.key,
      required this.imagePath,
      this.fit = BoxFit.contain,
      this.errorAndPlaceHolderFit = BoxFit.contain,
      this.paddingValue = 0});

  @override
  Widget build(BuildContext context) {
    // String imageServerUrl = ApiLinks.imagesUrl;
    String imageUrl =
        // imageServerUrl +
        imagePath;
    final noImage = DispatchProAssetImage(
      imagePath: AppImages.imagePlaceHolderIcon,
      fit: errorAndPlaceHolderFit,
    );

    if (imagePath.isEmpty || imagePath == '') {
      return noImage;
    }

    if (imagePath.toLowerCase().contains('.svg')) {
      return SvgPicture.network(
        imageUrl,
        fit: fit,
        placeholderBuilder: (context) => DispatchProAssetImage(
          imagePath: AppImages.imagePlaceHolderIcon,
          fit: BoxFit.contain,
        ),
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      placeholder: (context, url) => DispatchProAssetImage(
        imagePath: AppImages.imagePlaceHolderIcon,
        fit: errorAndPlaceHolderFit,
      ),
      errorWidget: (context, url, error) => noImage,
      fit: errorAndPlaceHolderFit,
    );
  }
}
