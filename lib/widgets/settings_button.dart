import 'package:flutter/material.dart';

class SettingsButton extends StatelessWidget {
  final String label;
  final Widget widget;
  final IconData icon;

  const SettingsButton(
      {required this.label, required this.widget, required this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0, 0, 20.0, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon),
              const SizedBox(width: 10),
              Text(label),
            ],
          ),
          widget,
        ],
      ),
    );
  }
}