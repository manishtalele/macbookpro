// import 'dart:developer';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:m_police01_02_24/main.dart';
// import 'package:m_police01_02_24/model/modelMpoliceService.dart';
// import 'package:m_police01_02_24/utils/allAssetsImage/allassetimage.dart';
// import 'package:m_police01_02_24/utils/allColors/allColors.dart';
// import 'package:m_police01_02_24/view/screen/activityList/activityList.dart';
// import 'package:m_police01_02_24/view/screen/dailyBulletin/dailyBulletin.dart';
// import 'package:m_police01_02_24/view/screen/dutybookScreen/dutybookScreen.dart';
// import 'package:m_police01_02_24/view/screen/ePairavi/ePairavi.dart';
// import 'package:m_police01_02_24/view/screen/evetCalennder/eventCalenderScreen.dart';
// import 'package:m_police01_02_24/view/screen/igRms/igRms.dart';
// import 'package:m_police01_02_24/view/screen/leave/leavescreen.dart';
// import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';

// class ModulesList extends StatefulWidget {
//   const ModulesList({super.key});
//   @override
//   State<ModulesList> createState() => _ModulesListState();
// }
// class _ModulesListState extends State<ModulesList> {
//   List<MpoliceServiceModel> MpoliceServicelist = [
//     MpoliceServiceModel("Activity Details", AllAssetImage.splashLogo, 0),
//     MpoliceServiceModel("ACR", AllAssetImage.aRcIcon, 1),
//     MpoliceServiceModel("Daily Bulletin", AllAssetImage.splashLogo, 2),
//     MpoliceServiceModel("Duty", AllAssetImage.dutyIcon, 3),
//     MpoliceServiceModel("Duty Book", AllAssetImage.splashLogo, 4),
//     MpoliceServiceModel("E-Pairavi", AllAssetImage.splashLogo, 5),
//     MpoliceServiceModel("Event Calendar", AllAssetImage.calennderlogo, 6),
//     MpoliceServiceModel("Gazettes and Notices", AllAssetImage.splashLogo, 7),
//     MpoliceServiceModel("IGRMS", AllAssetImage.splashLogo, 8),
//     MpoliceServiceModel("Leave", AllAssetImage.splashLogo, 9),
//     MpoliceServiceModel("Message", AllAssetImage.splashLogo, 10),
//     MpoliceServiceModel("mPolice Job", AllAssetImage.splashLogo, 11),
//     MpoliceServiceModel("Orderly Room", AllAssetImage.splashLogo, 12),
//     MpoliceServiceModel("Resource Library", AllAssetImage.splashLogo, 13),
//     MpoliceServiceModel("Reward", AllAssetImage.reWardIcon, 14),
//     MpoliceServiceModel("Salary Slip", AllAssetImage.splashLogo, 15),
//     MpoliceServiceModel("Samadhan", AllAssetImage.splashLogo, 16),
//     MpoliceServiceModel("Service Book", AllAssetImage.splashLogo, 17),
//     MpoliceServiceModel("Training", AllAssetImage.splashLogo, 18),
//     MpoliceServiceModel("Videos Store", AllAssetImage.splashLogo, 19),
//     MpoliceServiceModel("Visitor Management", AllAssetImage.splashLogo, 20),
//     MpoliceServiceModel("Welfare", AllAssetImage.splashLogo, 21),
//   ];

//   Padding serviceProcessWidget({text, image, onTap}) {
//     return Padding(
//         padding: const EdgeInsets.only(
//           top: 10,
//         ),
//         child: InkWell(
//             onTap: onTap,
//             child: Center(
//               child: Column(
//                 children: [
//                   CircleAvatar(
//                     radius: 40,
//                     backgroundColor: AllColor.primaryColor,
//                     backgroundImage: AssetImage(image),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(10.0),
//                     child: Container(
//                         width: sizeWidth * 0.4,
//                         alignment: Alignment.bottomCenter,
//                         child: bigText18(text, fontSize: 15.0)),
//                   )
//                 ],
//               ),
//             )));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: sizeWidth,
//       height: sizeHeight * 0.9,
//       child: GridView.builder(
//         physics: NeverScrollableScrollPhysics(),
//         // shrinkWrap: true,
//         itemCount: MpoliceServicelist.length,
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           childAspectRatio: 0.85,
//           crossAxisCount: 3,
//         ),
//         itemBuilder: (context, int index) {
//           return serviceProcessWidget(
//               text: MpoliceServicelist[index].name,
//               image: MpoliceServicelist[index].Image,
//               // Icons.mail,
//               onTap: () {
//                 log(MpoliceServicelist[index].num.toString());
//                 if (MpoliceServicelist[index].num == 0) {
//                   // Navigator.of(context).push(CupertinoPageRoute(
//                   //     builder: (BuildContext context) =>
//                   //         const ActivityList()));
//                 } else if (MpoliceServicelist[index].num == 1) {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (BuildContext context) => const ActivityList()));
//                 } else if (MpoliceServicelist[index].num == 2) {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (BuildContext context) => DailyBulletin()));
//                 } else if (MpoliceServicelist[index].num == 3) {
//                   // Navigator.of(context).push(CupertinoPageRoute(
//                   //     builder: (BuildContext context) =>
//                   //         const ActivityList()));
//                 } else if (MpoliceServicelist[index].num == 4) {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (BuildContext context) =>
//                           const DutyBookScreen()));
//                 } else if (MpoliceServicelist[index].num == 5) {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (BuildContext context) =>
//                           const EPairAviScreen()));
//                 } else if (MpoliceServicelist[index].num == 6) {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (BuildContext context) =>
//                           const EventCalennderScreen()));
//                 } else if (MpoliceServicelist[index].num == 7) {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (BuildContext context) =>
//                           const DutyBookScreen()));
//                 } else if (MpoliceServicelist[index].num == 8) {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (BuildContext context) => const IGMRScreen()));
//                 } else if (MpoliceServicelist[index].num == 9) {
//                   Navigator.of(context).push(CupertinoPageRoute(
//                       builder: (BuildContext context) => const LeaveScreen()));
//                 }
//               });
//         },
//       ),
//     );
//   }
// }
