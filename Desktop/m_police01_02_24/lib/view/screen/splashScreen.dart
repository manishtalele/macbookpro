import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allAssetsImage/allassetimage.dart';
import 'package:m_police01_02_24/view/auth/loginscreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(const Duration(seconds: 2)).then((value) => {
      Navigator.of(context).push(CupertinoPageRoute(builder: (BuildContext context) => const LoginScreen()))


    });
  }
  @override
  Widget build(BuildContext context) {
    sizeHeight = MediaQuery.of(context).size.height;
    sizeWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(child: SizedBox(
        width: sizeWidth*0.4,
        height: sizeWidth*0.4,
        child: Image.asset(AllAssetImage.splashLogo))),
    );
  }
}