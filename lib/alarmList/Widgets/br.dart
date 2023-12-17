import 'package:budilnik/MainImports.dart';

class br extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
    var p1 = Offset(0, 0);
    var p2 = Offset(size.width, 0);
    var paint = Paint()
    ..color = ColorBr
    ..strokeWidth = 4;

    canvas.drawLine(p1, p2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

}
