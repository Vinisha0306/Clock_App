import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget clock1({required size, required d}) {
  return Container(
    padding: EdgeInsets.all(16),
    alignment: Alignment.center,
    child: Transform.rotate(
      angle: pi / 2,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.6),
          shape: BoxShape.circle,
        ),
        child: Stack(
          children: [
            ...List.generate(
              60,
              (index) => Transform.rotate(
                angle: index * (pi * 2) / 60,
                child: Divider(
                  endIndent:
                      index % 5 == 0 ? size.width * 0.88 : size.width * 0.9,
                  color: index % 5 == 0 ? Colors.red : Colors.white,
                  thickness: index % 5 == 0 ? 3 : 1,
                ),
              ),
            ),
            //hour
            Transform.rotate(
              angle: d.hour * (pi * 2) / 12,
              alignment: Alignment.center,
              child: Divider(
                indent: size.height / 10,
                endIndent: size.width / 2 - 16,
                thickness: 4,
                color: Colors.white,
              ),
            ),

            //min
            Transform.rotate(
              angle: d.minute * (pi * 2) / 60,
              alignment: Alignment.center,
              child: Divider(
                indent: 40,
                endIndent: size.width / 2 - 16,
                thickness: 2.5,
                color: Colors.white,
              ),
            ),

            // sec
            Transform.rotate(
              angle: d.second * (pi * 2) / 60,
              alignment: Alignment.center,
              child: Divider(
                indent: 50,
                endIndent: size.width / 2 - 16,
                thickness: 2,
                color: Colors.red,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
