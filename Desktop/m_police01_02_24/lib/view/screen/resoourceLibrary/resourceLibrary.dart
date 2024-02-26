import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/view/screen/resoourceLibrary/UploadFilesResourse.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

class ResourceAndLibrary extends StatefulWidget {
  const ResourceAndLibrary({super.key});

  @override
  State<ResourceAndLibrary> createState() => _ResourceAndLibraryState();
}

class _ResourceAndLibraryState extends State<ResourceAndLibrary> {
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
              builder: (BuildContext context) => const UploadFilesResource()));
        },
        child: Container(
            width: 55,
            height: 55,
            decoration: BoxDecoration(
                color: AllColor.primaryDeepColor,
                borderRadius: BorderRadius.circular(1000)),
            child: Icon(
              Icons.add,
              color: AllColor.white,
              size: 35,
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
          sizeBoxHeight(8),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.0),
                child: SizedBox(
                  width: sizeWidth * 0.6,
                  height: 40,
                  child: TextField(
                    // controller: searchControler,
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),

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
                      contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      hoverColor: Color.fromRGBO(54, 54, 54, 1),
                      label: madiumText15('Enter keywords'),
                      labelStyle: const TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              Spacer(),
              InkWell(
                onTap: () {
                  FocusScope.of(context).unfocus();
                },
                child: Container(
                    width: sizeWidth * 0.35,
                    height: 38,
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: AllColor.primaryDeepColor,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Center(
                      child: madiumText15(
                        "Search",
                        color: AllColor.white,
                      ),
                    )),
              ),
              sizeBoxWidth(8)
            ],
          ),
        ],
      ),
    );
  }
}
