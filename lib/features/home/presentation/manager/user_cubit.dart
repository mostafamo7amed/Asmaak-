import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:asmaak/core/services/app_references.dart';
import 'package:asmaak/features/admin/domain/entity/notification_entity.dart';
import 'package:asmaak/features/auth/domain/entity/user_entity.dart';
import 'package:asmaak/features/home/domain/entity/level_entity.dart';
import 'package:asmaak/features/home/domain/entity/quiz_history_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../../constants.dart';
import '../../../../core/helper_functions/get_random_number.dart';
import '../../../../core/helper_functions/get_snack_bar.dart';
import '../../../admin/domain/entity/category_entity.dart';
import '../../../admin/domain/entity/quiz_entity.dart';
import '../../domain/entity/category_progress.dart';
import '../../domain/entity/lesson_entity.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  static UserCubit get(context) => BlocProvider.of(context);

  UserEntity? userEntity;
  void getUser(String uid) {
    {
      emit(GetUserLoadingState());
      FirebaseFirestore.instance
          .collection(userCollection)
          .doc(uid)
          .get()
          .then((value) {
        userEntity = UserEntity.fromMap(value.data()!);
        emit(GetUserSuccessState());
      }).catchError((e) {
        emit(GetUserErrorState());
      });
    }
  }

  List<CategoryEntity> categories = [];
  Map<String, int> categoriesLength = {};
  int allLessonsCount = 0;
  void getAllCategories() async {
    categoriesLength = {};
    allLessonsCount = 0;
    emit(UserGetCategoriesLoadingState());
    await FirebaseFirestore.instance
        .collection(categoryCollection)
        .get()
        .then((value) {
      categories =
          value.docs.map((e) => CategoryEntity.fromMap(e.data())).toList();
      for (var i in categories) {
        FirebaseFirestore.instance
            .collection(categoryCollection)
            .doc(i.id)
            .collection(lessonCollection)
            .get()
            .then((value) {
          if (value.docs.isNotEmpty) {
            categoriesLength[i.id] = value.docs.length;
            allLessonsCount += value.docs.length;
          } else {
            categoriesLength[i.id] = 0;
          }
          emit(UserGetCategoriesSuccessState());
        }).catchError((error) {
          getSnackBar(error.toString());
          emit(UserGetCategoriesErrorState());
        });
      }
    }).catchError((error) {
      //getSnackBar(error.toString());
      emit(UserGetCategoriesErrorState());
    });
  }

  List<LessonEntity> lessons = [];
  getAllLessons(String categoryId) {
    emit(UserGetLessonsLoadingState());
    FirebaseFirestore.instance
        .collection(categoryCollection)
        .doc(categoryId)
        .collection(lessonCollection)
        .get()
        .then((value) {
      lessons = value.docs.map((e) => LessonEntity.fromMap(e.data())).toList();
      emit(UserGetLessonsSuccessState());
    }).catchError((error) {
      getSnackBar(error.toString());
      emit(UserGetLessonsErrorState());
    });
  }

  markAsLearned(String lessonId, String categoryId) {
    emit(MarkAsDoneLoadingState());
    CategoryProgress categoryProgress = CategoryProgress(
      lessonId: lessonId,
      isLearned: true,
    );
    FirebaseFirestore.instance
        .collection(userProgressCollection)
        .doc(userEntity!.uid)
        .collection(categoryCollection)
        .doc(categoryId)
        .set({
      'id': categoryId,
    });
    FirebaseFirestore.instance
        .collection(userProgressCollection)
        .doc(userEntity!.uid)
        .collection(categoryCollection)
        .doc(categoryId)
        .collection(lessonCollection)
        .doc(lessonId)
        .set(categoryProgress.toMap())
        .then(
          (value) => emit(MarkAsDoneSuccessState()),
        )
        .onError(
          (error, stackTrace) => emit(MarkAsDoneErrorState()),
        );
  }

  List<CategoryProgress> categoryProgress = [];
  getCategoryProgress(String categoryId) {
    emit(GetCategoryProgressLoadingState());
    categoryProgress = [];
    FirebaseFirestore.instance
        .collection(userProgressCollection)
        .doc(userEntity!.uid)
        .collection(categoryCollection)
        .doc(categoryId)
        .collection(lessonCollection)
        .get()
        .then((value) {
      categoryProgress =
          value.docs.map((e) => CategoryProgress.fromMap(e.data())).toList();
      emit(GetCategoryProgressSuccessState());
    }).onError((error, stackTrace) {
      emit(GetCategoryProgressErrorState());
    });
  }

  updateLevelAndCoins(String level, int coins, int diamonds) {
    emit(UpdateLevelAndCoinsLoadingState());
    LevelEntity levelEntity =
        LevelEntity(level: level, coins: coins, diamonds: diamonds);
    FirebaseFirestore.instance
        .collection(userProgressCollection)
        .doc(userEntity!.uid)
        .set(levelEntity.toJson())
        .then(
          (value) => emit(UpdateLevelAndCoinsSuccessState()),
        )
        .onError(
          (error, stackTrace) => emit(UpdateLevelAndCoinsErrorState()),
        );
  }

  LevelEntity? levelEntity;
  getUserLevel() {
    emit(GetUserLevelLoadingState());
    FirebaseFirestore.instance
        .collection(userProgressCollection)
        .doc(AppReference.getData(key: uidKey))
        .get()
        .then((value) {
      levelEntity = LevelEntity.fromJson(value.data()!);
      emit(GetUserLevelSuccessState());
    }).onError((error, stackTrace) {
      emit(GetUserLevelErrorState());
    });
  }

  int totalLessonLearned = 0;
  void getTotalLearnedLessons() async {
    emit(GetUserProgressLoadingState());
    totalLessonLearned = 0;
    try {
      FirebaseFirestore.instance
          .collection('progress')
          .doc(userEntity!.uid)
          .collection('category')
          .get()
          .then((value) async {
        for (var element in value.docs) {
          totalLessonLearned += (await element.reference
                      .collection(lessonCollection)
                      .count()
                      .get())
                  .count ??
              0;
        }
        emit(GetUserProgressSuccessState());
      });
    } catch (e) {
      totalLessonLearned = 0;
      emit(GetUserProgressErrorState());
    }
  }

  File? pikedImage;
  var picker = ImagePicker();
  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      pikedImage = File(pickedFile.path);
      emit(PikImageSuccessState());
    } else {
      emit(PikImageErrorState());
    }
  }

  Future<String?> uploadImageToCloudinary(File imageFile) async {
    var request = http.MultipartRequest("POST", Uri.parse(cloudinaryImageUrl));
    request.fields['upload_preset'] = uploadPreset;
    request.files
        .add(await http.MultipartFile.fromPath('file', imageFile.path));

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var jsonResponseString = String.fromCharCodes(responseData);
    var jsonMap = jsonDecode(jsonResponseString);

    return jsonMap['url'];
  }

  void updateUserPhoto(File image) async {
    emit(UpdateUserPhotoLoadingState());
    String? photoUrl = await uploadImageToCloudinary(image);
    if (photoUrl != null) {
      FirebaseFirestore.instance
          .collection(userCollection)
          .doc(userEntity!.uid)
          .update({"image": photoUrl})
          .then((value) => emit(UpdateUserPhotoSuccessState()))
          .onError((error, stackTrace) => emit(UpdateUserPhotoErrorState()));
    } else {
      getSnackBar("حدث خطأ ، يرجى المحاولة مرة اخرى");
      emit(UpdateUserPhotoErrorState());
    }
  }

  updateUser({
    required String name,
    required String gender,
    required String dateOfBirth,
    required bool receiveNotification,
  }) async {
    emit(UpdateUserLoadingState());
    UserEntity newUserData = UserEntity(
      uid: userEntity!.uid,
      name: name,
      gender: gender,
      email: userEntity!.email,
      image: userEntity!.image,
      dateOfBirth: dateOfBirth,
      level: levelEntity!.level,
      receiveNotification: receiveNotification,
      fcmToken: userEntity!.fcmToken,
    );
    FirebaseFirestore.instance
        .collection(userCollection)
        .doc(newUserData.uid)
        .update(newUserData.toMap())
        .then((value) => emit(UpdateUserSuccessState()))
        .onError((error, stackTrace) => emit(UpdateUserErrorState()));
  }

  List<NotificationEntity> notificationList = [];
  getUserNotification() {
    emit(GetUserNotificationLoadingState());
    FirebaseFirestore.instance
        .collection(notificationCollection)
        .get()
        .then((value) {
      notificationList =
          value.docs.map((e) => NotificationEntity.fromJson(e.data())).toList();
      emit(GetUserNotificationSuccessState());
    }).catchError((e) {
      emit(GetUserNotificationErrorState());
    });
  }

  QuizEntity? quiz;
  getQuiz({required String categoryId}) async {
    emit(GetQuizLoadingState());
    quiz = null;
    await FirebaseFirestore.instance
        .collection(categoryCollection)
        .doc(categoryId)
        .collection(quizCollection)
        .doc('1')
        .get()
        .then((value) {
      quiz = QuizEntity.fromMap(value.data() ?? {});
      emit(GetQuizSuccessState());
    }).catchError((error) {
      quiz = null;
      emit(GetQuizErrorState());
    });
  }

  saveQuizScore({required String score, required String result}) async {
    emit(SaveQuizScoreLoadingState());

    int id = getRandomNumber();
    QuizHistoryEntity quizHistory = QuizHistoryEntity(
      id: id.toString(),
      score: score,
      result: result,
    );
    await FirebaseFirestore.instance
        .collection(userProgressCollection)
        .doc(userEntity!.uid)
        .collection(quizResultCollection)
        .doc(id.toString())
        .set(quizHistory.toMap())
        .then((value) {
      emit(SaveQuizScoreSuccessState());
    }).catchError((error) {
      emit(SaveQuizScoreErrorState());
    });
  }

  List<QuizHistoryEntity> quizHistoryList = [];
  getQuizHistory() async {
    emit(GetQuizHistoryLoadingState());
    await FirebaseFirestore.instance
        .collection(userProgressCollection)
        .doc(userEntity!.uid)
        .collection(quizResultCollection)
        .get()
        .then((value) {
      quizHistoryList =
          value.docs.map((e) => QuizHistoryEntity.fromMap(e.data())).toList();
      emit(GetQuizHistorySuccessState());
    }).catchError((error) {
      emit(GetQuizHistoryErrorState());
    });
  }
}
