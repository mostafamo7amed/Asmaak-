part of 'admin_cubit.dart';

abstract class AdminState {}

final class AdminInitial extends AdminState {}

final class GetAdminLoading extends AdminState {}

final class GetAdminSuccess extends AdminState {}

final class GetAdminError extends AdminState {}

final class PikImageSuccessState extends AdminState {}

final class PikImageErrorState extends AdminState {}

final class AddCategoryLoadingState extends AdminState {}

final class AddCategorySuccessState extends AdminState {}

final class AddCategoryErrorState extends AdminState {}

final class GetCategoriesLoadingState extends AdminState {}

final class GetCategoriesSuccessState extends AdminState {}

final class GetCategoriesErrorState extends AdminState {}

final class DeleteCategoryLoadingState extends AdminState {}

final class DeleteCategorySuccessState extends AdminState {}

final class DeleteCategoryErrorState extends AdminState {}

final class EditCategoryLoadingState extends AdminState {}

final class EditCategorySuccessState extends AdminState {}

final class EditCategoryErrorState extends AdminState {}

final class AddLessonLoadingState extends AdminState {}

final class AddLessonSuccessState extends AdminState {}

final class AddLessonErrorState extends AdminState {}

final class PikVideoSuccessState extends AdminState {}

final class PikVideoErrorState extends AdminState {}

final class GetLessonsLoadingState extends AdminState {}

final class GetLessonsSuccessState extends AdminState {}

final class GetLessonsErrorState extends AdminState {}

final class DeleteLessonLoadingState extends AdminState {}

final class DeleteLessonSuccessState extends AdminState {}

final class DeleteLessonErrorState extends AdminState {}

final class EditLessonLoadingState extends AdminState {}

final class EditLessonSuccessState extends AdminState {}

final class EditLessonErrorState extends AdminState {}

final class AddQuizLoadingState extends AdminState {}

final class AddQuizSuccessState extends AdminState {}

final class AddQuizErrorState extends AdminState {}

final class GetQuizLoadingState extends AdminState {}

final class GetQuizSuccessState extends AdminState {}

final class GetQuizErrorState extends AdminState {}

final class DeleteQuizLoadingState extends AdminState {}

final class DeleteQuizSuccessState extends AdminState {}

final class DeleteQuizErrorState extends AdminState {}

final class GetUsersLoadingState extends AdminState {}

final class GetUsersSuccessState extends AdminState {}

final class GetUsersErrorState extends AdminState {}

final class AddNotificationLoadingState extends AdminState {}

final class AddNotificationSuccessState extends AdminState {}

final class AddNotificationErrorState extends AdminState {}

final class DeleteNotificationLoadingState extends AdminState {}

final class DeleteNotificationSuccessState extends AdminState {}

final class DeleteNotificationErrorState extends AdminState {}

final class GetNotificationsLoadingState extends AdminState {}

final class GetNotificationsSuccessState extends AdminState {}

final class GetNotificationsErrorState extends AdminState {}
