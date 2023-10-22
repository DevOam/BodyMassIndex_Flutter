import 'package:flutter/material.dart';

import '../constants.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final dynamic onPress;
  const RoundIconButton({
    Key? key,
    required this.icon,
    required this.onPress,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      elevation: 6,
      constraints: const BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: const CircleBorder(),
      fillColor: kButtonBackgroundColor,
      child: Icon(icon),
    );
  }
}
