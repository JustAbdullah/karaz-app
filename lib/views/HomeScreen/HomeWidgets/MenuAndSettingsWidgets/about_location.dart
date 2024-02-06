import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:karaz/customWidgets/custom_padding.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class AboutLocation extends StatelessWidget {
  const AboutLocation({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp controllerTheApp = Get.put(ControllerApp());

    return GetX<ControllerApp>(
        builder: (controller) => Visibility(
            visible: controller.aboutLocation.value,
            child: Stack(children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black38,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.black38,
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width,
                        height: 500.h,
                        child: SingleChildScrollView(
                            child: Column(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                controller.aboutLocation.value = false;
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    color: AppColors.theMainColorTwo,
                                    shape: BoxShape.rectangle),
                                width: 50.w,
                                height: 20.h,
                                child: Text(
                                  "X",
                                  style: TextStyle(
                                      height: 1.3.h,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.whiteColor),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "20-الموقع والعمليات".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 19,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              )),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "21-يتم أخذ موقعك الحالي على الخريطة بشكل تلقائي وحفظه للقيام بعمليات الخدمة"
                                      .tr,
                                  style: TextStyle(
                                      height: 1.5.h,
                                      fontSize: 13,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.balckColorTypeFour),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                )),
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          Lottie.asset(ImagesPath.location),
                          SizedBox(
                            height: 0.h,
                          ),
                          Text(
                            controllerTheApp.address.value,
                            style: TextStyle(
                                height: 1.5.h,
                                fontSize: 13.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeFour),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 35.h,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  controller.showTheLocation.value = true;
                                },
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.balckColorTypeFour,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.w, vertical: 10.h),
                                      child: Text(
                                        "22-إظهار موقعك".tr,
                                        style: TextStyle(
                                            height: 1.6.h,
                                            fontSize: 15,
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.whiteColor),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              )),
                          SizedBox(
                            height: 15.h,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  controller.locationPage.value = true;
                                },
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.theMainColorTwo,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.w, vertical: 10.h),
                                      child: Text(
                                        "23-تغيير الموقع".tr,
                                        style: TextStyle(
                                            height: 1.6.h,
                                            fontSize: 15,
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.whiteColor),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              )),
                        ])))),
              ),

              /////////////////..............Loading to Take The Location........../////////////////
            ])));
  }
}
