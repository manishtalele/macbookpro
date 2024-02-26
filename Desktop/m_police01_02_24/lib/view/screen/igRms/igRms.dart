import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/view/screen/igRms/igRmsAppSource.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

class IGMRScreen extends StatefulWidget {
  const IGMRScreen({super.key});

  @override
  State<IGMRScreen> createState() => _IGMRScreenState();
}

class _IGMRScreenState extends State<IGMRScreen> {
  bool isCloseAIcon = false;
  TextEditingController? searchControler = TextEditingController();
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
      floatingActionButton: InkWell(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(
              builder: (BuildContext context) => const IGRMAppSource()));
        },
        child: Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
                color: AllColor.primaryColor,
                borderRadius: BorderRadius.circular(1000)),
            child: Icon(
              Icons.add,
              color: AllColor.white,
              size: 30,
            )),
      ),
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
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                  width: sizeWidth,
                  height: 45,
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                      color: AllColor.primaryColor,
                      borderRadius: BorderRadius.circular(6),
                      border:
                          Border.all(color: AllColor.black.withOpacity(0.5))),
                  child: Center(
                    child: madiumText15(
                      "Assigned Grievances",
                      color: AllColor.white,
                    ),
                  )),
            ),
          ),
          sizeBoxHeight(3),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 6.0),
            child: SizedBox(
              height: 40,
              child: TextField(
                controller: searchControler,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                ),
                onChanged: (String? value) {
                  if (value.toString().isEmpty) {
                    setState(() {
                      isCloseAIcon = false;
                    });
                  } else {
                    setState(() {
                      isCloseAIcon = true;
                    });
                  }
                },
                decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                    borderRadius: BorderRadius.all(
                      Radius.circular(8),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 2,
                      color: AllColor.backgroundTop,
                    ),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Padding(
                    padding: EdgeInsets.only(bottom: 3.0),
                    child: IconButton(
                      onPressed: () {
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  suffixIcon: isCloseAIcon
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 3.0),
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                searchControler?.clear();
                                isCloseAIcon = false;
                              });
                            },
                            icon: const Icon(
                              Icons.close,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      : Text(""),
                  contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                  hoverColor: Color.fromRGBO(54, 54, 54, 1),
                  hintText: 'Search here',
                  hintStyle: const TextStyle(
                    fontSize: 14,
                  ),
                ),
              ),
            ),
          ),
          sizeBoxHeight(10),
          Expanded(
              child: ListView.builder(
                  physics: BouncingScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (BuildContext context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Container(
                          width: sizeWidth,
                          // height: 100,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: AllColor.greyColor)),
                          child: Column(
                            children: [
                              sizeBoxHeight(5),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: sizeWidth * 0.25,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: normalText13("Case No"),
                                      ),
                                    ),
                                    normalText13(":"),
                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                      width: sizeWidth * 0.45,
                                      alignment: Alignment.centerLeft,
                                      child: normalText13(
                                        "15",
                                        textAlign: TextAlign.left,
                                        // overflow:TextOverflow.clip                                ),
                                      ),
                                    ),
                                    Spacer(),
                                    normalText13("13-12-2023",
                                        color: AllColor.primaryColor)
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: sizeWidth * 0.25,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: normalText13("Application Type",
                                            textAlign: TextAlign.left),
                                      ),
                                    ),
                                    normalText13(":"),
                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                      width: sizeWidth * 0.65,
                                      alignment: Alignment.centerLeft,
                                      // color: AllColor.blue,
                                      child: normalText13(
                                        "ATM Cloning Fraud",
                                        textAlign: TextAlign.left,
                                        // overflow:TextOverflow.clip                                ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: sizeWidth * 0.25,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: normalText13("Status"),
                                      ),
                                    ),
                                    normalText13(":"),
                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                      width: sizeWidth * 0.65,
                                      alignment: Alignment.centerLeft,
                                      // color: AllColor.blue,
                                      child: normalText13(
                                        "Assignned",
                                        textAlign: TextAlign.left,
                                        // overflow:TextOverflow.clip                                ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: sizeWidth * 0.25,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: normalText13("Assigned To"),
                                      ),
                                    ),
                                    normalText13(":"),
                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                      width: sizeWidth * 0.65,
                                      alignment: Alignment.centerLeft,
                                      // color: AllColor.blue,
                                      child: normalText13(
                                        "ABAJI PATIL(CBD BELAPUR PS HEAD CONSTABLE)",
                                        textAlign: TextAlign.left,
                                        // overflow:TextOverflow.clip                                ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      width: sizeWidth * 0.25,
                                      child: Align(
                                        alignment: Alignment.centerLeft,
                                        child: normalText13("Description"),
                                      ),
                                    ),
                                    normalText13(":"),
                                    Container(
                                      padding: EdgeInsets.only(left: 5),
                                      width: sizeWidth * 0.65,
                                      alignment: Alignment.centerLeft,
                                      // color: AllColor.blue,
                                      child: normalText13(
                                        "Description*",
                                        textAlign: TextAlign.left,
                                        // overflow:TextOverflow.clip                                ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              sizeBoxHeight(5),
                            ],
                          )),
                    );
                  }))
        ],
      ),
    );
  }
}
