import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/view/screen/orderlyRoom/oRRequestSelf.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';

class OrderlyRoom extends StatefulWidget {
  const OrderlyRoom({super.key});

  @override
  State<OrderlyRoom> createState() => _OrderlyRoomState();
}

class _OrderlyRoomState extends State<OrderlyRoom> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customPSBAppBar(
          reachTextWidget(
              text1: "m-",
              fontWText1: FontWeight.bold,
              fontText1: 21.0,
              text2: "POLICE",
              fontWText2: FontWeight.bold,
              ColorText2: AllColor.lightorangee,
              fontText2: 24.0),
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
          InkWell(
            onTap: () {},
            child: Container(
                width: sizeWidth,
                height: 30,
                // color: AllColor.lightorangee,
                child: Center(
                  child: bigText18("OR Module", color: AllColor.primaryColor),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(CupertinoPageRoute(
                    builder: (BuildContext context) => OrRequestSelf()));
              },
              child: Container(
                  width: sizeWidth,
                  height: 42,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: AllColor.primaryDeepColor,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Center(
                    child: bigText18(
                      "OR Request (Self)",
                      color: AllColor.white,
                    ),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
