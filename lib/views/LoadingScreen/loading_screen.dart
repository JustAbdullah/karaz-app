import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/controller_app.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_padding.dart';
import '../../customWidgets/custom_text.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp controllerTheApp = Get.put(ControllerApp());

    controllerTheApp.getAnimationTextWelcome();

    return Scaffold(
      backgroundColor: AppColors.theMainColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(children: [
          PaddingCustom(
            theTop: 90,
            child: Lottie.asset(
              "${ImagesPath.loadingAppOpeartions}",
            ),
          ),
          PaddingCustom(
              theTop: 100,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w),
                child: GetX<ControllerApp>(
                    builder: (controller) => TextCustom(
                        theText: controller.welcomeText.value.toString(),
                        fontSizeWidth: 17.sp,
                        fontWeight: FontWeight.w600,
                        fontFamily: AppTextStyles.Almarai,
                        fontColor: controller.weclomeColor)),
              )),
          PaddingCustom(
              theTop: 10,
              child: TextCustom(
                  theText: "انتظر قليلاً..",
                  fontSizeWidth: 20.sp,
                  fontFamily: AppTextStyles.Marhey,
                  fontColor: AppColors.whiteColor)),
        ]),
      )),
    );
  }
}
