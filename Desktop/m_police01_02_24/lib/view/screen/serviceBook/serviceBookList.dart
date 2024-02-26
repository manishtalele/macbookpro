import 'package:flutter/material.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

class ServiceBookList extends StatefulWidget {
  const ServiceBookList({super.key});

  @override
  State<ServiceBookList> createState() => _ServiceBookListState();
}

class _ServiceBookListState extends State<ServiceBookList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCMAppBar(bigText18("Service Book", color: AllColor.white),
          centerTitle: false, onPressed: () {
        Navigator.pop(context);
      }),
      bottomSheet: Container(
          width: sizeWidth,
          height: 40,
          color: AllColor.white,
          child: Center(
            child: normalText13("Power By @ Sannpri Technologies",
                fontweignt: FontWeight.bold, color: AllColor.primaryColor),
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          children: [
            sizeBoxHeight(8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                      width: sizeWidth * 0.45,
                      height: 38,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: AllColor.primaryDeepColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: madiumText15(
                          "Print",
                          color: AllColor.white,
                        ),
                      )),
                  Spacer(),
                  Container(
                      width: sizeWidth * 0.45,
                      height: 38,
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: AllColor.primaryDeepColor,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Center(
                        child: madiumText15(
                          "Back",
                          color: AllColor.white,
                        ),
                      )),
                ],
              ),
            ),
            const serviceDetaillistScrolll(),
            sizeBoxHeight(40)
          ],
        ),
      ),
    );
  }
}

class serviceDetaillistScrolll extends StatefulWidget {
  const serviceDetaillistScrolll({super.key});

  @override
  State<serviceDetaillistScrolll> createState() =>
      _serviceDetaillistScrolllState();
}

class _serviceDetaillistScrolllState extends State<serviceDetaillistScrolll> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        physics: NeverScrollableScrollPhysics(),
        //  BouncingScrollPhysics(),
        shrinkWrap: true,
        itemCount: 20,
        itemBuilder: (BuildContext context, index) {
          return Padding(
            padding: EdgeInsets.only(right: 8.0, left: 8.0, top: 5, bottom: 3),
            child: Container(
                width: sizeWidth * 0.96,
                height: 45,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.05),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(color: Colors.black26)),
                child: madiumText15(
                  "Official Details${index + 1}",
                  color: Colors.black,
                )),
          );
        });
  }
}
