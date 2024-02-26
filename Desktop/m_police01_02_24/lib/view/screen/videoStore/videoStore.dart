import 'package:flutter/material.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';

class VideosStoreScreen extends StatefulWidget {
  const VideosStoreScreen({super.key});

  @override
  State<VideosStoreScreen> createState() => _VideosStoreScreenState();
}

class _VideosStoreScreenState extends State<VideosStoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customCMAppBar(
          bigText18("VideoStore",
              color: AllColor.white, fontweignt: FontWeight.bold),
          centerTitle: false, onPressed: () {
        Navigator.pop(context);
      }),
    );
  }
}
