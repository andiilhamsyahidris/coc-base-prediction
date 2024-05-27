import 'package:coc_base_prediction/presentation/bases/resources/color_res.dart';
import 'package:coc_base_prediction/presentation/bases/resources/value_res.dart';
import 'package:coc_base_prediction/presentation/widgets/coc_text.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CocFilledButton extends StatelessWidget {
  Color? bgBtnColor;
  Color? textColor;
  Function()? onTap;
  String? text;
  double? height;
  double? width;
  double? radius;
  Widget? child;
  IconData? iconChild;

  CocFilledButton(
      {super.key,
      this.bgBtnColor = CocColor.mainColor,
      required this.text,
      required this.onTap,
      this.radius,
      this.textColor,
      this.child,
      this.iconChild,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onTap,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(
          bgBtnColor ?? CocColor.mainColor,
        ),
        minimumSize: MaterialStateProperty.all<Size>(
          Size(double.infinity, height ?? 45),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? CocRadius.cardRadius),
        )),
      ),
      child: child ??
          (iconChild != null && text == null
              ? Icon(iconChild)
              : CocText.semiBold(text!,
                  color: textColor ?? CocColor.textColor)),
    );
  }
}
