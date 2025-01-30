import 'package:asmaak/constants.dart';
import 'package:asmaak/core/helper_functions/get_random_color.dart';
import 'package:asmaak/features/home/presentation/views/lessons_grid_view.dart';
import 'package:asmaak/features/home/presentation/views/widgets/build_home_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class CategoryView extends StatelessWidget {
  const CategoryView({super.key});

  final int length = 20;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeAppBar(
        context,
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, LessonsGridView.routeName);
            },
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
              margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: index < colors.length ? colors[index] : getRandomColor(),
              ),
              child: Row(
                children: [
                  SvgPicture.asset(AssetsData.cate),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: AppColor.whiteColor)),
                        child: Icon(
                          Icons.play_arrow,
                          color: AppColor.whiteColor,
                          size: 30,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: '0',
                              style: Styles.bold16.copyWith(color: AppColor.whiteColor),
                            ),  TextSpan(
                              text: '/',
                              style: Styles.bold16.copyWith(color: AppColor.whiteColor),
                            ),
                            TextSpan(
                              text: '10',
                              style: Styles.bold16.copyWith(color: AppColor.whiteColor),
                            )
                          ],
                      ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text('حيوانات',style: Styles.bold19.copyWith(color: AppColor.whiteColor),)
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
