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

    controllerTheApp.WhereGoingTheApp();

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: Align(
        alignment: Alignment.bottomCenter,
        child: SingleChildScrollView(
          child: Column(children: [
            PaddingCustom(
              theTop: 230,
              child: Lottie.asset("${ImagesPath.loadingAppOpeartions}",
                  width: 100.w),
            ),
            PaddingCustom(
                theBottom: 10,
                child: TextCustom(
                    theText: "235-انتظر قليلاً..".tr,
                    fontSizeWidth: 20.sp,
                    fontFamily: AppTextStyles.Almarai,
                    fontColor: AppColors.theMainColor)),
          ]),
        ),
      )),
    );
  }
}
