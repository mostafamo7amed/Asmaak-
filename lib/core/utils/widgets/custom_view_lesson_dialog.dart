import 'dart:developer';

import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:asmaak/features/home/presentation/manager/user_cubit.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import '../app_manager/app_colors.dart';
import '../app_manager/app_styles.dart';

Future customViewLessonDialog({
  context,
  message,
  image,
  String? video,
  String? lessonId,
  String? categoryId,
  isManage = true,
}) =>
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        log(video.toString());
        FlickManager flickManager = FlickManager(
            videoPlayerController: VideoPlayerController.networkUrl(
          Uri.parse(video ??
              'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
          videoPlayerOptions:
              VideoPlayerOptions(allowBackgroundPlayback: false),
        ));
        return BlocConsumer<UserCubit, UserState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            var cubit = UserCubit.get(context);
            return Dialog(
              backgroundColor: AppColor.whiteColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            flickManager.dispose();
                            Navigator.pop(context);
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: AppColor.primaryColor)),
                            child: Icon(
                              Icons.close,
                              color: AppColor.primaryColor,
                            ),
                          ),
                        ),
                        const Spacer(),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Image.network(
                      width: 100,
                      height: 100,
                      image,
                      fit: BoxFit.scaleDown,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: FlickVideoPlayer(
                        flickManager: flickManager,
                        flickVideoWithControls: FlickVideoWithControls(
                          videoFit: BoxFit.contain,
                          controls: CustomFlickControls(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      message,
                      textAlign: TextAlign.center,
                      style: Styles.bold19,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    if (isManage)
                      Column(
                        children: [
                          CustomButton(
                            height: 40,
                            width: MediaQuery.of(context).size.width / 3,
                            text: 'تعلمت',
                            textColor: AppColor.whiteColor,
                            onPressed: () {
                              flickManager.dispose();
                              if(categoryId != null && lessonId != null) {
                                cubit.markAsLearned(lessonId, categoryId);
                              }
                              Navigator.pop(context);
                            },
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );

class CustomFlickControls extends StatelessWidget {
  const CustomFlickControls({super.key});

  @override
  Widget build(BuildContext context) {
    return FlickShowControlsAction(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          FlickAutoHideChild(
            showIfVideoNotInitialized: false,
            autoHide: false,
            child: Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FlickPlayToggle(size: 30),
                  FlickCurrentPosition(),
                  FlickTotalDuration(),
                  FlickSoundToggle(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
