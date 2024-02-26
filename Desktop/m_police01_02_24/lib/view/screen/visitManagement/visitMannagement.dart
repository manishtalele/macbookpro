import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

class VisitManageMentScreen extends StatefulWidget {
  const VisitManageMentScreen({super.key});
  @override
  State<VisitManageMentScreen> createState() => _VisitManageMentScreenState();
}

class _VisitManageMentScreenState extends State<VisitManageMentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customPSBAppBar(
          TextSize20("Visitor Management",
              fontweignt: FontWeight.bold, color: AllColor.white),
          centerTitle: false, onPressed: () {
        Navigator.pop(context);
      }, onPressed1: () {}, onPressed2: () {}),
      body: Column(
        children: [
          Container(
              width: sizeWidth,
              height: 34,
              color: AllColor.lightorangee,
              child: Center(
                child: madiumText15(AllString.giridharShitaram,
                    color: AllColor.white),
              )),
          sizeBoxHeight(20),
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: Container(
                width: sizeWidth * 0.95,
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: AllColor.primaryDeepColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: bigText18(
                    "Appointment (0)",
                    color: AllColor.white,
                  ),
                )),
          ),
          sizeBoxHeight(20),
          InkWell(
            onTap: () {
              setState(() {});
            },
            child: Container(
                width: sizeWidth * 0.95,
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: AllColor.primaryDeepColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Center(
                  child: bigText18(
                    "Redirected Appointments",
                    color: AllColor.white,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
