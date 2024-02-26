import 'package:flutter/material.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';

normalText(String? text,
    {color, maxline, textAlign, fontSize, overflow, fontweignt}) {
  return Text(
    text ?? "",
    textAlign: textAlign ?? TextAlign.center,
    maxLines: maxline ?? 2,
    overflow: overflow ?? TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: fontSize ?? 12.00,
        color: color ?? AllColor.black,
        fontWeight: fontweignt ?? FontWeight.normal),
  );
}

normalText13(String? text,
    {color, maxline, textAlign, fontSize, overflow, fontweignt}) {
  return Text(
    text ?? "",
    textAlign: textAlign ?? TextAlign.center,
    maxLines: maxline ?? 2,
    overflow: overflow ?? TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: fontSize ?? 13,
        color: color ?? AllColor.black,
        fontWeight: fontweignt ?? FontWeight.normal),
  );
}

madiumText15(String? text, {color, maxline, fontSize, overflow, fontweignt}) {
  return Text(
    text ?? "",
    maxLines: maxline ?? 2,
    textAlign: TextAlign.center,
    overflow: overflow ?? TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: fontSize ?? 15.00,
        color: color ?? AllColor.black,
        fontWeight: fontweignt ?? FontWeight.normal),
  );
}

bigText18(String? text, {color, fontSize, overflow, fontweignt}) {
  return Text(
    text ?? "",
    textAlign: TextAlign.center,
    maxLines: 3,
    overflow: overflow ?? TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: fontSize ?? 18.00,
        color: color ?? AllColor.black,
        fontWeight: fontweignt ?? FontWeight.normal),
  );
}

TextSize20(String? text, {color, fontSize, overflow, fontweignt}) {
  return Text(
    text ?? "",
    textAlign: TextAlign.center,
    maxLines: 2,
    overflow: overflow ?? TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: fontSize ?? 20.00,
        color: color ?? AllColor.black,
        fontWeight: fontweignt ?? FontWeight.normal),
  );
}

TextSize22(String? text, {color, fontSize, overflow, fontweignt}) {
  return Text(
    text ?? "",
    textAlign: TextAlign.center,
    maxLines: 2,
    overflow: overflow ?? TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: fontSize ?? 22.00,
        color: color ?? AllColor.black,
        fontWeight: fontweignt ?? FontWeight.normal),
  );
}

TextSize25(String? text,
    {color, maxline, textAlign, fontSize, overflow, fontweignt}) {
  return Text(
    text ?? "",
    textAlign: textAlign ?? TextAlign.center,
    maxLines: maxline ?? 2,
    overflow: overflow ?? TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: fontSize ?? 25.0,
        color: color ?? AllColor.black,
        fontWeight: fontweignt ?? FontWeight.normal),
  );
}

normalTextAppBar(String? text, {color, fontSize, overflow, fontweignt}) {
  return Text(
    text ?? "",
    textAlign: TextAlign.center,
    overflow: overflow ?? TextOverflow.ellipsis,
    style: TextStyle(
        fontSize: fontSize ?? 20.00,
        color: color ?? AllColor.black,
        fontWeight: fontweignt ?? FontWeight.normal),
  );
}

reachTextWidget(
    {text1 = "",
    ColorText1,
    fontText1,
    fontWText1,
    ColorText2,
    fontText2,
    fontWText2,
    text2 = ""}) {
  return Text.rich(
    TextSpan(
      children: [
        TextSpan(
          text: text1,
          style: TextStyle(
              color: ColorText1 ?? AllColor.white,
              fontSize: fontText1 ?? 15,
              fontWeight: fontWText1 ?? FontWeight.normal),
        ),
        TextSpan(
          text: text2,
          style: TextStyle(
              color: ColorText2 ?? AllColor.white,
              fontSize: fontText2 ?? 15,
              fontWeight: fontWText2 ?? FontWeight.normal),
        ),
      ],
    ),
  );
}
