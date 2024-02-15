import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:karaz/core/constant/images_path.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

class MenuList extends StatelessWidget {
  const MenuList({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp controllerApp = Get.put(ControllerApp());

    return GetX<ControllerApp>(
      builder: (controller) => AnimatedContainer(
          duration: Duration(milliseconds: 1700),
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width,
          height: 50.h,
          color: controller.countTheAnimOfferInHome.value
              ? AppColors.theMainColor
              : AppColors.theMainColorTwo,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          ImagesPath.homeIcon,
                          height: 30.h,
                        ),
                        Text(
                          "7-الرئيسية".tr,
                          style: TextStyle(
                            height: 1.3.h,
                            fontSize: 12,
                            fontFamily: AppTextStyles.Almarai,
                            color: AppColors.whiteColor,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    InkWell(
                      onTap: () {
                        if (controllerApp.displayIsHavaAccount.value == 0) {
                          controllerApp.messageAboutNotHaveAccount.value = true;
                        } else {
                          controllerApp.showTheOrderPage.value = true;
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImagesPath.OrderBoxIcon,
                            height: 30.h,
                          ),
                          Text(
                            "8-الطلبيات".tr,
                            style: TextStyle(
                              height: 1.3.h,
                              fontSize: 12,
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 50.w,
                    ),
                    InkWell(
                        onTap: () {
                          if (controllerApp.displayIsHavaAccount.value == 0) {
                            controllerApp.messageAboutNotHaveAccount.value =
                                true;
                          } else {
                            controllerApp.showTheMessage.value = true;
                          }
                        },
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              ImagesPath.messagesIcon,
                              height: 30.h,
                            ),
                            Text(
                              "9-التنبيهات".tr,
                              style: TextStyle(
                                height: 1.3.h,
                                fontSize: 12,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        )),
                    SizedBox(
                      width: 50.w,
                    ),
                    InkWell(
                      onTap: () {
                        if (controllerApp.displayIsHavaAccount.value == 0) {
                          controllerApp.messageAboutNotHaveAccount.value = true;
                        } else {
                          controllerApp.ShowThemenuApp.value = true;
                        }
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            ImagesPath.menuIcon,
                            height: 30.h,
                          ),
                          Text(
                            "10-الاعدادت".tr,
                            style: TextStyle(
                              height: 1.3.h,
                              fontSize: 12,
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.whiteColor,
                            ),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          )),
    );
  }
}
