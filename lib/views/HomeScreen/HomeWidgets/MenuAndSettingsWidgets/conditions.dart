import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_text.dart';

class Conditions extends StatelessWidget {
  const Conditions({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp controllerTheApp = Get.put(ControllerApp());

    return GetX<ControllerApp>(
        builder: (controller) => Visibility(
            visible: controller.showTheConditions.value,
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
                    padding: EdgeInsets.symmetric(horizontal: 0.w),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                            child: Column(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                controller.showTheConditions.value = false;
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
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.whiteColor),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "263-الشروط".tr,
                                style: TextStyle(
                                    height: 1.7.h,
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    color:
                                        const Color.fromARGB(255, 54, 54, 54)),
                                textAlign: TextAlign.center,
                              )),
                        ])))),
              ),

              /////////////////..............Loading to Take The Location........../////////////////
            ])));
  }
}
