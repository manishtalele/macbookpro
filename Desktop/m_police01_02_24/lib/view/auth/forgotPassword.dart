import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allButtons/commonButton.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';
import 'package:m_police01_02_24/widgets/textFieldWidgets/customTextField.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});
  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCMAppBar(
          reachTextWidget(
              text1: "m-",
              fontWText1: FontWeight.bold,
              fontText1: 21.0,
              text2: "POLICE",
              fontWText2: FontWeight.bold,
              ColorText2: AllColor.lightorange,
              fontText2: 24.0),
          centerTitle: false, onPressed: () {
        Navigator.pop(context);
      }),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: sizeWidth * 0.85,
            child: Text(
              AllString.textotpforgot,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 22),
            ),
          ),
          customTextfield(labeltext: AllString.labelTextSv),
          sizeBoxHeight(25.0),
          materialButtonWidget(AllString.generateotp, function: () {}),
        ],
      ),
    );
  }
}
