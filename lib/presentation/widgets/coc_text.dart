import 'package:coc_base_prediction/presentation/bases/resources/font_res.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CocText extends StatelessWidget {
  String data;
  FontWeight? fontWeight = CocFontWeight.regular;
  TextAlign? textAlign;
  int? maxLines;
  double? fontSize;
  TextOverflow? overflow;
  Color? color;

  CocText(this.data,
      {super.key,
      this.textAlign,
      this.maxLines,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.overflow = TextOverflow.ellipsis});

  CocText.medium(this.data,
      {super.key,
      this.color,
      this.fontSize,
      this.textAlign,
      this.fontWeight = CocFontWeight.medium,
      this.overflow = TextOverflow.ellipsis});

  CocText.semiBold(this.data,
      {super.key,
      this.color,
      this.fontSize,
      this.textAlign,
      this.fontWeight = CocFontWeight.semiBold,
      this.overflow = TextOverflow.ellipsis});

  CocText.bold(this.data,
      {super.key,
      this.color,
      this.fontSize,
      this.textAlign,
      this.fontWeight = CocFontWeight.bold,
      this.overflow = TextOverflow.ellipsis});

  CocText.light(this.data,
      {super.key,
      this.color,
      this.fontSize,
      this.textAlign,
      this.fontWeight = CocFontWeight.light,
      this.overflow = TextOverflow.ellipsis});

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      textAlign: textAlign,
      maxLines: maxLines,
      softWrap: true,
      overflow: overflow,
      style: TextStyle(
        fontWeight: fontWeight,
        color: color,
        fontSize: fontSize,
      ),
    );
  }
}
