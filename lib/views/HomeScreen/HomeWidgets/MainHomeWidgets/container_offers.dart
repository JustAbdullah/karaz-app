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
            color: controller.countTheAnimOfferInHome.value
                ? AppColors.theMainColor
                : AppColors.theMainColorTwo,
            child: Center(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.w),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(children: [
                      SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 17,
                            ),
                            Container(
                              width: 140.h,
                              child: Text(
                                "230-تطبيق كرز".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.whiteColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(
                              height: 0,
                            ),
                            Container(
                              width: 170.h,
                              child: Text(
                                "234-خدمات متعددة..فنيين بأعلى مستوى..سهولة في الطلب وسرعة في الوصول"
                                    .tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 15.sp,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.whiteColor),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Lottie.asset(ImagesPath.serivece2),
                    ]),
                  )),
            )));
  }
}
