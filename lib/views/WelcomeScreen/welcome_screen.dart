import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:karaz/views/HomeScreen/home_screen.dart';
import 'package:lottie/lottie.dart';

import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/constant/images_path.dart';
import '../../customWidgets/custom_padding.dart';
import '../Auth/login_screen.dart';
import '../Auth/sign_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Column(children: [
            SizedBox(
              height: 80.h,
            ),
            Text(
              "1-مرحبًا في تطبيق كرز".tr,
              style: TextStyle(
                  fontFamily: AppTextStyles.Almarai,
                  color: AppColors.blackColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w500),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 3.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.w),
              child: Text(
                "2-قم رجاءًا بإختيار مسار محدد للمتابعة".tr,
                style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.blackColor,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500),
                textAlign: TextAlign.center,
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: PaddingCustom(
                theTop: 20,
                child: Lottie.asset(
                  "${ImagesPath.WelcomeAni}",
                ),
              ),
            ),
            SizedBox(
              height: 59.h,
            ),
            InkWell(
              onTap: () {
                Get.to(AuthPhoneNumberLogin());
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.theMainColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 220.w,
                height: 35.h,
                child: Text(
                  "3-تسجيل الدخول".tr,
                  style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            SizedBox(
              height: 10.h,
            ),
            InkWell(
              onTap: () {
                Get.to(HomeScreen());
              },
              child: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: AppColors.blackColor,
                  borderRadius: BorderRadius.circular(5),
                ),
                width: 220.w,
                height: 35.h,
                child: Text(
                  "4-المتابعة كزائر".tr,
                  style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.whiteColor,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
            )
          ]),
        ),
      )),
    );
  }
}
