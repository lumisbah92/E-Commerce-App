import 'package:e_commerce_app/widgets/smallText.dart';
import 'package:flutter/cupertino.dart';

class TextWithIcon extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String text;

  const TextWithIcon({super.key, required this.icon, required this.iconColor, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: iconColor),
        const SizedBox(width: 5),
        SmallText(text: text),
      ],
    );
  }
}
