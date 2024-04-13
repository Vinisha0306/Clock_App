import 'package:flutter/material.dart';

Widget digital_row({required d, required isdigital, required isimage}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        "${d.hour.toString().padLeft(2, '0')} : ",
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 70,
          color: isimage == true ? Colors.white : Colors.black87,
        ),
      ),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            d.minute.toString().padLeft(2, '0'),
            style: TextStyle(
              fontSize: 29,
              fontWeight: FontWeight.bold,
              color: isimage == true ? Colors.white : Colors.black87,
            ),
          ),
          Text(
            d.second.toString().padLeft(2, '0'),
            style: TextStyle(
              fontSize: 29,
              color: isimage == true ? Colors.white : Colors.black87,
            ),
          ),
        ],
      )
    ],
  );
}
