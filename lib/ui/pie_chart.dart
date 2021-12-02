import 'dart:ui';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PieChart extends CustomPainter {
  int? percentage;
  double? textScaleFactor;
  String? nutrient;

  PieChart({this.percentage,this.textScaleFactor,this.nutrient}){}

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 15.0
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double radius = min(size.width / 2 - paint.strokeWidth / 2,
        size.height / 2 - paint.strokeWidth / 2);

    Offset center = Offset(size.width / 2, size.height / 2);

    canvas.drawCircle(center, radius, paint);

    double arcAngle = 2 * pi * (percentage! / 100);

    paint..color = Colors.white38;

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        arcAngle, false, paint);

    drawText(canvas, size, "$nutrient \n\n 280g / 360g");
  }

  void drawText(Canvas canvas, Size size, String text) {
    double fontSize = getFontSize(size, text);
    TextSpan sp = TextSpan(style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.black), text: text);
    TextPainter tp = TextPainter(textAlign: TextAlign.center ,text: sp, textDirection: TextDirection.ltr);
    tp.layout();
    double dx = size.width / 2 - tp.width / 2;
    double dy = size.height / 2 - tp.height / 2;
    Offset offset = Offset(dx, dy);
    tp.paint(canvas, offset);
  }

  double getFontSize(Size size, String text) {
    return size.width / text.length * textScaleFactor!;
  }

    @override
    bool shouldRepaint(PieChart old) {
    // TODO: implement shouldRepaint
      return old.percentage != percentage;
    }
  }
