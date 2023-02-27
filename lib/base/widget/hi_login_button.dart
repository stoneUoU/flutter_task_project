import 'package:flutter/material.dart';
import 'package:flutter_task_project/base/config/hi_colors.dart';

class HiLoginButton extends StatelessWidget {
  final String title;
  final bool enable;
  final VoidCallback onPressed;

  const HiLoginButton(this.title,
      {Key? key, this.enable = true, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: MaterialButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        height: 45,
        onPressed: enable ? onPressed : null,
        disabledColor: color_FFb5c7f2,
        color: color_FF4272e0,
        child: Text(title, style: TextStyle(color: Colors.white, fontSize: 16)),
      ),
    );
  }
}
