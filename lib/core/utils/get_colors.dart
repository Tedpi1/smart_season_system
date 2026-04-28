import 'dart:math';
import 'dart:ui';

Color getColorDarkColor() {
  final random = Random();

  return Color.fromARGB(
    255,
    random.nextInt(80),
    120 + random.nextInt(120),
    random.nextInt(80),
  );
}