import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';

class EPairAviScreen extends StatefulWidget {
  const EPairAviScreen({super.key});

  @override
  State<EPairAviScreen> createState() => _EPairAviScreenState();
}

class _EPairAviScreenState extends State<EPairAviScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customPSBAppBar(
            TextSize20("E-Pairavi",
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
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                        width: sizeWidth * 0.65,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(
                                color: AllColor.greyColor.withOpacity(0.5))),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 12.0),
                              child: Center(
                                child: normalText("07-02-2024", fontSize: 18.0),
                              ),
                            ),
                            Spacer(),
                            Padding(
                              padding: EdgeInsets.only(right: 8.0),
                              child: Icon(
                                Icons.calendar_month,
                                size: 20,
                                color: AllColor.primaryColor,
                              ),
                            )
                          ],
                        )),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () {},
                    child: Container(
                        width: sizeWidth * 0.25,
                        height: 42,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                            color: AllColor.primaryColor,
                            borderRadius: BorderRadius.circular(6),
                            border: Border.all(
                                color: AllColor.black.withOpacity(0.5))),
                        child: Center(
                          child: madiumText15(
                            "SEARCH",
                            color: AllColor.white,
                          ),
                        )),
                  ),
                ],
              ),
            )
          ],
        ));
  }
}
