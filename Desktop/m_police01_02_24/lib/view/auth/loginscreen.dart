import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_police01_02_24/utils/allAssetsImage/allassetimage.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allButtons/commonButton.dart';
import 'package:m_police01_02_24/view/auth/forgotPassword.dart';
import 'package:m_police01_02_24/view/screen/dashboard/dashboard.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';
import 'package:m_police01_02_24/widgets/textFieldWidgets/customTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool passWdVisbl = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Image.asset(
              AllAssetImage.splashLogo,
              width: 160,
              height: 160,
            ),
          ),
          sizeBoxHeight(25.0),
          customTextfield(labeltext: AllString.labelTextSv),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.0),
            child: TextFormField(
              obscureText: passWdVisbl,
              decoration: InputDecoration(
                labelText: AllString.labelTextpass,
                suffixIcon: IconButton(
                  icon: Icon(passWdVisbl
                      ? Icons.visibility_off
                      : Icons.remove_red_eye_sharp),
                  onPressed: () {
                    setState(() {
                      passWdVisbl = !passWdVisbl;
                    });
                  },
                ),
              ),
            ),
          ),
          sizeBoxHeight(25.0),
          materialButtonWidget(AllString.signin, function: () {
            Navigator.of(context).push(CupertinoPageRoute(
                builder: (BuildContext context) => const DashBoard()));
          }),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(CupertinoPageRoute(
                        builder: (BuildContext context) =>
                            const ForgotPassword()));
                  },
                  child: Text(AllString.forgotpassword)),
            ),
          )
        ],
      ),
    );
  }
}
