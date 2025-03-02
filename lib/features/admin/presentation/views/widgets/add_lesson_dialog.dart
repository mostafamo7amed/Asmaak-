import 'package:asmaak/features/admin/presentation/views/manager/admin_cubit.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';
import '../../../../../core/utils/widgets/custom_button.dart';
import '../../../../../core/utils/widgets/custom_text_form_field.dart';

Future<dynamic> addLessonDialog(BuildContext context, String categoryId) {
  TextEditingController titleController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  return showDialog(
    barrierDismissible: false,
    context: context,
    builder: (context) {
      return BlocBuilder<AdminCubit, AdminState>(
        builder: (context, state) {
          return Dialog(
            backgroundColor: AppColor.whiteColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: formKey,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'اضافة درس جديد',
                      style:
                          Styles.bold16.copyWith(color: AppColor.primaryColor),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        AdminCubit.get(context).getImageFromGallery();
                      },
                      child: DottedBorder(
                        padding: const EdgeInsets.all(20),
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        color: AppColor.lightGrayColor,
                        dashPattern: const [3, 3],
                        strokeWidth: 1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AdminCubit.get(context).pikedImage == null
                                  ? 'اضافة صورة'
                                  : AdminCubit.get(context)
                                      .pikedImage!
                                      .path
                                      .split('/')
                                      .last,
                              style: Styles.regular16
                                  .copyWith(color: AppColor.lightGrayColor),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GestureDetector(
                      onTap: () {
                        AdminCubit.get(context).getVideoFromGallery();
                      },
                      child: DottedBorder(
                        padding: const EdgeInsets.all(20),
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(10),
                        color: AppColor.lightGrayColor,
                        dashPattern: const [3, 3],
                        strokeWidth: 1.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              AdminCubit.get(context).pikedVideo == null
                                  ? 'اضافة فيديو'
                                  : AdminCubit.get(context)
                                      .pikedVideo!
                                      .path
                                      .split('/')
                                      .last,
                              style: Styles.regular16
                                  .copyWith(color: AppColor.lightGrayColor),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'عنوان الدرس',
                      style: Styles.regular13
                          .copyWith(color: AppColor.lightGrayColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    CustomTextFormField(
                      controller: titleController,
                      hintText: 'مثل : قطة',
                      maxLines: 1,
                      keyboardType: TextInputType.text,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'الرجاء ادخال عنوان الدرس';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: CustomButton(
                            height: 40,
                            text: 'اضافة',
                            color: AppColor.greenColor,
                            textColor: AppColor.whiteColor,
                            onPressed: () {
                              if (formKey.currentState!.validate()) {
                                if (AdminCubit.get(context).pikedImage !=
                                        null &&
                                    AdminCubit.get(context).pikedVideo !=
                                        null) {
                                  AdminCubit.get(context).addLesson(
                                      image:
                                          AdminCubit.get(context).pikedImage!,
                                      video:
                                          AdminCubit.get(context).pikedVideo!,
                                      name: titleController.text,
                                      categoryId: categoryId);
                                  Navigator.pop(context);
                                }
                              }
                            },
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: CustomButton(
                            height: 40,
                            text: 'إلغاء',
                            color: AppColor.lightGrayColor,
                            textColor: AppColor.whiteColor,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      );
    },
  );
}
