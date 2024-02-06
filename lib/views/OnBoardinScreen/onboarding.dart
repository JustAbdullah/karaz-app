import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:karaz/views/WelcomeScreen/welcome_screen.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/onboarding_controller.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../core/data/model/static_onboarding.dart';
import '../../core/localization/changelanguage.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    ChangeLanguageToLocale changeLanguageToLocale =
        Get.put(ChangeLanguageToLocale());
    final _size = MediaQuery.of(context).size;
    final screenHeight = _size.height;
    final screenWidth = _size.width;

    onBoardingControllerImp onboardingControllerImp =
        Get.put(onBoardingControllerImp());

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
            child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: PageView.builder(
            controller: onboardingControllerImp.pageController,
            onPageChanged: (val) {
              onboardingControllerImp.onPageChange(val);
            },
            itemCount: onBoardingItme.length,
            itemBuilder: (context, i) => GetX<onBoardingControllerImp>(
              builder: (m) => Column(children: [
                SizedBox(
                  height: 60.h,
                ),
                Text(
                  "تطبيق كرز",
                  // ignore: deprecated_member_use
                  style: TextStyle(
                      fontFamily: AppTextStyles.Almarai,
                      color: AppColors.theMainColorTwo,
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold),

                  textAlign: TextAlign.center,
                ),
                Text(
                  "الدليل التعريفي لتطبيق كرز للخدمات",
                  // ignore: deprecated_member_use
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.balckColorTypeFour,
                    fontSize: 13.sp,
                  ),

                  textAlign: TextAlign.center,
                ),
                Align(
                    alignment: Alignment.topCenter,
                    child: Padding(
                      padding:
                          EdgeInsets.only(top: m.currntPage == 2 ? 40.h : 0.h),
                      child: Lottie.asset("${onBoardingItme[i].image}",
                          width: m.currntPage == 0
                              ? 500.w
                              : m.currntPage == 1
                                  ? 350.w
                                  : 250.w,
                          height: m.currntPage == 0
                              ? 350.h
                              : m.currntPage == 1
                                  ? 350.h
                                  : 250.h,
                          fit: BoxFit.cover),
                    )),
                SizedBox(
                  height: m.currntPage == 2 ? 50.h : 0,
                ),
                Text(
                  "${onBoardingItme[i].title}",
                  // ignore: deprecated_member_use
                  style: TextStyle(
                    fontFamily: AppTextStyles.Almarai,
                    color: AppColors.theMainColorTwo,
                    fontSize: 22.sp,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    "${onBoardingItme[i].body}",
                    style: TextStyle(
                        height: changeLanguageToLocale.isChange.value == false
                            ? screenHeight * 0.00187
                            : screenHeight * 0.0017,
                        fontFamily: AppTextStyles.Almarai,
                        color: Color(0XFF434242),
                        fontSize: 15.sp,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(
                  height: m.currntPage == 2 ? 60.h : 40.h,
                ),
                GetX<onBoardingControllerImp>(
                  builder: (controller) => Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ...List.generate(
                            onBoardingItme.length,
                            (index) => Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 5,
                                  ),
                                  child: AnimatedContainer(
                                    duration: Duration(milliseconds: 500),
                                    width: controller.currntPage == index
                                        ? 23
                                        : 13,
                                    height: 13,
                                    decoration: BoxDecoration(
                                        color: controller.currntPage == index
                                            ? AppColors.theMainColorTwo
                                            : AppColors.theMainColor,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                )),
                      ]),
                ),
                SizedBox(
                  height: 20.h,
                ),
                GetX<onBoardingControllerImp>(
                    builder: (controller) => InkWell(
                          onTap: () {
                            if (controller.currntPage.value > 1) {
                              Get.to(WelcomeScreen());
                            } else {
                              controller.currntPage.value =
                                  controller.currntPage.value + 1;
                              controller.pageController.animateToPage(
                                  controller.currntPage.value,
                                  duration: Duration(microseconds: 500),
                                  curve: Curves.bounceOut);
                            }
                          },
                          child: AnimatedContainer(
                              duration: Duration(milliseconds: 700),
                              width: controller.currntPage.value ==
                                      onBoardingItme.length - 1
                                  ? screenWidth * 0.55
                                  : screenWidth * 0.50,
                              height: screenHeight / 25,
                              decoration: BoxDecoration(
                                  color: controller.currntPage.value ==
                                          onBoardingItme.length - 1
                                      ? AppColors.theMainColorTwo
                                      : AppColors.theMainColor,
                                  borderRadius: controller.currntPage.value ==
                                          onBoardingItme.length - 1
                                      ? BorderRadius.circular(10)
                                      : BorderRadius.circular(5)),
                              child: Center(
                                child: controller.currntPage ==
                                        onBoardingItme.length - 1
                                    ? Text(
                                        "الإنتقال",
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: AppColors.whiteColor,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.045,
                                            fontWeight: FontWeight.w500),
                                      )
                                    : Text(
                                        "المتابعة",
                                        style: TextStyle(
                                            fontFamily: 'Cairo',
                                            color: Colors.white,
                                            fontSize: screenWidth * 0.045,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                              )),
                        ))
              ]),
            ),
          ),
        )),
      ),
    );
  }
}
