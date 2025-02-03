
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/widgets/custom_view_lesson_dialog.dart';
import 'custom_choose_widget.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    super.key,
  });

  @override
  State<QuestionWidget> createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late FlickManager flickManager;
  @override
  void initState() {
    flickManager = FlickManager(
        videoPlayerController: VideoPlayerController.networkUrl(
            Uri.parse(
                'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
            videoPlayerOptions:
            VideoPlayerOptions(allowBackgroundPlayback: false)));
    super.initState();
  }

  @override
  dispose() {
    flickManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
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
            CustomChooseWidget(
              title: 'فهد',
              color: AppColor.lightPinkColor,
            ),
            SizedBox(
              width: 20,
            ),
            CustomChooseWidget(
              title: 'فيل',
              color: AppColor.primaryColor,
            ),
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Row(
          children: [
            CustomChooseWidget(
              title: 'سمكة',
              color: AppColor.greenColor,
            ),
            SizedBox(
              width: 20,
            ),
            CustomChooseWidget(
              title: 'فراشة',
              color: AppColor.pinkColor,
            ),
          ],
        ),
      ],
    );
  }
}
