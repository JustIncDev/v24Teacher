import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:v24_teacher_app/global/bloc.dart';
import 'package:v24_teacher_app/global/ui/space.dart';
import 'package:v24_teacher_app/global/widgets/panel_widget.dart';
import 'package:v24_teacher_app/res/colors.dart';
import 'package:v24_teacher_app/res/fonts.dart';
import 'package:v24_teacher_app/res/icons.dart';
import 'package:v24_teacher_app/res/localization/id_values.dart';
import 'package:v24_teacher_app/utils/ui.dart';

import 'bloc/signup_code_bloc.dart';

class SignUpCodeScreen extends StatefulWidget {
  const SignUpCodeScreen({Key? key, required this.phone}) : super(key: key);

  final String phone;

  @override
  _SignUpCodeScreenState createState() => _SignUpCodeScreenState();

  static Page buildPage({Map<String, Object>? params, required BlocFactory blocFactory}) {
    late String phoneValue;
    if (params != null) {
      phoneValue = params['phone'] as String;
    }
    return UiUtils.createPlatformPage(
      key: const ValueKey('signup-code'),
      child: BlocProvider(
        create: (ctx) {
          return blocFactory.createSignUpCodeBloc();
        },
        child: SignUpCodeScreen(phone: phoneValue),
        lazy: false,
      ),
    );
  }
}

class _SignUpCodeScreenState extends State<SignUpCodeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCodeBloc, SignUpCodeState>(listener: (context, state) {
      // TODO: implement listener
    }, builder: (context, state) {
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: [
                        const VerticalSpace(93.0),
                        SvgPicture.asset(AppIcons.phoneSmsIcon),
                        const VerticalSpace(28.0),
                        Text(
                          getStringById(context, StringId.phoneConfirmation),
                          style: const TextStyle(fontSize: 18.0, color: AppColors.white)
                              .montserrat(fontWeight: AppFonts.semiBold),
                        ),
                        const VerticalSpace(10.0),
                        RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(children: [
                            TextSpan(
                                text: getStringById(context, StringId.enterCodeMessage),
                                style: const TextStyle(fontSize: 14.0, color: AppColors.white)
                                    .montserrat(fontWeight: AppFonts.regular)),
                            TextSpan(
                                text: widget.phone,
                                style: const TextStyle(fontSize: 14.0, color: AppColors.white)
                                    .montserrat(fontWeight: AppFonts.semiBold)),
                          ]),
                        ),
                        const VerticalSpace(60.0),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(4, (index) => _CodeFieldWidget())),
                        const VerticalSpace(40.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Expanded(
                                child: TextButton(onPressed: null, child: Text('Change phone'))),
                            const Expanded(
                                child: TextButton(onPressed: null, child: Text('Resend code'))),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              DigitPanelWidget(
                onPanelTap: ({clear, unlock, value}) {
                  if (value != null) {}
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}

class _CodeFieldWidget extends StatelessWidget {
  const _CodeFieldWidget({
    Key? key,
    this.focusNode,
    this.digit,
    this.showCursor = false,
  }) : super(key: key);

  final FocusNode? focusNode;
  final int? digit;

  /// Cursor for the empty value
  final bool showCursor;

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      child: Container(
        width: 60.0,
        height: 60.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(color: AppColors.white.withOpacity(0.3)),
          color: AppColors.white.withOpacity(0.1),
        ),
        child: Center(
          child: Text(
            '${digit ?? ''}',
            style: const TextStyle(fontSize: 24.0, color: AppColors.white)
                .montserrat(fontWeight: AppFonts.semiBold),
          ),
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
