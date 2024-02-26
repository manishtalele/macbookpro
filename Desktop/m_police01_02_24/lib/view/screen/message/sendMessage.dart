import 'dart:developer';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:m_police01_02_24/main.dart';
import 'package:m_police01_02_24/model/polishStationDatamodel.dart';
import 'package:m_police01_02_24/utils/allButtons/allString/allString.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';
import 'package:m_police01_02_24/widgets/sizeBoxHW/sizeBox.dart';
import 'package:multi_select_flutter/bottom_sheet/multi_select_bottom_sheet_field.dart';
import 'package:multi_select_flutter/chip_display/multi_select_chip_display.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multi_select_flutter/util/multi_select_list_type.dart';

const List<String> SelectIGRMChannellist = <String>[
  'Message type',
  'official',
  'birthday',
];

class SendMessageScreen extends StatefulWidget {
  const SendMessageScreen({super.key});

  @override
  State<SendMessageScreen> createState() => _SendMessageScreenState();
}

class _SendMessageScreenState extends State<SendMessageScreen> {
  String dropdownValueIGRM = SelectIGRMChannellist.first;
  List<Animal> _selectedAnimals5 = [];
  List _selectedAnimals2 = [];

  static final List<Animal> _animals = [
    Animal(id: 1, name: "Lionsdhfkjshfkjwdhdfkjwhfkjh"),
    Animal(id: 2, name: "Flamingokdnckdck"),
    Animal(id: 3, name: "Hippodfndnvkdnv"),
    Animal(id: 4, name: "Horsedkdcndkcnkd"),
    Animal(id: 5, name: "Tigerdkvndn"),
    Animal(id: 6, name: "Penguin"),
    Animal(id: 7, name: "Spider"),
    Animal(id: 8, name: "Snake"),
    Animal(id: 9, name: "Bear"),
  ];
  String _radioValue1 = AllString.radioBTNOwn;

  void handleRadioValueChange1(value) {
    setState(() {
      log(value.toString());
      _radioValue1 = value;
    });
  }

  final _items = _animals
      .map((animal) => MultiSelectItem<Animal>(animal, animal.name!))
      .toList();

  @override
  void initState() {
    // TODO: implement initState
    _selectedAnimals5 = _animals;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customPSBAppBar(
          TextSize20("Send Message",
              fontweignt: FontWeight.bold, color: AllColor.white),
          centerTitle: false, onPressed: () {
        Navigator.pop(context);
      }, onPressed1: () {}, onPressed2: () {}),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: SizedBox(
          width: sizeWidth,
          height: sizeHeight,
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
              Row(
                children: [
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.3,
                        child: Radio(
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return AllColor.primaryColor;
                          }),
                          value: AllString.radioBTNIndI,
                          groupValue: _radioValue1,
                          onChanged: handleRadioValueChange1,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            handleRadioValueChange1(AllString.radioBTNIndI);
                          },
                          child: TextSize20(AllString.radioBTNIndI))
                    ],
                  ),
                  sizeBoxWidth(100.0),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1.3,
                        child: Radio(
                          fillColor: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                            return AllColor.primaryColor;
                          }),
                          value: AllString.radioBTNGROUP,
                          groupValue: _radioValue1,
                          onChanged: handleRadioValueChange1,
                        ),
                      ),
                      GestureDetector(
                          onTap: () {
                            handleRadioValueChange1(AllString.radioBTNGROUP);
                          },
                          child: TextSize20(AllString.radioBTNGROUP))
                    ],
                  ),
                ],
              ),
              _radioValue1 == "Individual"
                  ? Expanded(child: individualWidget())
                  : Expanded(child: groupWidget())
            ],
          ),
        ),
      ),
    );
  }

  showDialogCreateNew() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => Dialog(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(5.0), // Decrease this value as needed
        ),
        child: SingleChildScrollView(
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
                child: bigText18("Create Group", color: AllColor.white),
              ),
              sizeBoxHeight(10),
              applicationSourceText(lebelText: "Group Name"),
              sizeBoxHeight(10),
              applicationSourceText(lebelText: "Group Discription"),
              sizeBoxHeight(20),
              Padding(
                padding:
                    const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      MultiSelectBottomSheetField(
                        initialChildSize: 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AllColor.primaryColor,
                            width: 1,
                          ),
                        ),
                        // listType: MultiSelectListType.CHIP,
                        searchable: true,
                        buttonText: bigText18("Police Station",
                            color: AllColor.primaryColor),
                        title: bigText18("Police Station",
                            color: AllColor.primaryColor),
                        items: _items,
                        buttonIcon: const Icon(Icons.arrow_drop_down),
                        onConfirm: (values) {
                          setState(() {
                            _selectedAnimals2 = values;
                          });
                        },
                        chipDisplay: MultiSelectChipDisplay(
                          onTap: (value) {
                            setState(() {
                              _selectedAnimals2.remove(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      MultiSelectBottomSheetField(
                        initialChildSize: 0.4,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: AllColor.primaryColor,
                            width: 1,
                          ),
                        ),
                        // listType: MultiSelectListType.CHIP,
                        searchable: true,
                        buttonText:
                            bigText18("User", color: AllColor.primaryColor),
                        title: bigText18("User", color: AllColor.primaryColor),
                        items: _items,
                        buttonIcon: const Icon(Icons.arrow_drop_down),
                        onConfirm: (values) {
                          setState(() {
                            _selectedAnimals2 = values;
                          });
                        },
                        chipDisplay: MultiSelectChipDisplay(
                          onTap: (value) {
                            setState(() {
                              _selectedAnimals2.remove(value);
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: sizeWidth * 0.35,
                        height: 38,
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: AllColor.primaryDeepColor,
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Center(
                          child: bigText18(
                            "Create",
                            color: AllColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
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
                          child: bigText18(
                            "Cancel",
                            color: AllColor.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  groupWidget() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            onTap: () {
              showDialogCreateNew();
            },
            child: Container(
                width: sizeWidth,
                height: 38,
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                decoration: BoxDecoration(
                  color: AllColor.primaryDeepColor,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: bigText18(
                        "Create New",
                        color: AllColor.white,
                      ),
                    ),
                    Icon(
                      Icons.add,
                      color: AllColor.white,
                    ),
                  ],
                )),
          ),
        ),
        sizeBoxHeight(8),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              bigText18(
                "Group   :",
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Container(
                  width: sizeWidth * 0.7,
                  height: 38,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: AllColor.primaryColor)),
                  child: DropdownButtonHideUnderline(
                    child: ButtonTheme(
                      alignedDropdown: true,
                      child: DropdownButton<String>(
                        focusColor: AllColor.blueGrey.withOpacity(0.1),
                        value: dropdownValueIGRM,
                        isExpanded: true,
                        icon: const Icon(Icons.keyboard_arrow_down_outlined),
                        elevation: 16,
                        style: const TextStyle(color: Colors.deepPurple),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurpleAccent,
                        ),
                        onChanged: (String? value) {
                          setState(() {
                            dropdownValueIGRM = value!;
                          });
                        },
                        items:
                            SelectIGRMChannellist.map<DropdownMenuItem<String>>(
                                (String value) {
                          return DropdownMenuItem<String>(
                              value: value, child: madiumText15(value));
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        sizeBoxHeight(8),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                MultiSelectBottomSheetField(
                  initialChildSize: 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AllColor.primaryColor,
                      width: 1,
                    ),
                  ),
                  listType: MultiSelectListType.CHIP,
                  searchable: true,
                  buttonText: bigText18("User", color: AllColor.primaryColor),
                  title: bigText18("User", color: AllColor.primaryColor),
                  items: _items,
                  buttonIcon: const Icon(Icons.arrow_drop_down),
                  onConfirm: (values) {
                    setState(() {
                      _selectedAnimals2 = values;
                    });
                  },
                  chipDisplay: MultiSelectChipDisplay(
                    onTap: (value) {
                      setState(() {
                        _selectedAnimals2.remove(value);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: sizeWidth,
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AllColor.primaryColor)),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  focusColor: AllColor.blueGrey.withOpacity(0.1),
                  value: dropdownValueIGRM,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValueIGRM = value!;
                    });
                  },
                  items: SelectIGRMChannellist.map<DropdownMenuItem<String>>(
                      (String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: madiumText15(value));
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        sizeBoxHeight(8),
        applicationSourceText(lebelText: "Message Tital"),
        sizeBoxHeight(8),
        applicationSourceText(lebelText: "Message By"),
        sizeBoxHeight(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
              width: sizeWidth,
              alignment: Alignment.centerLeft,
              // decoration: BoxDecoration(
              //     color: AllColor.red,
              //     borderRadius: BorderRadius.circular(10)),
              child: TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Message...",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 5, right: 5, top: 5),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AllColor.black.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(6)),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AllColor.black.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(6)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AllColor.black.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(6)),
                ),
              )),
        ),
        sizeBoxHeight(8),
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
                          text: 'Attachment',
                          style: TextStyle(color: AllColor.black, fontSize: 16))
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
                    //   customDialogBox(
                    //       "You can not attach more than 5 file", context,
                    //       yes: "OK", onTap: () {
                    //     Navigator.pop(context);
                    //   });
                    //   log("image greater then 5");
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
        sizeBoxHeight(20),
        Container(
            width: sizeWidth * 0.3,
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: AllColor.primaryDeepColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: madiumText15(
                "Send",
                color: AllColor.white,
              ),
            )),
      ],
    );
  }

  individualWidget() {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                MultiSelectBottomSheetField(
                  initialChildSize: 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AllColor.primaryColor,
                      width: 1,
                    ),
                  ),
                  listType: MultiSelectListType.CHIP,
                  searchable: true,
                  buttonText: bigText18("Police Station"),
                  title: bigText18("Police Station"),
                  items: _items,
                  buttonIcon: const Icon(Icons.arrow_drop_down),
                  onConfirm: (values) {
                    setState(() {
                      _selectedAnimals2 = values;
                    });
                  },
                  chipDisplay: MultiSelectChipDisplay(
                    onTap: (value) {
                      setState(() {
                        _selectedAnimals2.remove(value);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 8.0, left: 8.0, bottom: 8.0),
          child: Container(
            child: Column(
              children: <Widget>[
                MultiSelectBottomSheetField(
                  initialChildSize: 0.4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: AllColor.primaryColor,
                      width: 1,
                    ),
                  ),
                  listType: MultiSelectListType.CHIP,
                  searchable: true,
                  buttonText: bigText18("User", color: AllColor.primaryColor),
                  title: bigText18("User", color: AllColor.primaryColor),
                  items: _items,
                  buttonIcon: const Icon(Icons.arrow_drop_down),
                  onConfirm: (values) {
                    setState(() {
                      _selectedAnimals2 = values;
                    });
                  },
                  chipDisplay: MultiSelectChipDisplay(
                    onTap: (value) {
                      setState(() {
                        _selectedAnimals2.remove(value);
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
            width: sizeWidth,
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: AllColor.primaryColor)),
            child: DropdownButtonHideUnderline(
              child: ButtonTheme(
                alignedDropdown: true,
                child: DropdownButton<String>(
                  focusColor: AllColor.blueGrey.withOpacity(0.1),
                  value: dropdownValueIGRM,
                  isExpanded: true,
                  icon: const Icon(Icons.keyboard_arrow_down_outlined),
                  elevation: 16,
                  style: const TextStyle(color: Colors.deepPurple),
                  underline: Container(
                    height: 2,
                    color: Colors.deepPurpleAccent,
                  ),
                  onChanged: (String? value) {
                    setState(() {
                      dropdownValueIGRM = value!;
                    });
                  },
                  items: SelectIGRMChannellist.map<DropdownMenuItem<String>>(
                      (String value) {
                    return DropdownMenuItem<String>(
                        value: value, child: madiumText15(value));
                  }).toList(),
                ),
              ),
            ),
          ),
        ),
        sizeBoxHeight(8),
        applicationSourceText(lebelText: "Message Tital"),
        sizeBoxHeight(8),
        applicationSourceText(lebelText: "Message By"),
        sizeBoxHeight(8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Container(
              width: sizeWidth,
              alignment: Alignment.centerLeft,
              // decoration: BoxDecoration(
              //     color: AllColor.red,
              //     borderRadius: BorderRadius.circular(10)),
              child: TextField(
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: "Message...",
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.only(left: 5, right: 5, top: 5),
                  focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AllColor.black.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(6)),
                  border: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AllColor.black.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(6)),
                  enabledBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AllColor.black.withOpacity(0.5)),
                      borderRadius: BorderRadius.circular(6)),
                ),
              )),
        ),
        sizeBoxHeight(8),
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
                          text: 'Attachment',
                          style: TextStyle(color: AllColor.black, fontSize: 16))
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
                    //   customDialogBox(
                    //       "You can not attach more than 5 file", context,
                    //       yes: "OK", onTap: () {
                    //     Navigator.pop(context);
                    //   });
                    //   log("image greater then 5");
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
        sizeBoxHeight(20),
        Container(
            width: sizeWidth * 0.3,
            height: 38,
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            decoration: BoxDecoration(
              color: AllColor.primaryDeepColor,
              borderRadius: BorderRadius.circular(6),
            ),
            child: Center(
              child: madiumText15(
                "Send",
                color: AllColor.white,
              ),
            )),
      ],
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

  List<File> _imageFiles = [];
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
            border: OutlineInputBorder(
              borderSide: BorderSide(color: AllColor.primaryColor),
              borderRadius: const BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                width: 1,
                color: AllColor.primaryColor,
              ),
              borderRadius: BorderRadius.circular(5),
            ),
            labelText: lebelText,
            contentPadding: EdgeInsets.fromLTRB(10, 0, 0, 0),
            hoverColor: Color.fromRGBO(54, 54, 54, 1),
            hintStyle: const TextStyle(
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
