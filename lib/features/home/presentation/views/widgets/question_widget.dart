import 'package:asmaak/core/utils/app_manager/app_assets.dart';
import 'package:asmaak/features/home/presentation/views/widgets/custom_answer_dialog.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/widgets/custom_view_lesson_dialog.dart';
import 'custom_choose_widget.dart';

class QuestionWidget extends StatefulWidget {
  const QuestionWidget({
    super.key,
    required this.answer1,
    required this.answer2,
    required this.answer3,
    required this.answer4,
    required this.correctAnswer,
    this.isManage = false, this.answerChanged,
  });
  final String answer1;
  final String answer2;
  final String answer3;
  final String answer4;
  final String correctAnswer;
  final bool isManage;
  final ValueChanged<bool>? answerChanged;

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
              onPressed: () {
                if (!widget.isManage) {
                  if (widget.answer1 == widget.correctAnswer) {
                    widget.answerChanged!(true);
                    setState(() {
                    });
                    customAnswerDialog(
                        context: context,
                        message: 'الجواب صحيح',
                        icon: AssetsData.correctAnswer);
                  } else {
                    widget.answerChanged!(false);
                    setState(() {});
                    customAnswerDialog(
                        context: context,
                        message: 'الجواب خاطئ',
                        icon: AssetsData.wrongAnswer);
                  }
                }
              },
              title: widget.answer1,
              color: AppColor.lightPinkColor,
            ),
            SizedBox(
              width: 20,
            ),
            CustomChooseWidget(
              onPressed: () {
                if (!widget.isManage) {
                  if (widget.answer2 == widget.correctAnswer) {
                    widget.answerChanged!(true);
                    setState(() {});
                    customAnswerDialog(
                        context: context,
                        message: 'الجواب صحيح',
                        icon: AssetsData.correctAnswer);
                  } else {
                    widget.answerChanged!(false);
                    setState(() {});
                    customAnswerDialog(
                        context: context,
                        message: 'الجواب خاطئ',
                        icon: AssetsData.wrongAnswer);
                  }
                }
              },
              title: widget.answer2,
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
              onPressed: () {
                if (!widget.isManage) {
                  if (widget.answer3 == widget.correctAnswer) {
                    widget.answerChanged!(true);
                    setState(() {});
                    customAnswerDialog(
                        context: context,
                        message: 'الجواب صحيح',
                        icon: AssetsData.correctAnswer);
                  } else {
                    widget.answerChanged!(false);
                    setState(() {});
                    customAnswerDialog(
                        context: context,
                        message: 'الجواب خاطئ',
                        icon: AssetsData.wrongAnswer);
                  }
                }
              },
              title: widget.answer3,
              color: AppColor.greenColor,
            ),
            SizedBox(
              width: 20,
            ),
            CustomChooseWidget(
              onPressed: () {
                if (!widget.isManage) {
                  if (widget.answer4 == widget.correctAnswer) {
                    widget.answerChanged!(true);
                    setState(() {});
                    customAnswerDialog(
                        context: context,
                        message: 'الجواب صحيح',
                        icon: AssetsData.correctAnswer);
                  } else {
                    widget.answerChanged!(false);
                    setState(() {});
                    customAnswerDialog(
                        context: context,
                        message: 'الجواب خاطئ',
                        icon: AssetsData.wrongAnswer);
                  }
                }
              },
              title: widget.answer4,
              color: AppColor.pinkColor,
            ),
          ],
        ),
      ],
    );
  }
}
