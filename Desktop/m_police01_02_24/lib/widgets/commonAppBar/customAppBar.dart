import 'package:flutter/material.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';

customCMAppBar(title, {backColor, centerTitle, onPressed, iconColor}) {
  return AppBar(
    title: title,
    centerTitle: centerTitle ?? true,
    backgroundColor: backColor ?? AllColor.primaryDeepColor,
    leading: IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.arrow_back, color: iconColor ?? AllColor.white),
    ),
  );
}

customPSAppBar(title,
    {backColor,
    centerTitle,
    onPressed1,
    iconColor1,
    proficon1,
    onPressed2,
    iconColor2,
    proficon2}) {
  return AppBar(
    title: title,
    centerTitle: centerTitle ?? true,
    backgroundColor: backColor ?? AllColor.primaryColor,
    automaticallyImplyLeading: false,
    actions: [
      IconButton(
        onPressed: onPressed1,
        icon: Icon(proficon1 ?? Icons.person,
            size: 32, color: iconColor1 ?? AllColor.white),
      ),
      IconButton(
        onPressed: onPressed2,
        icon: Icon(proficon2 ?? Icons.settings,
            size: 32, color: iconColor2 ?? AllColor.white),
      ),
    ],
  );
}

customPSBAppBar(title,
    {backColor,
    centerTitle,
    iconBackColor,
    onPressed,
    onPressed1,
    iconColor1,
    proficon1,
    onPressed2,
    iconColor2,
    proficon2}) {
  return AppBar(
    title: title,
    centerTitle: centerTitle ?? true,
    backgroundColor: backColor ?? AllColor.primaryDeepColor,
    leading: IconButton(
      onPressed: onPressed,
      icon: Icon(Icons.arrow_back, color: iconBackColor ?? AllColor.white),
    ),
    actions: [
      IconButton(
        onPressed: onPressed1,
        icon: Icon(proficon1 ?? Icons.person,
            size: 32, color: iconColor1 ?? AllColor.white),
      ),
      IconButton(
        onPressed: onPressed2,
        icon: Icon(proficon2 ?? Icons.settings,
            size: 32, color: iconColor2 ?? AllColor.white),
      ),
    ],
  );
}
