import 'package:flutter/material.dart';

Widget clockOptionTile({
  required String title,
  required bool val,
  required Function(bool) onChanged,
}) {
  return Padding(
    padding: EdgeInsets.all(16),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        Switch(value: val, onChanged: onChanged),
      ],
    ),
  );
}
