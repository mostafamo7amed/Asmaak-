import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../constants.dart';
import '../../../../../core/helper_functions/get_snack_bar.dart';
import '../../../../../core/services/app_references.dart';
import '../../../../auth/domain/entity/user_entity.dart';
import '../../../../home/domain/entity/level_entity.dart';
part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  static RegisterCubit getCubit(context) => BlocProvider.of(context);
  late User user;
  void registerUser({
    required String email,
    required String password,
    required String name,
  }) async {
    emit(RegisterLoading());
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      user = credential.user!;
      AppReference.setData(key: uidKey, data: credential.user!.uid);
      emit(RegisterSuccess(user));
    } on FirebaseAuthException catch (e) {
      log('Exception: in FirebaseAuthServices.createUserWithEmailAndPassword ${e.toString()}');
      if (e.code == 'weak-password') {
        getSnackBar('الرقم السري ضعيف');
      } else if (e.code == 'email-already-in-use') {
        getSnackBar('البريد الالكتروني مستخدم بالفعل');
      } else if (e.code == 'invalid-email') {
        getSnackBar('البريد الالكتروني غير صالح');
      } else if (e.code == 'network-request-failed') {
        getSnackBar('تحقق من اتصالك بالانترنت');
      } else {
        getSnackBar('حدث خطأ ما من فضلك حاول مرة اخرى');
      }
      emit(RegisterError());
    } catch (e) {
      log('Exception: in FirebaseAuthServices.createUserWithEmailAndPassword ${e.toString()}');
      getSnackBar('حدث خطأ ما من فضلك حاول مرة اخرى');
      emit(RegisterError());
    }
  }

  void createUser({
    required String gender,
    required String dateOfBirth,
    required String userName,
    required String email,
    required String userUid,
  }) async {
    emit(RegisterCreateUserLoading());
    UserEntity userEntity = UserEntity(
      uid: userUid,
      name: userName,
      gender: gender,
      email: email,
      image: '',
      dateOfBirth: dateOfBirth,
      receiveNotification: true,
      fcmToken: '',
      level: 'مستوى مبتدئ',
    );
    await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(user.uid)
        .set(userEntity.toMap())
        .then((value) {
      updateLevelAndCoins(user.uid);
      emit(RegisterCreateUserSuccess());
    }).onError((error, stackTrace) {
      emit(RegisterCreateUserSuccess());
    });
  }

  updateLevelAndCoins(String uid) {
    emit(UpdateLevelAndCoinsLoadingState());
    LevelEntity levelEntity =
        LevelEntity(level: 'مستوي مبتدئ', coins: 0, diamonds: 0);
    FirebaseFirestore.instance
        .collection(userProgressCollection)
        .doc(uid)
        .set(levelEntity.toJson())
        .then(
          (value) => emit(UpdateLevelAndCoinsSuccessState()),
        )
        .onError(
          (error, stackTrace) => emit(UpdateLevelAndCoinsErrorState()),
        );
  }
}
