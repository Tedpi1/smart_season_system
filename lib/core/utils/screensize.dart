import 'package:flutter/material.dart';

class ScreenSize {
  // Total screen width
  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  // Total screen height
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  // Safe area height (top + bottom padding removed)
  static double safeHeight(BuildContext context) =>
      MediaQuery.of(context).size.height -
          MediaQuery.of(context).padding.top -
          MediaQuery.of(context).padding.bottom;

  // Safe area width (left + right padding removed)
  static double safeWidth(BuildContext context) =>
      MediaQuery.of(context).size.width -
          MediaQuery.of(context).padding.left -
          MediaQuery.of(context).padding.right;

  // Top safe area (status bar height)
  static double topPadding(BuildContext context) =>
      MediaQuery.of(context).padding.top;

  // Bottom safe area (e.g., navigation bar on some devices)
  static double bottomPadding(BuildContext context) =>
      MediaQuery.of(context).padding.bottom;

  // Left safe area
  static double leftPadding(BuildContext context) =>
      MediaQuery.of(context).padding.left;

  // Right safe area
  static double rightPadding(BuildContext context) =>
      MediaQuery.of(context).padding.right;

  // Orientation of the device
  static Orientation orientation(BuildContext context) =>
      MediaQuery.of(context).orientation;

  // Text scale factor (for accessibility)
  static double textScale(BuildContext context) =>
      MediaQuery.of(context).textScaleFactor;

  // Device pixel density
  static double pixelRatio(BuildContext context) =>
      MediaQuery.of(context).devicePixelRatio;
}
