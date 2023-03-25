import 'package:News_API/res/colors/app_colors.dart';
import 'package:flutter/material.dart';

class InternetExpWidget extends StatefulWidget {
  final VoidCallback onPress;
  const InternetExpWidget({Key? key, required this.onPress}) : super(key: key);

  @override
  State<InternetExpWidget> createState() => _InternetExpWidgetState();
}

class _InternetExpWidgetState extends State<InternetExpWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          const Icon(Icons.cloud_off),
          const SizedBox(
            height: 20,
          ),
          const Center(
              child: Text("No Internet , Please check your connection")),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: widget.onPress,
            child: Container(
              height: 40,
              width: 100,
              decoration: const BoxDecoration(
                color: AppColor.orangeColor,
              ),
              child: const Center(child: Text("Retry")),
            ),
          )
        ],
      ),
    );
  }
}
