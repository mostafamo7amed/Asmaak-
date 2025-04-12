part of 'user_cubit.dart';

abstract class UserState {}

final class UserInitial extends UserState {}
final class GetUserLoadingState extends UserState {}
final class GetUserSuccessState extends UserState {}
final class GetUserErrorState extends UserState {}
final class UserGetCategoriesLoadingState extends UserState {}
final class UserGetCategoriesSuccessState extends UserState {}
final class UserGetCategoriesErrorState extends UserState {}

final class UserGetLessonsLoadingState extends UserState {}
final class UserGetLessonsSuccessState extends UserState {}
final class UserGetLessonsErrorState extends UserState {}
final class MarkAsDoneLoadingState extends UserState {}
final class MarkAsDoneSuccessState extends UserState {}
final class MarkAsDoneErrorState extends UserState {}

final class UpdateLevelAndCoinsLoadingState extends UserState {}
final class UpdateLevelAndCoinsSuccessState extends UserState {}
final class UpdateLevelAndCoinsErrorState extends UserState {}

final class GetCategoryProgressLoadingState extends UserState {}
final class GetCategoryProgressSuccessState extends UserState {}
final class GetCategoryProgressErrorState extends UserState {}

final class GetUserLevelLoadingState extends UserState {}
final class GetUserLevelSuccessState extends UserState {}
final class GetUserLevelErrorState extends UserState {}

final class GetUserProgressLoadingState extends UserState {}
final class GetUserProgressSuccessState extends UserState {}
final class GetUserProgressErrorState extends UserState {}

final class UpdateUserPhotoLoadingState extends UserState {}
final class UpdateUserPhotoSuccessState extends UserState {}
final class UpdateUserPhotoErrorState extends UserState {}

final class PikImageSuccessState extends UserState {}
final class PikImageErrorState extends UserState {}

final class UpdateUserLoadingState extends UserState {}
final class UpdateUserSuccessState extends UserState {}
final class UpdateUserErrorState extends UserState {}

final class GetUserNotificationLoadingState extends UserState {}
final class GetUserNotificationSuccessState extends UserState {}
final class GetUserNotificationErrorState extends UserState {}

final class GetQuizLoadingState extends UserState {}
final class GetQuizSuccessState extends UserState {}
final class GetQuizErrorState extends UserState {}

final class SaveQuizScoreLoadingState extends UserState {}
final class SaveQuizScoreSuccessState extends UserState {}
final class SaveQuizScoreErrorState extends UserState {}

final class GetQuizHistoryLoadingState extends UserState {}
final class GetQuizHistorySuccessState extends UserState {}
final class GetQuizHistoryErrorState extends UserState {}

