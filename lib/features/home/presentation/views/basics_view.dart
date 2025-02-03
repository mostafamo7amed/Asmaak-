import 'package:asmaak/features/home/domain/entity/lesson_entity.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_basics_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class BasicsView extends StatelessWidget {
  BasicsView({super.key});

  final List<LessonEntity> characters = [
    LessonEntity(
      id: '1',
      title: 'الألف',
      image: AssetsData.a,
      cover: AssetsData.a1,
    ),
    LessonEntity(
      id: '2',
      title: 'الباء',
      image: AssetsData.b,
      cover: AssetsData.b2,
    ),
    LessonEntity(
      id: '3',
      title: 'التاء',
      image: AssetsData.c,
      cover: AssetsData.c3,
    ),
    LessonEntity(
      id: '4',
      title: 'الثاء',
      image: AssetsData.d,
      cover: AssetsData.d4,
    ),
    LessonEntity(
      id: '5',
      title: 'الجيم',
      image: AssetsData.e,
      cover: AssetsData.e5,
    ),
    LessonEntity(
      id: '6',
      title: 'الحاء',
      image: AssetsData.f,
      cover: AssetsData.f6,
    ),
    LessonEntity(
      id: '7',
      title: 'الخاء',
      image: AssetsData.g,
      cover: AssetsData.g7,
    ),
    LessonEntity(
      id: '8',
      title: 'الدال',
      image: AssetsData.h,
      cover: AssetsData.h8,
    ),
    LessonEntity(
      id: '9',
      title: 'الذال',
      image: AssetsData.i,
      cover: AssetsData.i9,
    ),
    LessonEntity(
      id: '10',
      title: 'الراء',
      image: AssetsData.j,
      cover: AssetsData.j10,
    ),
    LessonEntity(
      id: '11',
      title: 'الزاي',
      image: AssetsData.k,
      cover: AssetsData.k11,
    ),
    LessonEntity(
      id: '12',
      title: 'الصاد',
      image: AssetsData.l,
      cover: AssetsData.l14,
    ),
    LessonEntity(
      id: '13',
      title: 'الضاد',
      image: AssetsData.m,
      cover: AssetsData.m15,
    ),
    LessonEntity(
      id: '14',
      title: 'السين',
      image: AssetsData.n,
      cover: AssetsData.n12,
    ),
    LessonEntity(
      id: '15',
      title: 'الشين',
      image: AssetsData.o,
      cover: AssetsData.o13,
    ),
    LessonEntity(
      id: '16',
      title: 'الطاء',
      image: AssetsData.p,
      cover: AssetsData.p16,
    ),
    LessonEntity(
      id: '17',
      title: 'الظاء',
      image: AssetsData.q,
      cover: AssetsData.q17,
    ),
    LessonEntity(
      id: '18',
      title: 'العاين',
      image: AssetsData.r,
      cover: AssetsData.r18,
    ),
    LessonEntity(
      id: '19',
      title: 'الغاين',
      image: AssetsData.s,
      cover: AssetsData.s19,
      ),
      LessonEntity(
      id: '20',
      title: 'الفاء',
      image: AssetsData.t,
      cover: AssetsData.t20,
      ),
      LessonEntity(
      id: '21',
      title: 'القاف',
      image: AssetsData.u,
      cover: AssetsData.u21,
      ),
      LessonEntity(
      id: '22',
      title: 'الكاف',
      image: AssetsData.v,
      cover: AssetsData.v22,
      ),
      LessonEntity(
      id: '23',
      title: 'اللام',
      image: AssetsData.w,
      cover: AssetsData.w23,
      ),
      LessonEntity(
      id: '24',
      title: 'الميم',
      image: AssetsData.x,
      cover: AssetsData.x24,
      ),
      LessonEntity(
      id: '25',
      title: 'الهاء',
      image: AssetsData.y,
      cover: AssetsData.y26,
      ),
      LessonEntity(
      id: '26',
      title: 'الواو',
      image: AssetsData.z,
      cover: AssetsData.z27,
      ),
      LessonEntity(
      id: '27',
      title: 'النون',
      image: AssetsData.zz,
      cover: AssetsData.zz25,
      ),
      LessonEntity(
      id: '28',
      title: 'الياء',
      image: AssetsData.zzz,
      cover: AssetsData.zzz28,
      ),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context,title: 'الأحرف'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: characters.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              customBasicsDialog(context: context, message: characters[index].title, image: characters[index].cover);
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
                      child: Image.asset(
                        characters[index].image,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      characters[index].title,
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
