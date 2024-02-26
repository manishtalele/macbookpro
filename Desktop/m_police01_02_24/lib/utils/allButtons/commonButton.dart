import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';

MaterialButton materialButtonWidget(String text,
    {required void Function()? function}) {
  return MaterialButton(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0))),
      elevation: 2.0,
      minWidth: sizeWidth * 0.95,
      height: 45,
      color: AllColor.primaryColor,
      child: Text(text, style: TextStyle(fontSize: 16.0, color: Colors.white)),
      onPressed: function);
}
