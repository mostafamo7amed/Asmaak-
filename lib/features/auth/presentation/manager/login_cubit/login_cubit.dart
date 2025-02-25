import 'dart:developer';

import 'package:asmaak/core/services/app_references.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../constants.dart';
import '../../../../../core/helper_functions/get_snack_bar.dart';
import '../../../../admin/presentation/views/admin_home_view.dart';
import '../../../../home/presentation/views/user_home_root.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());

  Future<void> login(String email, String password) async {
    emit(LoginLoading());
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      AppReference.setData(key: uidKey, data: credential.user!.uid);
      emit(LoginSuccess(credential.user!));
    } on FirebaseAuthException catch (e) {
      log('Exception: in FirebaseAuthServices.signInWithEmailAndPassword ${e.toString()}');
      if (e.code == 'user-not-found') {
        getSnackBar('User not found');
      } else if (e.code == 'wrong-password') {
        getSnackBar('البيانات غير صحيحة');
      } else if (e.code == 'invalid-email') {
        getSnackBar('البيانات غير صحيحة');
      } else if (e.code == 'invalid-credential') {
        getSnackBar('البريد الالكتروني او كلمة المرور غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        getSnackBar('تحقق من اتصالك بالانترنت');
      } else {
        getSnackBar('حدث خطأ ، يرجى المحاولة مرة اخرى');
      }
      emit(LoginError());
    } catch (e) {
      log('Exception: in FirebaseAuthServices.signInWithEmailAndPassword ${e.toString()}');
      getSnackBar('حدث خطأ ، يرجى المحاولة مرة اخرى');
      emit(LoginError());
    }
  }

  void resetPassword(String email) async {
    emit(LoginResetPasswordLoading());
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      emit(LoginResetPasswordSuccess());
    } on FirebaseAuthException catch (e) {
      log('Exception: in FirebaseAuthServices.sendPasswordResetEmail ${e.toString()}');
      if (e.code == 'user-not-found') {
        getSnackBar('البيانات غير صحيحة');
      } else if (e.code == 'wrong-password') {
        getSnackBar('البيانات غير صحيحة');
      } else if (e.code == 'invalid-email') {
        getSnackBar('البيانات غير صحيحة');
      } else if (e.code == 'network-request-failed') {
        getSnackBar('تحقق من اتصالك بالانترنت');
      }
    } catch (e) {
      log('Exception: in FirebaseAuthServices.sendPasswordResetEmail ${e.toString()}');
      getSnackBar('حدث خطأ ، يرجى المحاولة مرة اخرى');
      emit(LoginResetPasswordError());
    }
  }

  Future<void> findUser(String uid, BuildContext context) async {
    var userData = await FirebaseFirestore.instance
        .collection(userCollection)
        .doc(uid)
        .get();
    if (userData.exists) {
      if (context.mounted) {
        Navigator.pushReplacementNamed(context, UserHomeRoot.routeName);
        emit(LoginFindUserState());
      }
    } else {
      var adminData = await FirebaseFirestore.instance
          .collection(adminCollection)
          .doc(uid)
          .get();
      if (adminData.exists) {
        if (context.mounted) {
          Navigator.pushReplacementNamed(context, AdminHomeView.routeName);
          emit(LoginFindAdminState());
        }
      } else {
        if (context.mounted) {
          getSnackBar('البيانات غير صحيحة');
          emit(LoginError());
        }
      }
    }
  }

  void logout() {
    FirebaseAuth.instance.signOut();
    emit(LogOutState());
  }
}
