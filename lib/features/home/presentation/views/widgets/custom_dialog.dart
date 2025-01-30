import 'package:asmaak/core/utils/widgets/custom_button.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:video_player/video_player.dart';
import '../../../../../core/utils/app_manager/app_colors.dart';
import '../../../../../core/utils/app_manager/app_styles.dart';

Future customDialog({
  context,
  message,
  image,
  onConfirm,
}) =>
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        FlickManager flickManager = FlickManager(
            videoPlayerController: VideoPlayerController.networkUrl(
                Uri.parse(
                    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4'),
                videoPlayerOptions:
                    VideoPlayerOptions(allowBackgroundPlayback: false)));
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
                            border: Border.all(color: AppColor.primaryColor)),
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
                SvgPicture.asset(
                  image,
                ),
                const SizedBox(
                  height: 10,
                ),
                FlickVideoPlayer(
                  flickManager: flickManager,
                  flickVideoWithControls: FlickVideoWithControls(
                    controls: CustomFlickControls(),
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
                CustomButton(
                  height: 40,
                  width: MediaQuery.of(context).size.width / 3,
                  text: 'تعلمت',
                  textColor: AppColor.whiteColor,
                  onPressed: onConfirm,
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
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
