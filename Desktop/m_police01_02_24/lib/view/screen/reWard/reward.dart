import 'package:flutter/material.dart';
import 'package:m_police01_02_24/utils/allColors/allColors.dart';
import 'package:m_police01_02_24/widgets/commonAllText/allCustomText.dart';
import 'package:m_police01_02_24/widgets/commonAppBar/customAppBar.dart';

class Reward extends StatefulWidget {
  const Reward({super.key});

  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> with SingleTickerProviderStateMixin {
  late TransformationController controller;
  TapDownDetails? tapDownDetails;

  late AnimationController animationController;
  Animation<Matrix4>? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller = TransformationController();

    animationController =
        AnimationController(vsync: this, duration: Duration(microseconds: 300));
  }

  @override
  void dispose() {
    animationController.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customCMAppBar(
            bigText18(
              "Reward",
              color: AllColor.white,
            ), onPressed: () {
          Navigator.pop(context);
        }, centerTitle: false),
        body: Container(
          alignment: Alignment.center,
          padding: EdgeInsets.all(24),
          child: buildImage(),
        ));
  }

  Widget buildImage() => GestureDetector(
        onDoubleTapDown: (details) {
          tapDownDetails = details;
        },
        onDoubleTap: () {
          final position = tapDownDetails!.localPosition;
          final double scale = 3;

          final x = -position.dx * (scale - 1);
          final y = -position.dy * (scale - 1);

          final zoomed = Matrix4.identity()
            ..translate(x, y)
            ..scale(scale);
          final end =
              controller.value.isIdentity() ? zoomed : Matrix4.identity();
          controller.value = end;

          animation = Matrix4Tween(begin: controller.value, end: end).animate(
              CurveTween(curve: Curves.easeInOut).animate(animationController));

          animationController.forward(from: 0);
        },
        child: InteractiveViewer(
            maxScale: 6.0,
            minScale: 0.01,
            clipBehavior: Clip.none,
            transformationController: controller,
            panEnabled: true,
            scaleEnabled: true,
            child: AspectRatio(
              aspectRatio: 1,
              child: Image.network(
                "https://cutewallpaper.org/37x/bs5d66eaj/2094013914.jpg",
                fit: BoxFit.fill,
              ),
            )),
      );
}
