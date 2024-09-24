import 'package:appbanhangadmin_21t1020483/services/assets_manager.dart';
import 'package:appbanhangadmin_21t1020483/widgets/subtitle_text.dart';
import 'package:flutter/material.dart';

class DashboardButtonWidgets extends StatelessWidget {
  const DashboardButtonWidgets(
      {super.key,
      required this.text,
      required this.imagePath,
      required this.onPressed});
  final String text, imagePath;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onPressed();
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                height: 60,
                width: 60,
              ),
              SizedBox(
                height: 5,
              ),
              SubtitleTextWidget(label: text),
            ],
          ),
        ),
      ),
    );
  }
}
