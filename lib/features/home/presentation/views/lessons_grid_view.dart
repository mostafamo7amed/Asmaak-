import 'package:asmaak/core/utils/app_manager/app_assets.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/helper_functions/get_random_color.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class LessonsGridView extends StatelessWidget {
  const LessonsGridView({super.key});

  static const routeName = 'lessons-grid';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,title: 'الدروس'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: 30,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              customDialog(
                image: AssetsData.cate,
                  context: context, message: 'قطة', onConfirm: () {});
            },
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
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
