import 'package:flutter/material.dart';

Widget digital_row({required d, required isdigital}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "${d.hour.toString().padLeft(2, '0')} : ",
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 70,
          color: Colors.white,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            d.minute.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            d.second.toString().padLeft(2, '0'),
            style: const TextStyle(
              fontSize: 29,
              color: Colors.white,
            ),
          ),
        ],
      )
    ],
  );
}
