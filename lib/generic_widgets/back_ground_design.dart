import 'package:flutter/material.dart';

class RPSCustomPainter extends CustomPainter {
    @override
    void paint(Canvas canvas, Size size) {
            
Path path_0 = Path();
    path_0.moveTo(size.width*0.5578324,size.height*0.003262379);
    path_0.cubicTo(size.width*0.6863765,size.height*-0.01951444,size.width*0.8083353,size.height*0.08066013,size.width*0.8933794,size.height*0.1888839);
    path_0.cubicTo(size.width*0.9726088,size.height*0.2897077,size.width*0.9877824,size.height*0.4241768,size.width*0.9931235,size.height*0.5571961);
    path_0.cubicTo(size.width*0.9988147,size.height*0.6988939,size.width*1.023476,size.height*0.8685305,size.width*0.9243206,size.height*0.9594727);
    path_0.cubicTo(size.width*0.8268647,size.height*1.048855,size.width*0.6846676,size.height*0.9635466,size.width*0.5578324,size.height*0.9564309);
    path_0.cubicTo(size.width*0.4427735,size.height*0.9499775,size.width*0.3233765,size.height*0.9896206,size.width*0.2269862,size.height*0.9203537);
    path_0.cubicTo(size.width*0.1110379,size.height*0.8370289,size.width*-0.01888335,size.height*0.7075338,size.width*0.002284515,size.height*0.5571961);
    path_0.cubicTo(size.width*0.02324544,size.height*0.4083312,size.width*0.2139841,size.height*0.3925531,size.width*0.3155647,size.height*0.2912695);
    path_0.cubicTo(size.width*0.4071647,size.height*0.1999338,size.width*0.4356618,size.height*0.02491029,size.width*0.5578324,size.height*0.003262379);
    path_0.close();

Paint paint_0_fill = Paint()..style=PaintingStyle.fill;
paint_0_fill.color = Color(0xffF8EAFF).withOpacity(1.0);
canvas.drawPath(path_0,paint_0_fill);

}

@override
bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
}
}