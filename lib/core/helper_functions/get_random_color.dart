import 'dart:math';
import 'dart:ui';
import '../../constants.dart';

Color getRandomColor() {
  Random random = Random();
  int randomIndex = random.nextInt(colors.length);
  return colors[randomIndex];
}
