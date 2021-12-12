import 'package:flutter/material.dart';
import 'package:v24_teacher_app/res/colors.dart';

class PhoneConfirmationScreen extends StatefulWidget {
  const PhoneConfirmationScreen({Key? key}) : super(key: key);

  @override
  _PhoneConfirmationScreenState createState() => _PhoneConfirmationScreenState();
}

class _PhoneConfirmationScreenState extends State<PhoneConfirmationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomLeft,
            end: Alignment.topRight,
            stops: [0.35, 0.55, 0.88],
            colors: [
              AppColors.blueRaspberry,
              AppColors.hooloovooBlue,
              AppColors.sixteenMillionPink,
            ],
          ),
        ),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.55,
              width: MediaQuery.of(context).size.width,
              child: CustomPaint(
                painter: BackgroundPainter(),
                child: const Center(
                  child: Text(
                    'Our future logo',
                    style: TextStyle(fontSize: 15.0, color: AppColors.black),
                  ),
                ),
              ),
            ),
            const DigitPanelWidget(),
          ],
        ),
      ),
    );
  }
}

class BackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    final firstBasicPoint = Offset(0.0, height * 0.24);
    final secondBasicPoint = Offset(0.0, height * 0.45);
    final thirdBasicPoint = Offset(width * 0.34, 0.0);
    final fourthBasicPoint = Offset(width * 0.48, 0.0);

    final firstHandlePoint = Offset(width * 0.08, height * 0.1);
    final secondHandlePoint = Offset(width * 0.2, height * 0.45);
    final thirdHandlePoint = Offset(width * 0.31, height * 0.25);
    final fourthHandlePoint = Offset(width * 0.18, height * 0.39);
    final fifthHandlePoint = Offset(width * 0.46, height * 0.25);
    final sixthHandlePoint = Offset(width * 0.37, height * 0.15);

    final leftCornerPath = Path()
      ..moveTo(firstBasicPoint.dx, firstBasicPoint.dy)
      ..cubicTo(
        firstHandlePoint.dx,
        firstHandlePoint.dy,
        secondHandlePoint.dx,
        secondHandlePoint.dy,
        thirdBasicPoint.dx,
        thirdBasicPoint.dy,
      )
      ..lineTo(fourthBasicPoint.dx, fourthBasicPoint.dy)
      ..cubicTo(
        sixthHandlePoint.dx,
        sixthHandlePoint.dy,
        fifthHandlePoint.dx,
        fifthHandlePoint.dy,
        secondBasicPoint.dx,
        secondBasicPoint.dy,
      )
      ..close();

    final leftCornerPaint = Paint()
      ..shader = const LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [
          AppColors.hooloovooBlue,
          AppColors.sixteenMillionPink,
        ],
        stops: [
          0.01,
          0.7,
        ],
      ).createShader(Rect.largest);

    canvas.drawPath(leftCornerPath, leftCornerPaint);

    final circlePaint = Paint()
      ..color = AppColors.royalBlue
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(
      Offset(width * 0.08, height * 0.28),
      15.0,
      circlePaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}

class DigitPanelWidget extends StatefulWidget {
  const DigitPanelWidget({Key? key}) : super(key: key);

  @override
  _DigitPanelWidgetState createState() => _DigitPanelWidgetState();
}

class _DigitPanelWidgetState extends State<DigitPanelWidget> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: AppColors.white,
      ),
    );
  }
}
