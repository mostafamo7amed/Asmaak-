import 'package:asmaak/core/utils/widgets/custom_view_lesson_dialog.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/add_lesson_dialog.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/build_admin_appbar.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/custom_dropdown_list.dart';
import 'package:asmaak/features/admin/presentation/views/widgets/edit_lesson_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';
import '../../../../core/utils/widgets/custom_alert_dialog.dart';

class ManageLessonView extends StatelessWidget {
  const ManageLessonView({super.key});
  static const routeName = 'manageLessonView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAdminAppBar(context, title: 'ادارة الدروس', showBack: true),
      floatingActionButton: FloatingActionButton(onPressed: () {
        addLessonDialog(context);
      },
        backgroundColor: AppColor.greenColor,
        child: Text('اضافة',style: Styles.bold16.copyWith(color: AppColor.whiteColor),),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            CustomDropdownList(onChanged: (value) {

            }, list: ['حيوانات', 'عائلة', 'مشاعر', ]
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: GridView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: 4,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () => customViewLessonDialog(context: context, message: 'قطة', image: AssetsData.cate,isManage: false, onConfirm: () {}),
                  child: Card(
                    elevation: 2,
                    color: AppColor.whiteColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Expanded(
                            child: SvgPicture.asset(
                              height: 100,
                              width: 100,
                              AssetsData.cate,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            'قطة',
                            style: Styles.bold16,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  customAlertDialog(
                                    context: context,
                                    message: 'هل تريد حذف هذا الدرس؟',
                                    onConfirm: () {
                                      //Navigator.pop(context);
                                    },
                                  );
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColor.redColor)),
                                  child: Icon(
                                    Icons.delete,
                                    color: AppColor.redColor,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  editLessonDialog(context);
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(color: AppColor.greenColor)),
                                  child: Icon(
                                    Icons.edit,
                                    color: AppColor.greenColor,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
