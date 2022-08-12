import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:raftlabs_assignment/config/constants/app_images.dart';

class LoadingLottieWidget extends StatelessWidget {
  const LoadingLottieWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LottieBuilder.asset(
      AppImages.loading,
      height: 80.h,
      width: 80.w,
    );
  }
}
