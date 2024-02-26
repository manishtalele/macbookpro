import 'dart:developer';
import 'dart:io';
import 'package:drop_down_search_field/drop_down_search_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m_police01_02_24/dialogBox/customDialogBox.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';

List<File> _imageFiles = [];
const List<String> SelectLeaveCityName = <String>[
  'Select Chanel',
  'Call(Voice)',
  'Email',
  'Letter/Applicat'
];

const List<String> SelectLeave = <String>[
  'Select Chanel',
  'Call(Voice)',
  'Email',
  'Letter/Applicat'
];

class LeaveApplicationAttachSubmit extends StatefulWidget {
  const LeaveApplicationAttachSubmit({super.key});

  @override
  State<LeaveApplicationAttachSubmit> createState() =>
      _LeaveApplicationAttachSubmitState();
}

class _LeaveApplicationAttachSubmitState
    extends State<LeaveApplicationAttachSubmit> {
  String SelectLeaveCityNameData = SelectLeaveCityName.first;

  // List<File> _imageFiles = [];
  SuggestionsBoxController suggestionBoxController = SuggestionsBoxController();
  SuggestionsBoxController suggestionCityBoxController =
      SuggestionsBoxController();

  final TextEditingController _dropdownSearchFieldController =
      TextEditingController();
  final TextEditingController _dropdownCittySearchFieldController =
      TextEditingController();
  List<String> getSuggestions(String query) {
    List<String> matches = <String>[];
    matches.addAll(stateNameLlist);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  List<String> getSuggestionsCity(String query) {
    List<String> matches = <String>[];
    matches.addAll(cityNameLlist);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }

  final List<String> cityNameLlist = [
    'MUMBAI',
    'PUNE',
    'KOLKATA',
    'AZAMGRAH',
    'INDOR',
    'BHOPAL',
    'LUDHIYANNA',
    'AHAMADABAD',
  ];

  final List<String> stateNameLlist = [
    'ANDRA PRADESH',
    'ARUNACHAL PRADESH',
    'ASSAM',
    'BIHAR',
    'CHHATTISGARH',
    'DADRA AND NAGAR HAVELI',
    'DELHI',
    'GOA',
    'GUJARAT'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customPSBAppBar(
          TextSize20("Leave Application",
              fontweignt: FontWeight.bold, color: AllColor.white),
          centerTitle: false, onPressed: () {
        Navigator.pop(context);
      }, onPressed1: () {}, onPressed2: () {}),
      floatingActionButton: Container(
        width: sizeWidth,
        height: 50,
        child: Stack(children: <Widget>[
          Positioned(
            left: 35,
            bottom: 0.0,
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: sizeWidth * 0.40,
                height: 45,
                child: FloatingActionButton.extended(
                  heroTag: "btn1",
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  backgroundColor: AllColor.primaryDeepColor,
                  label: Text(
                    'Back',
                    style: TextStyle(fontSize: 18, color: AllColor.white),
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                        8.0), // Adjust the value as needed
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Container(
              width: sizeWidth * 0.40,
              height: 45,
              child: FloatingActionButton.extended(
                heroTag: "btn2",
                onPressed: () {},
                backgroundColor: AllColor.primaryDeepColor,
                label: Text(
                  'Submit',
                  style: TextStyle(fontSize: 18, color: AllColor.white),
                ),
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Adjust the value as needed
                ),
              ),
            ),
          )
        ]),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Container(
                width: sizeWidth,
                height: 34,
                color: AllColor.lightorangee,
                child: Center(
                  child: madiumText15(AllString.giridharShitaram,
                      color: AllColor.white),
                )),
            sizeBoxHeight(10),
            applicationSourceText(lebelText: "Address"),
            sizeBoxHeight(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  suggestionBoxController.close();
                },
                child: SizedBox(
                  width: sizeWidth,
                  height: 38,
                  child: DropDownSearchFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          suffixIcon:
                              const Icon(Icons.keyboard_arrow_down_outlined),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          labelText: 'Select State',
                          labelStyle: TextStyle(
                              color: AllColor.primaryColor, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      controller: _dropdownSearchFieldController,
                    ),
                    suggestionsCallback: (pattern) {
                      return getSuggestions(pattern);
                    },
                    itemBuilder: (context, String suggestion) {
                      return ListTile(
                        title: Text(
                          suggestion,
                          textAlign: TextAlign.left, // Align text to the left
                        ),
                      );
                    },
                    onSuggestionSelected: (String suggestion) {
                      setState(() {
                        _dropdownSearchFieldController.text = suggestion;
                      });
                    },
                    suggestionsBoxController: suggestionBoxController,
                    displayAllSuggestionWhenTap: true,
                  ),
                ),
              ),
            ),
            sizeBoxHeight(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  suggestionCityBoxController.close();
                },
                child: SizedBox(
                  width: sizeWidth,
                  height: 38,
                  child: DropDownSearchFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      decoration: InputDecoration(
                          suffixIcon:
                              const Icon(Icons.keyboard_arrow_down_outlined),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          labelText: 'Select City',
                          labelStyle: TextStyle(
                              color: AllColor.primaryColor, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      controller: _dropdownCittySearchFieldController,
                    ),
                    suggestionsCallback: (pattern) {
                      return getSuggestionsCity(pattern);
                    },
                    itemBuilder: (context, String suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },
                    onSuggestionSelected: (String suggestion) {
                      setState(() {
                        _dropdownCittySearchFieldController.text = suggestion;
                      });
                    },
                    suggestionsBoxController: suggestionBoxController,
                    displayAllSuggestionWhenTap: true,
                  ),
                ),
              ),
            ),
            sizeBoxHeight(10),
            Row(
              children: [
                SizedBox(
                  width: sizeWidth * 0.5,
                  child: applicationSourceText(lebelText: "Mobile No 1"),
                ),
                const Spacer(),

                SizedBox(
                  width: sizeWidth * 0.5,
                  child:
                      applicationSourceText(lebelText: "Alternate Mobile No."),
                )

                // applicationSourceText(lebelText: "Alternate Mobile No."),
              ],
            ),
            sizeBoxHeight(10),
            applicationSourceText(lebelText: "Emergency Email Id"),
            sizeBoxHeight(5),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  SizedBox(
                    width: sizeWidth * 0.45,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: '*', style: TextStyle(color: AllColor.red)),
                          TextSpan(
                              text: 'Change Handover To',
                              style: TextStyle(
                                  color: AllColor.black, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  sizeBoxWidth(30),
                  InkWell(
                    onTap: () {
                      showDialogChargeHanndOver();
                    },
                    child: madiumText15("Select Here",
                        color: AllColor.primaryColor, fontSize: 16.0),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  SizedBox(
                    width: sizeWidth * 0.4,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                              text: 'Leave Approving Authority',
                              style: TextStyle(
                                  color: AllColor.black, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  sizeBoxWidth(45),
                  bigText18("ANANT BANDGAR")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              child: Row(
                children: [
                  SizedBox(
                    width: sizeWidth * 0.4,
                    child: Text.rich(
                      TextSpan(
                        children: [
                          _imageFiles.isEmpty
                              ? TextSpan(
                                  text: 'Attachment',
                                  style: TextStyle(
                                      color: AllColor.black, fontSize: 16))
                              : TextSpan(
                                  text: 'File Attached : ${_imageFiles.length}',
                                  style: TextStyle(
                                      color: AllColor.green, fontSize: 16)),
                        ],
                      ),
                    ),
                  ),
                  // sizeBoxWidth(45),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      if (_imageFiles.length <= 4) {
                        setState(() {
                          showDialogBox();

                          log("check image file:-" + _imageFiles.toString());
                        });
                      } else {
                        customDialogBox(
                            "You can not attach more than 5 file", context,
                            yes: "OK", onTap: () {
                          Navigator.pop(context);
                        });
                        log("image greater then 5");
                      }
                    },
                    child: Container(
                        width: sizeWidth * 0.45,
                        height: 38,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: AllColor.primaryDeepColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: madiumText15(
                            "BROWSE",
                            color: AllColor.white,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            sizeBoxHeight(5),
            ImageExpandedList(
              imageFiles: _imageFiles,
            ),
            sizeBoxHeight(30)
          ],
        ),
      ),
    );
  }

  showDialogChargeHanndOver() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(5.0), // Decrease this value as needed
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              width: sizeWidth,
              height: 50,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: AllColor.primaryDeepColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
              child: bigText18("HandOver To", color: AllColor.white),
            ),
            sizeBoxHeight(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  suggestionBoxController.close();
                },
                child: SizedBox(
                  width: sizeWidth,
                  height: 38,
                  child: DropDownSearchFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          suffixIcon:
                              const Icon(Icons.keyboard_arrow_down_outlined),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          labelText: 'Unit',
                          labelStyle: TextStyle(
                              color: AllColor.primaryColor, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      controller: _dropdownSearchFieldController,
                    ),
                    suggestionsCallback: (pattern) {
                      return getSuggestions(pattern);
                    },
                    itemBuilder: (context, String suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },
                    onSuggestionSelected: (String suggestion) {
                      setState(() {
                        _dropdownSearchFieldController.text = suggestion;
                      });
                    },
                    suggestionsBoxController: suggestionBoxController,
                    displayAllSuggestionWhenTap: true,
                  ),
                ),
              ),
            ),
            sizeBoxHeight(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  suggestionBoxController.close();
                },
                child: SizedBox(
                  width: sizeWidth,
                  height: 38,
                  child: DropDownSearchFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          suffixIcon:
                              const Icon(Icons.keyboard_arrow_down_outlined),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          labelText: 'Sub Unit',
                          labelStyle: TextStyle(
                              color: AllColor.primaryColor, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      controller: _dropdownSearchFieldController,
                    ),
                    suggestionsCallback: (pattern) {
                      return getSuggestions(pattern);
                    },
                    itemBuilder: (context, String suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },
                    onSuggestionSelected: (String suggestion) {
                      setState(() {
                        _dropdownSearchFieldController.text = suggestion;
                      });
                    },
                    suggestionsBoxController: suggestionBoxController,
                    displayAllSuggestionWhenTap: true,
                  ),
                ),
              ),
            ),
            sizeBoxHeight(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  suggestionBoxController.close();
                },
                child: SizedBox(
                  width: sizeWidth,
                  height: 38,
                  child: DropDownSearchFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          suffixIcon:
                              const Icon(Icons.keyboard_arrow_down_outlined),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          labelText: 'Designation',
                          labelStyle: TextStyle(
                              color: AllColor.primaryColor, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      controller: _dropdownSearchFieldController,
                    ),
                    suggestionsCallback: (pattern) {
                      return getSuggestions(pattern);
                    },
                    itemBuilder: (context, String suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },
                    onSuggestionSelected: (String suggestion) {
                      setState(() {
                        _dropdownSearchFieldController.text = suggestion;
                      });
                    },
                    suggestionsBoxController: suggestionBoxController,
                    displayAllSuggestionWhenTap: true,
                  ),
                ),
              ),
            ),
            sizeBoxHeight(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: GestureDetector(
                onTap: () {
                  suggestionBoxController.close();
                },
                child: SizedBox(
                  width: sizeWidth,
                  height: 38,
                  child: DropDownSearchFormField(
                    textFieldConfiguration: TextFieldConfiguration(
                      textAlign: TextAlign.left,
                      decoration: InputDecoration(
                          suffixIcon:
                              const Icon(Icons.keyboard_arrow_down_outlined),
                          contentPadding:
                              const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          labelText: 'Name',
                          labelStyle: TextStyle(
                              color: AllColor.primaryColor, fontSize: 15),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5))),
                      controller: _dropdownSearchFieldController,
                    ),
                    suggestionsCallback: (pattern) {
                      return getSuggestions(pattern);
                    },
                    itemBuilder: (context, String suggestion) {
                      return ListTile(
                        title: Text(suggestion),
                      );
                    },
                    onSuggestionSelected: (String suggestion) {
                      setState(() {
                        _dropdownSearchFieldController.text = suggestion;
                      });
                    },
                    suggestionsBoxController: suggestionBoxController,
                    displayAllSuggestionWhenTap: true,
                  ),
                ),
              ),
            ),
            sizeBoxHeight(10),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                            "Cancel",
                            color: AllColor.white,
                          ),
                        )),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
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
                            "Save",
                            color: AllColor.white,
                          ),
                        )),
                  ),
                ],
              ),
            ),
            sizeBoxHeight(20),
          ],
        ),
      ),
    );
  }

  showDialogBox() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(12.0), // Decrease this value as needed
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              sizeBoxHeight(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: madiumText15("Select Document"),
                ),
              ),
              Divider(
                color: Colors.blueGrey.withOpacity(0.5),
              ),
              InkWell(
                onTap: () {
                  imagePickerFromGaCa(ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.image,
                        size: 25,
                        color: AllColor.primaryColor,
                      ),
                      sizeBoxWidth(10),
                      bigText18("Galary")
                    ],
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  imagePickerFromGaCa(ImageSource.camera);
                  Navigator.pop(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.camera_alt,
                        size: 25,
                        color: AllColor.primaryColor,
                      ),
                      sizeBoxWidth(10),
                      bigText18("Camera")
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  ImagePicker picker = ImagePicker();
  imagePickerFromGaCa(source) async {
    final pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null) {
      setState(() {
        _imageFiles.add(File(pickedFile.path));
      });

      log("check image file:-" + _imageFiles.toString());
    }
  }

  applicationSourceText(
      {String AppNName = "",
      TextEditingController? conntrolerText,
      lebelText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: SizedBox(
        height: 38,
        child: TextField(
          controller: conntrolerText,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 2,
                color: AllColor.backgroundTop,
              ),
              borderRadius: BorderRadius.circular(5),
            ),

            labelText: lebelText,
            contentPadding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
            hoverColor: const Color.fromRGBO(54, 54, 54, 1),
            // hintText: 'Type Name',
            labelStyle: TextStyle(
              fontSize: 14,
              color: AllColor.primaryColor,
            ),
            hintStyle: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}

class ImageShow extends StatefulWidget {
  final File image;
  ImageShow({
    super.key,
    required this.image,
  });

  @override
  State<ImageShow> createState() => _ImageShowState();
}

class _ImageShowState extends State<ImageShow> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCMAppBar(
          bigText18(AllString.showImage,
              fontweignt: FontWeight.bold, color: AllColor.white),
          centerTitle: false, onPressed: () {
        Navigator.pop(context);
      }),
      body: SizedBox(
        width: sizeWidth,
        height: sizeHeight,
        child: Center(
          child: InteractiveViewer(
            maxScale: 6.0,
            minScale: 0.01,
            boundaryMargin: const EdgeInsets.all(5),
            child: AspectRatio(aspectRatio: .5, child: Image.file(widget.image)),
          ),
        ),
      ),
    );
  }
}

class ImageExpandedList extends StatefulWidget {
  final List imageFiles;

  ImageExpandedList({
    super.key,
    required this.imageFiles,
  });

  @override
  State<ImageExpandedList> createState() => _ImageExpandedListState();
}

class _ImageExpandedListState extends State<ImageExpandedList> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: widget.imageFiles.length,
      itemBuilder: (context, index) {
        var imageFile = widget.imageFiles[index];
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(5), // Decrease border radius here
            ),
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: sizeWidth * 0.7,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: TextSize25(
                      imageFile.toString().split("/").last.split("'").first,
                      textAlign: TextAlign.left,
                      fontSize: 15.0),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(CupertinoPageRoute(
                            builder: (BuildContext context) => ImageShow(
                                  image: imageFile,
                                )));
                      },
                      icon: const Icon(Icons.remove_red_eye),
                    ),
                    IconButton(
                      onPressed: () {
                        customDialogBox(
                            "Are you sure you want to delete?", context,
                            yes: "Yes", isNotrue: true, onTapno: () {
                          Navigator.pop(context);
                        }, onTap: () {
                          setState(() {
                            widget.imageFiles.remove(imageFile);
                          });

                          Navigator.pop(context);
                        });
                      },
                      icon: const Icon(
                        Icons.delete,
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
