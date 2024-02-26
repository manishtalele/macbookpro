import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

class TrainninngScreen extends StatefulWidget {
  const TrainninngScreen({super.key});

  @override
  State<TrainninngScreen> createState() => _TrainninngScreenState();
}

class _TrainninngScreenState extends State<TrainninngScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 3,
      child: Scaffold(
        appBar: customPSBAppBar(
            TextSize20("Training",
                fontweignt: FontWeight.bold, color: AllColor.white),
            centerTitle: false, onPressed: () {
          Navigator.pop(context);
        }, onPressed1: () {}, onPressed2: () {}),
        floatingActionButton: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: AllColor.lightorangee,
                borderRadius: BorderRadius.circular(1000)),
            child: Icon(
              Icons.update,
              color: AllColor.white,
              size: 30,
            )),
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
            sizeBoxHeight(1),
            Container(
              width: sizeWidth,
              color: AllColor.primaryColor,
              child: TabBar(
                labelPadding: EdgeInsets.zero,
                indicatorSize: TabBarIndicatorSize.label,
                indicator: BoxDecoration(
                  color: AllColor.lightorangee,
                ),
                tabs: [
                  Tab(
                      child: Container(
                    width: sizeWidth,
                    child: Center(
                      child: madiumText15("Planned Training",
                          color: AllColor.white),
                    ),
                  )),
                  Tab(
                      child: Container(
                    width: sizeWidth,
                    child: Center(
                      child: madiumText15("Application Status",
                          color: AllColor.white),
                    ),
                  )),
                  Tab(
                      child: Container(
                    width: sizeWidth,
                    child: Center(
                      child: madiumText15("Training History",
                          color: AllColor.white),
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(children: <Widget>[
                Container(),
                Container(),
                Container(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
