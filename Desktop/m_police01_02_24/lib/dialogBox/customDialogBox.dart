import 'package:flutter/material.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

customDialogBox(String text, context, {isNotrue = false, yes,onTapno, onTap}) {
  return showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      shape: RoundedRectangleBorder(
        borderRadius:
            BorderRadius.circular(5.0), // Decrease this value as needed
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            sizeBoxHeight(10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: bigText18(text

                    //
                    ),
              ),
            ),
            sizeBoxHeight(15),
            Row(
              children: [
                Spacer(),
                isNotrue
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                        child: Align(
                            alignment: Alignment.centerRight,
                            child: InkWell(
                              onTap: onTapno,
                              child:
                                  bigText18("NO", color: AllColor.primaryColor),
                            )))
                    : SizedBox(),
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.0),
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: onTap,
                          child: bigText18(yes, color: AllColor.primaryColor),
                        ))),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
