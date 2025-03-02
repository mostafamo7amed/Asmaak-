import 'package:asmaak/constants.dart';
import 'package:asmaak/core/services/app_references.dart';
import 'package:asmaak/features/home/domain/entity/lesson_entity.dart';
import 'package:asmaak/features/home/presentation/views/widgets/build_home_app_bar.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_basics_dialog.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/app_manager/app_assets.dart';
import '../../../../core/utils/app_manager/app_colors.dart';
import '../../../../core/utils/app_manager/app_styles.dart';

class BasicsView extends StatefulWidget {
  const BasicsView({super.key});

  @override
  State<BasicsView> createState() => _BasicsViewState();
}

class _BasicsViewState extends State<BasicsView> {
  final List<LessonEntity> characters = [
    LessonEntity(
      id: '1',
      title: 'الألف',
      video: AssetsData.a,
      coverImage: AssetsData.a1,
    ),
    LessonEntity(
      id: '2',
      title: 'الباء',
      video: AssetsData.b,
      coverImage: AssetsData.b2,
    ),
    LessonEntity(
      id: '3',
      title: 'التاء',
      video: AssetsData.c,
      coverImage: AssetsData.c3,
    ),
    LessonEntity(
      id: '4',
      title: 'الثاء',
      video: AssetsData.d,
      coverImage: AssetsData.d4,
    ),
    LessonEntity(
      id: '5',
      title: 'الجيم',
      video: AssetsData.e,
      coverImage: AssetsData.e5,
    ),
    LessonEntity(
      id: '6',
      title: 'الحاء',
      video: AssetsData.f,
      coverImage: AssetsData.f6,
    ),
    LessonEntity(
      id: '7',
      title: 'الخاء',
      video: AssetsData.g,
      coverImage: AssetsData.g7,
    ),
    LessonEntity(
      id: '8',
      title: 'الدال',
      video: AssetsData.h,
      coverImage: AssetsData.h8,
    ),
    LessonEntity(
      id: '9',
      title: 'الذال',
      video: AssetsData.i,
      coverImage: AssetsData.i9,
    ),
    LessonEntity(
      id: '10',
      title: 'الراء',
      video: AssetsData.j,
      coverImage: AssetsData.j10,
    ),
    LessonEntity(
      id: '11',
      title: 'الزاي',
      video: AssetsData.k,
      coverImage: AssetsData.k11,
    ),
    LessonEntity(
      id: '12',
      title: 'الصاد',
      video: AssetsData.l,
      coverImage: AssetsData.l14,
    ),
    LessonEntity(
      id: '13',
      title: 'الضاد',
      video: AssetsData.m,
      coverImage: AssetsData.m15,
    ),
    LessonEntity(
      id: '14',
      title: 'السين',
      video: AssetsData.n,
      coverImage: AssetsData.n12,
    ),
    LessonEntity(
      id: '15',
      title: 'الشين',
      video: AssetsData.o,
      coverImage: AssetsData.o13,
    ),
    LessonEntity(
      id: '16',
      title: 'الطاء',
      video: AssetsData.p,
      coverImage: AssetsData.p16,
    ),
    LessonEntity(
      id: '17',
      title: 'الظاء',
      video: AssetsData.q,
      coverImage: AssetsData.q17,
    ),
    LessonEntity(
      id: '18',
      title: 'العاين',
      video: AssetsData.r,
      coverImage: AssetsData.r18,
    ),
    LessonEntity(
      id: '19',
      title: 'الغاين',
      video: AssetsData.s,
      coverImage: AssetsData.s19,
    ),
    LessonEntity(
      id: '20',
      title: 'الفاء',
      video: AssetsData.t,
      coverImage: AssetsData.t20,
    ),
    LessonEntity(
      id: '21',
      title: 'القاف',
      video: AssetsData.u,
      coverImage: AssetsData.u21,
    ),
    LessonEntity(
      id: '22',
      title: 'الكاف',
      video: AssetsData.v,
      coverImage: AssetsData.v22,
    ),
    LessonEntity(
      id: '23',
      title: 'اللام',
      video: AssetsData.w,
      coverImage: AssetsData.w23,
    ),
    LessonEntity(
      id: '24',
      title: 'الميم',
      video: AssetsData.x,
      coverImage: AssetsData.x24,
    ),
    LessonEntity(
      id: '25',
      title: 'الهاء',
      video: AssetsData.y,
      coverImage: AssetsData.y26,
    ),
    LessonEntity(
      id: '26',
      title: 'الواو',
      video: AssetsData.z,
      coverImage: AssetsData.z27,
    ),
    LessonEntity(
      id: '27',
      title: 'النون',
      video: AssetsData.zz,
      coverImage: AssetsData.zz25,
    ),
    LessonEntity(
      id: '28',
      title: 'الياء',
      video: AssetsData.zzz,
      coverImage: AssetsData.zzz28,
    ),
  ];
  List<String> items = List.generate(28, (index) => "Item ${index + 1}");
  Set<String> cachedItems = {};
  @override
  void initState() {
    super.initState();
    loadCachedItems();
  }

  Future<void> loadCachedItems() async {
    List<String> storedItems = await AppReference.getTappedItems(basicsKey);
    setState(() {
      cachedItems = storedItems.toSet();
    });
  }

  void handleTap(String item) async {
    await AppReference.saveTappedItem(basicsKey, item);
    setState(() {
      cachedItems.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildHomeAppBar(
        context,
        title: 'الأحرف',
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: GridView.builder(
          physics: BouncingScrollPhysics(),
          itemCount: characters.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 8),
          itemBuilder: (context, index) {
            final item = items[index];
            final isTapped = cachedItems.contains(item);
            return GestureDetector(
              onTap: () {
                customBasicsDialog(
                    context: context,
                    message: characters[index].title,
                    image: characters[index].coverImage,
                    onConfirm: () {
                      handleTap(item);
                      Navigator.pop(context);
                    });
              },
              child: Card(
                elevation: 2,
                color: isTapped ? AppColor.wightPinkColor : AppColor.whiteColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.asset(
                          characters[index].video,
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
            );
          },
        ),
      ),
    );
  }
}
