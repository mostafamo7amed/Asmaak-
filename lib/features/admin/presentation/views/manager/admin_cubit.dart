import 'dart:convert';
import 'dart:io';
import 'package:asmaak/core/helper_functions/get_random_number.dart';
import 'package:asmaak/core/helper_functions/get_snack_bar.dart';
import 'package:asmaak/features/admin/domain/entity/admin_entity.dart';
import 'package:asmaak/features/admin/domain/entity/category_entity.dart';
import 'package:asmaak/features/admin/domain/entity/notification_entity.dart';
import 'package:asmaak/features/admin/domain/entity/question_entity.dart';
import 'package:asmaak/features/admin/domain/entity/quiz_entity.dart';
import 'package:asmaak/features/auth/domain/entity/user_entity.dart';
import 'package:asmaak/features/home/domain/entity/lesson_entity.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

import '../../../../../constants.dart';
part 'admin_state.dart';

class AdminCubit extends Cubit<AdminState> {
  AdminCubit() : super(AdminInitial());

  static AdminCubit get(context) => BlocProvider.of(context);

  AdminEntity? adminModel;
  void getAdmin(String uid) {
    emit(GetAdminLoading());
    FirebaseFirestore.instance
        .collection(adminCollection)
        .doc(uid)
        .get()
        .then((value) {
      adminModel = AdminEntity.fromMap(value.data()!);
      emit(GetAdminSuccess());
    }).catchError((e) {
      emit(GetAdminError());
    });
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

  File? pikedVideo;
  Future<void> getVideoFromGallery() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    if (pickedFile != null) {
      pikedVideo = File(pickedFile.path);
      emit(PikVideoSuccessState());
    } else {
      emit(PikVideoErrorState());
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

  Future<String?> uploadVideoToCloudinary(File videoFile) async {
    var request = http.MultipartRequest(
      'POST',
      Uri.parse(cloudinaryVideoUrl),
    );
    request.fields['upload_preset'] = uploadPreset;
    request.files
        .add(await http.MultipartFile.fromPath('file', videoFile.path));

    var response = await request.send();
    var responseData = await response.stream.toBytes();
    var jsonResponseString = String.fromCharCodes(responseData);
    var jsonMap = jsonDecode(jsonResponseString);

    return jsonMap['url'];
  }

  //// manage categories

  Future<void> addCategory(File image, String name) async {
    emit(AddCategoryLoadingState());
    String? url = await uploadImageToCloudinary(image);
    if (url != null) {
      int id = getRandomNumber();
      CategoryEntity categoryEntity =
          CategoryEntity(id: id.toString(), name: name, image: url);
      FirebaseFirestore.instance
          .collection(categoryCollection)
          .doc(id.toString())
          .set(categoryEntity.toMap())
          .then((value) {
        pikedImage = null;
        emit(AddCategorySuccessState());
      }).catchError((error) {
        pikedImage = null;
        emit(AddCategoryErrorState());
      });
    }
  }

  List<CategoryEntity> categories = [];
  Future<void> getCategories() async {
    emit(GetCategoriesLoadingState());
    await FirebaseFirestore.instance
        .collection(categoryCollection)
        .get()
        .then((value) {
      categories =
          value.docs.map((e) => CategoryEntity.fromMap(e.data())).toList();
      emit(GetCategoriesSuccessState());
    }).catchError((error) {
      getSnackBar(error.toString());
      emit(GetCategoriesErrorState());
    });
  }

  deleteCategory(String id) {
    emit(DeleteCategoryLoadingState());
    FirebaseFirestore.instance
        .collection(categoryCollection)
        .doc(id)
        .delete()
        .then((value) {
      emit(DeleteCategorySuccessState());
    }).catchError((error) {
      emit(DeleteCategoryErrorState());
    });
  }

  editCategory(
      {required String id,
      required String name,
      File? image,
      required String url}) async {
    String? imageUrl;
    if (image != null) {
      imageUrl = await uploadImageToCloudinary(image);
    } else {
      imageUrl = url;
    }
    if (imageUrl != null) {
      CategoryEntity categoryEntity =
          CategoryEntity(id: id, name: name, image: imageUrl);
      emit(EditCategoryLoadingState());
      FirebaseFirestore.instance
          .collection(categoryCollection)
          .doc(categoryEntity.id.toString())
          .update(categoryEntity.toMap())
          .then((value) {
        pikedImage = null;
        emit(EditCategorySuccessState());
      }).catchError((error) {
        pikedImage = null;
        emit(EditCategoryErrorState());
      });
    }
  }
  //// manage lessons

  addLesson(
      {required String categoryId,
      required String name,
      required File image,
      required File video}) async {
    emit(AddLessonLoadingState());
    String? url = await uploadImageToCloudinary(image);
    getSnackBar('يتم الان رفع الفيديو, يرجى الانتظار');
    String? videoUrl = await uploadVideoToCloudinary(video);
    getSnackBar('تم رفع الفيديو بنجاح');
    if (url != null && videoUrl != null) {
      int id = getRandomNumber();
      LessonEntity lessonEntity = LessonEntity(
          id: id.toString(), coverImage: url, video: videoUrl, title: name);
      FirebaseFirestore.instance
          .collection(categoryCollection)
          .doc(categoryId)
          .collection(lessonCollection)
          .doc(id.toString())
          .set(lessonEntity.toMap())
          .then((value) {
        pikedImage = null;
        pikedVideo = null;
        emit(AddLessonSuccessState());
      }).catchError((error) {
        pikedImage = null;
        pikedVideo = null;
        emit(AddLessonErrorState());
      });
    } else {
      getSnackBar('تأكد من اختيار صورة وفيديو');
      pikedImage = null;
      pikedVideo = null;
      emit(AddLessonErrorState());
    }
  }

  List<LessonEntity> lessons = [];
  getLessons(String categoryId) {
    emit(GetLessonsLoadingState());
    FirebaseFirestore.instance
        .collection(categoryCollection)
        .doc(categoryId)
        .collection(lessonCollection)
        .get()
        .then((value) {
      lessons = value.docs.map((e) => LessonEntity.fromMap(e.data())).toList();
      emit(GetLessonsSuccessState());
    }).catchError((error) {
      getSnackBar(error.toString());
      emit(GetLessonsErrorState());
    });
  }

  deleteLesson({required String categoryId, required String lessonId}) {
    emit(DeleteLessonLoadingState());
    FirebaseFirestore.instance
        .collection(categoryCollection)
        .doc(categoryId)
        .collection(lessonCollection)
        .doc(lessonId)
        .delete()
        .then((value) {
      emit(DeleteLessonSuccessState());
    }).catchError((error) {
      emit(DeleteLessonErrorState());
    });
  }

  eitLesson(
      {required String categoryId,
      required String lessonId,
      required String name,
      File? image,
      File? video,
      required String imageUrl,
      required String videoUrl}) async {
    String? newImageUrl, newVideoUrl;
    if (image != null) {
      newImageUrl = await uploadImageToCloudinary(image);
    } else {
      newImageUrl = imageUrl;
    }
    if (video != null) {
      newVideoUrl = await uploadVideoToCloudinary(pikedVideo!);
    } else {
      newVideoUrl = videoUrl;
    }

    if (newImageUrl != null && newVideoUrl != null) {
      LessonEntity lessonEntity = LessonEntity(
          id: lessonId,
          coverImage: newImageUrl,
          video: newVideoUrl,
          title: name);
      emit(EditLessonLoadingState());
      FirebaseFirestore.instance
          .collection(categoryCollection)
          .doc(categoryId)
          .collection(lessonCollection)
          .doc(lessonEntity.id.toString())
          .update(lessonEntity.toMap())
          .then((value) {
        pikedImage = null;
        emit(EditLessonSuccessState());
      }).catchError((error) {
        pikedImage = null;
        emit(EditLessonErrorState());
      });
    }
  }

  // question
  Future<File?> getQuestionVideoFromGallery() async {
    final pickedFile = await picker.pickVideo(source: ImageSource.gallery);
    File? video;
    if (pickedFile != null) {
      video = File(pickedFile.path);
      emit(PikVideoSuccessState());
      return video;
    } else {
      emit(PikVideoErrorState());
      return video;
    }
  }

  addQuiz(
      {required QuestionEntity question1,
      required q1Video,
      required QuestionEntity question2,
      required q2Video,
      required QuestionEntity question3,
      required q3Video,
      required QuestionEntity question4,
      required q4Video,
      required String categoryId,
      required int point,
      required int diamonds}) async {
    emit(AddQuizLoadingState());
    getSnackBar('يتم الان رفع الفيديو, يرجى الانتظار');
    String? q1VideoUrl = await uploadVideoToCloudinary(q1Video);
    getSnackBar('يرجى الانتظار متبقي %25');
    String? q2VideoUrl = await uploadVideoToCloudinary(q2Video);
    getSnackBar('يرجى الانتظار متبقي %50');
    String? q3VideoUrl = await uploadVideoToCloudinary(q3Video);
    getSnackBar('يرجى الانتظار متبقي %75');
    String? q4VideoUrl = await uploadVideoToCloudinary(q4Video);
    getSnackBar('تم رفع الفيديوهات يتم الان حفظ الاختبار');
    if (q1VideoUrl != null &&
        q2VideoUrl != null &&
        q3VideoUrl != null &&
        q4VideoUrl != null) {
      QuizEntity quizEntity = QuizEntity(
          id: '1',
          question1: QuestionEntity(
              q1VideoUrl,
              question1.answer1,
              question1.answer2,
              question1.answer3,
              question1.answer4,
              question1.correctAnswer),
          question2: QuestionEntity(
              q2VideoUrl,
              question2.answer1,
              question2.answer2,
              question2.answer3,
              question2.answer4,
              question2.correctAnswer),
          question3: QuestionEntity(
              q3VideoUrl,
              question3.answer1,
              question3.answer2,
              question3.answer3,
              question3.answer4,
              question3.correctAnswer),
          question4: QuestionEntity(
              q4VideoUrl,
              question4.answer1,
              question4.answer2,
              question4.answer3,
              question4.answer4,
              question4.correctAnswer),
          points: point,
          diamonds: diamonds);
      FirebaseFirestore.instance
          .collection(categoryCollection)
          .doc(categoryId)
          .collection(quizCollection)
          .doc('1')
          .set(quizEntity.toMap())
          .then((value) {
        emit(AddQuizSuccessState());
      }).catchError((error) {
        emit(AddQuizErrorState());
      });
    }
  }

  QuizEntity? quiz;
  getQuiz({required String categoryId}) async {
    emit(GetQuizLoadingState());
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

  deleteQuiz({required String categoryId}) async {
    emit(DeleteQuizLoadingState());
    await FirebaseFirestore.instance
        .collection(categoryCollection)
        .doc(categoryId)
        .collection(quizCollection)
        .doc('1')
        .delete()
        .then((value) {
      emit(DeleteQuizSuccessState());
    }).catchError((error) {
      emit(DeleteQuizErrorState());
    });
  }

  List<UserEntity> allUsers = [];
  getUsers() async {
    emit(GetUsersLoadingState());
    await FirebaseFirestore.instance
        .collection(userCollection)
        .get()
        .then((value) {
      allUsers = value.docs.map((e) => UserEntity.fromMap(e.data())).toList();
      emit(GetUsersSuccessState());
    }).catchError((error) {
      emit(GetUsersErrorState());
    });
  }

  addNotification({required String message}) async {
    emit(AddNotificationLoadingState());
    String id = getRandomNumber().toString();
    NotificationEntity notificationEntity =
        NotificationEntity(message: message, id: id);
    await FirebaseFirestore.instance
        .collection(notificationCollection)
        .doc(id)
        .set(notificationEntity.toMap())
        .then((value) {
      emit(AddNotificationSuccessState());
    }).catchError((error) {
      emit(AddNotificationErrorState());
    });
  }
  deleteNotification({required String id}) async {
    emit(DeleteNotificationLoadingState());
    await FirebaseFirestore.instance
        .collection(notificationCollection)
        .doc(id)
        .delete()
        .then((value) {
      emit(DeleteNotificationSuccessState());
    }).catchError((error) {
      emit(DeleteNotificationErrorState());
    });
  }

  List<NotificationEntity> allNotifications = [];
  getNotifications() async {
    emit(GetNotificationsLoadingState());
    await FirebaseFirestore.instance
        .collection(notificationCollection)
        .get()
        .then((value) {
      allNotifications =
          value.docs.map((e) => NotificationEntity.fromJson(e.data())).toList();
      emit(GetNotificationsSuccessState());
    }).catchError((error) {
      emit(GetNotificationsErrorState());
    });
  }
}
