import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class ContainerOffers extends StatelessWidget {
  const ContainerOffers({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp controllerApp = Get.put(ControllerApp());
    controllerApp.getAnimOfferInHome();

    return GetX<ControllerApp>(
        builder: (controller) => AnimatedContainer(
            duration: Duration(milliseconds: 1700),
            width: MediaQuery.of(context).size.width,
            height: 140.h,
            color: controller.countTheAnimOfferInHome.value == 0
                ? AppColors.theMainColorTwo
                : controller.countTheAnimOfferInHome.value == 1
                    ? AppColors.theMainColor
                    : AppColors.theMainColorTwo,
            child: Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                child: controller.countTheAnimOfferInHome.value == 0
                    ? Row(children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 17,
                            ),
                            Container(
                              width: 140.h,
                              child: Text(
                                "تطبيق كرز",
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.theMainColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            Container(
                              width: 170.h,
                              child: Text(
                                "أستمتع بجودة عالية وبأسعار مناسبة",
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.whiteColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: 140.h,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 10.w,
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.theMainColor,
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Container(
                                    width: 10.w,
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        shape: BoxShape.circle),
                                  ),
                                  SizedBox(
                                    width: 5.w,
                                  ),
                                  Container(
                                    width: 10.w,
                                    height: 10.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.whiteColor,
                                        shape: BoxShape.circle),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Image.asset(ImagesPath.logoWithOutbackGround),
                      ])
                    : controller.countTheAnimOfferInHome.value == 1
                        ? Row(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 17,
                                ),
                                Container(
                                  width: 140.h,
                                  child: Text(
                                    "تطبيق كرز",
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 17,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.theMainColorTwo),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 0,
                                ),
                                Container(
                                  width: 170.h,
                                  child: Text(
                                    "أقسام متعددة,خدمات وفرة",
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 140.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 10.w,
                                        height: 10.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            shape: BoxShape.circle),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Container(
                                        width: 10.w,
                                        height: 10.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.theMainColorTwo,
                                            shape: BoxShape.circle),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Container(
                                        width: 10.w,
                                        height: 10.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            shape: BoxShape.circle),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Lottie.asset(ImagesPath.serivece2),
                          ])
                        : Row(children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 17,
                                ),
                                Container(
                                  width: 140.h,
                                  child: Text(
                                    "تطبيق كرز",
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 17,
                                        fontWeight: FontWeight.w700,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.theMainColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 00,
                                ),
                                Container(
                                  width: 170.h,
                                  child: Text(
                                    "سهولة في الطلب,سرعة في الوصول",
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Container(
                                  width: 140.h,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        width: 10.w,
                                        height: 10.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            shape: BoxShape.circle),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Container(
                                        width: 10.w,
                                        height: 10.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            shape: BoxShape.circle),
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Container(
                                        width: 10.w,
                                        height: 10.h,
                                        decoration: BoxDecoration(
                                            color: AppColors.theMainColor,
                                            shape: BoxShape.circle),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Lottie.asset(ImagesPath.serivece3),
                          ]),
              ),
            )));
  }
}
