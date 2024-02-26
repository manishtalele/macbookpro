  import 'package:flutter/material.dart';

Padding customTextfield({
    controler,
    String? labeltext,
  }) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 12.0),
      child: TextFormField(
        controller: controler,
        decoration: InputDecoration(labelText: labeltext),
      ),
    );
  }