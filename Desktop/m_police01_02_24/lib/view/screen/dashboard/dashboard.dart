import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/model/modelMpoliceService.dart';
import 'package:m_police01_02_24/utils/allAssetsImage/allassetimage.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/view/screen/activityList/activityList.dart';
import 'package:m_police01_02_24/view/screen/dailyBulletin/dailyBulletin.dart';
import 'package:m_police01_02_24/view/screen/dutybookScreen/dutybookScreen.dart';
import 'package:m_police01_02_24/view/screen/ePairavi/ePairavi.dart';
import 'package:m_police01_02_24/view/screen/evetCalennder/eventCalenderScreen.dart';
import 'package:m_police01_02_24/view/screen/igRms/igRms.dart';
import 'package:m_police01_02_24/view/screen/leave/leavescreen.dart';
import 'package:m_police01_02_24/view/screen/message/notification.dart';
import 'package:m_police01_02_24/view/screen/mpoliceJob/mpoliceJob.dart';
import 'package:m_police01_02_24/view/screen/orderlyRoom/orderlyRoom.dart';
import 'package:m_police01_02_24/view/screen/reWard/reward.dart';
import 'package:m_police01_02_24/view/screen/resoourceLibrary/resourceLibrary.dart';
import 'package:m_police01_02_24/view/screen/salary/salary.dart';
import 'package:m_police01_02_24/view/screen/samadhan/samadhan.dart';
import 'package:m_police01_02_24/view/screen/serviceBook/serviceBook.dart';
import 'package:m_police01_02_24/view/screen/training/training.dart';
import 'package:m_police01_02_24/view/screen/videoStore/videoStore.dart';
import 'package:m_police01_02_24/view/screen/visitManagement/visitMannagement.dart';
import 'package:m_police01_02_24/view/screen/welfare/welFareScreen.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';

class DashBoard extends StatefulWidget {
  const DashBoard({super.key});

  @override
  State<DashBoard> createState() => _DashBoardState();
}

class _DashBoardState extends State<DashBoard> {
  List<MpoliceServiceModel> MpoliceServicelist = [
    MpoliceServiceModel("Activity Details", AllAssetImage.splashLogo, 0),
    MpoliceServiceModel("ACR", AllAssetImage.aRcIcon, 1),
    MpoliceServiceModel("Daily Bulletin", AllAssetImage.splashLogo, 2),
    MpoliceServiceModel("Duty", AllAssetImage.dutyIcon, 3),
    MpoliceServiceModel("Duty Book", AllAssetImage.splashLogo, 4),
    MpoliceServiceModel("E-Pairavi", AllAssetImage.splashLogo, 5),
    MpoliceServiceModel("Event Calendar", AllAssetImage.calennderlogo, 6),
    MpoliceServiceModel("Gazettes and Notices", AllAssetImage.splashLogo, 7),
    MpoliceServiceModel("IGRMS", AllAssetImage.splashLogo, 8),
    MpoliceServiceModel("Leave", AllAssetImage.splashLogo, 9),
    MpoliceServiceModel("Message", AllAssetImage.splashLogo, 10),
    MpoliceServiceModel("mPolice Job", AllAssetImage.splashLogo, 11),
    MpoliceServiceModel("Orderly Room", AllAssetImage.splashLogo, 12),
    MpoliceServiceModel("Resource Library", AllAssetImage.splashLogo, 13),
    MpoliceServiceModel("Reward", AllAssetImage.reWardIcon, 14),
    MpoliceServiceModel("Salary Slip", AllAssetImage.splashLogo, 15),
    MpoliceServiceModel("Samadhan", AllAssetImage.splashLogo, 16),
    MpoliceServiceModel("Service Book", AllAssetImage.splashLogo, 17),
    MpoliceServiceModel("Training", AllAssetImage.splashLogo, 18),
    MpoliceServiceModel("Videos Store", AllAssetImage.splashLogo, 19),
    MpoliceServiceModel("Visitor Management", AllAssetImage.splashLogo, 20),
    MpoliceServiceModel("Welfare", AllAssetImage.splashLogo, 21),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white.withOpacity(0.96),
      appBar: customPSAppBar(
          reachTextWidget(
              text1: "m-",
              fontWText1: FontWeight.bold,
              fontText1: 21.0,
              text2: "POLICE",
              fontWText2: FontWeight.bold,
              ColorText2: AllColor.lightorangee,
              fontText2: 24.0),
          centerTitle: false,
          onPressed1: () {},
          onPressed2: () {}),
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
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
              width: sizeWidth,
              height: 34,
              color: AllColor.lightorangee,
              child: Center(
                child: madiumText15(AllString.giridharShitaram,
                    color: AllColor.white),
              )),
          Expanded(
            child:

                // SingleChildScrollView(child: ModulesList())

                GridView.builder(
              physics: const BouncingScrollPhysics(),
              shrinkWrap: true,
              itemCount: MpoliceServicelist.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 0.85,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, int index) {
                return serviceProcessWidget(
                    text: MpoliceServicelist[index].name,
                    image: MpoliceServicelist[index].Image,
                    onTap: () {
                      log(MpoliceServicelist[index].num.toString());
                      if (MpoliceServicelist[index].num == 0) {
                        // Navigator.of(context).push(CupertinoPageRoute(
                        //     builder: (BuildContext context) =>
                        //         const ActivityList()));
                      } else if (MpoliceServicelist[index].num == 1) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const ActivityList()));
                      } else if (MpoliceServicelist[index].num == 2) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                DailyBulletin()));
                      } else if (MpoliceServicelist[index].num == 3) {
                        // Navigator.of(context).push(CupertinoPageRoute(
                        //     builder: (BuildContext context) =>
                        //         const ActivityList()));
                      } else if (MpoliceServicelist[index].num == 4) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const DutyBookScreen()));
                      } else if (MpoliceServicelist[index].num == 5) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const EPairAviScreen()));
                      } else if (MpoliceServicelist[index].num == 6) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const EventCalennderScreen()));
                      } else if (MpoliceServicelist[index].num == 7) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const DutyBookScreen()));
                      } else if (MpoliceServicelist[index].num == 8) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const IGMRScreen()));
                      } else if (MpoliceServicelist[index].num == 9) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const LeaveScreen()));
                      } else if (MpoliceServicelist[index].num == 10) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const NotificationScreen()));
                      } else if (MpoliceServicelist[index].num == 11) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const MpoliceJob()));
                      } else if (MpoliceServicelist[index].num == 12) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) => OrderlyRoom()));
                      } else if (MpoliceServicelist[index].num == 13) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const ResourceAndLibrary()));
                      } else if (MpoliceServicelist[index].num == 14) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) => const Reward()));
                      } else if (MpoliceServicelist[index].num == 15) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const SallaryWidget()));
                      } else if (MpoliceServicelist[index].num == 16) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const SamaDhanScreen()));
                      } else if (MpoliceServicelist[index].num == 17) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const ServiceBook()));
                      } else if (MpoliceServicelist[index].num == 18) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const TrainninngScreen()));
                      } else if (MpoliceServicelist[index].num == 19) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                const VideosStoreScreen()));
                      } else if (MpoliceServicelist[index].num == 20) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                VisitManageMentScreen()));
                      } else if (MpoliceServicelist[index].num == 21) {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) =>
                                WelFareScreen()));
                      }
                    });
              },
            ),
          )
        ],
      ),
    );
  }

  Padding serviceProcessWidget({text, image, onTap}) {
    return Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: InkWell(
            onTap: onTap,
            child: Center(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: AllColor.primaryColor,
                    backgroundImage: AssetImage(image),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                        width: sizeWidth * 0.4,
                        alignment: Alignment.bottomCenter,
                        child: bigText18(text, fontSize: 15.0)),
                  )
                ],
              ),
            )));
  }
}
