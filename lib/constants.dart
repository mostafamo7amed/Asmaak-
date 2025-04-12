import 'dart:ui';
import 'core/utils/app_manager/app_colors.dart';

final String cloudinaryImageUrl =
    "https://api.cloudinary.com/v1_1/dpptitrf1/image/upload";
final String cloudinaryVideoUrl =
    "https://api.cloudinary.com/v1_1/dpptitrf1/video/upload";
final String uploadPreset = "asmaak";

final List<Color> colors = [
  AppColor.lightPinkColor,
  AppColor.primaryColor,
  AppColor.greenColor,
  AppColor.pinkColor,
  AppColor.purpleColor,
  AppColor.orangeTextColor,
  AppColor.lightGreenColor,
  AppColor.lightGrayColor,
  AppColor.yellowTextColor,
  AppColor.purpleTextColor,
];

const String userCollection = 'users';
const String adminCollection = 'admin';
const String categoryCollection = 'category';
const String lessonCollection = 'lessons';
const String quizCollection = 'quiz';
const String notificationCollection = 'notification';
const String userProgressCollection = 'progress';
const String quizResultCollection = 'quiz score';

const String authKey = 'authKey';
const String uidKey = 'uidKey';
const String basicsKey = 'basicsKey';
const String lessonsKey = 'lessonsKey';
