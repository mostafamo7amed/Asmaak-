import 'package:asmaak/core/helper_functions/get_random_color.dart';
import 'package:asmaak/core/utils/app_manager/app_colors.dart';
import 'package:asmaak/features/home/presentation/views/widgets/build_home_app_bar.dart';
import 'package:asmaak/features/home/presentation/views/widgets/counter_widget.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_dialog.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class QuizView extends StatelessWidget {
  const QuizView({super.key});
  static const routeName = 'quizView';

  @override
  Widget build(BuildContext context) {
    FlickManager flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
            Uri.parse(
                'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
            videoPlayerOptions:
            VideoPlayerOptions(allowBackgroundPlayback: false)));
    return Scaffold(
      appBar: buildHomeAppBar(context, title: 'الاختبارات'),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CounterWidget(
                  number: "١",
                  isSelected: false,
                  isCorrect: true,
                  isWrong: false,
                ),
                SizedBox(
                  width: 15,
                ),
                CounterWidget(
                  number: "٢",
                  isSelected: false,
                  isCorrect: false,
                  isWrong: true,
                ),
                SizedBox(
                  width: 15,
                ),
                CounterWidget(
                  number: "٣",
                  isSelected: true,
                  isCorrect: false,
                  isWrong: false,
                ),
                SizedBox(
                  width: 15,
                ),
                CounterWidget(
                  number: "٤",
                  isSelected: false,
                  isCorrect: false,
                  isWrong: false,
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: PageView(
                children: [
                  Column(
                    children: [
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: SizedBox(
                          height: 150,
                          width: MediaQuery.of(context).size.width * .5,
                          child: FlickVideoPlayer(
                            flickManager: flickManager,
                            flickVideoWithControls: FlickVideoWithControls(
                              controls: CustomFlickControls(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        children: [
                          CustomChooseWidget(title: 'فهد',color: AppColor.lightPinkColor,),
                          SizedBox(
                            width: 20,
                          ),
                          CustomChooseWidget(title: 'فيل', color: AppColor.primaryColor,),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          CustomChooseWidget(title: 'سمكة',color: AppColor.greenColor,),
                          SizedBox(
                            width: 20,
                          ),
                          CustomChooseWidget(title: 'فراشة',color: AppColor.pinkColor,),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomChooseWidget extends StatelessWidget {
  const CustomChooseWidget({
    super.key, required this.title, required this.color,
  });
  final String title;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
