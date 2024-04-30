import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:karaz/core/constant/images_path.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ControllerApp>(
      builder: (controller) => Visibility(
        visible: controller.ShowThemenuApp.value,
        child: Stack(
          children: [
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
                      height: 480.h,
                      child: SingleChildScrollView(
                        child: Column(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                controller.ShowThemenuApp.value = false;
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
                          SizedBox(
                            height: 15.h,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "12-الإعدادت".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 21.sp,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              )),
                          SizedBox(
                            height: 30.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: InkWell(
                              onTap: () {
                                controller.showTheAccountInfo.value = true;
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImagesPath.info,
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "13-معلومات الحساب".tr,
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: InkWell(
                                onTap: () {
                                  if (controller.displayIsHavaAccount.value ==
                                      0) {
                                    controller.messageAboutNotHaveAccount
                                        .value = true;
                                  } else {
                                    controller.showTheOrderPage.value = true;
                                  }
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      ImagesPath.OrderBoxIcon,
                                      width: 20.w,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "14-الطلبيات".tr,
                                      style: TextStyle(
                                          height: 1.3.h,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeFour),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: InkWell(
                              onTap: () {
                                controller.aboutLocation.value = true;
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImagesPath.locationIcon,
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "15-موقعي".tr,
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: InkWell(
                                onTap: () {
                                  if (controller.displayIsHavaAccount.value ==
                                      0) {
                                    controller.showInvoice.value = true;
                                  } else {
                                    controller.showInvoice.value = true;
                                  }
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      ImagesPath.invoice,
                                      width: 20.w,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "207-الفواتير الإلكترونية".tr,
                                      style: TextStyle(
                                          height: 1.3.h,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeFour),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: InkWell(
                                onTap: () {
                                  if (controller.displayIsHavaAccount.value ==
                                      0) {
                                    controller.messageAboutNotHaveAccount
                                        .value = true;
                                  } else {
                                    controller.showTheMessage.value = true;
                                  }
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      ImagesPath.messagesIcon,
                                      width: 20.w,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "16-التنبيهات".tr,
                                      style: TextStyle(
                                          height: 1.3.h,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeFour),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              children: [
                                Image.asset(
                                  ImagesPath.logo,
                                  width: 20.w,
                                  fit: BoxFit.cover,
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  "17-معلومات حول كرز".tr,
                                  style: TextStyle(
                                      height: 1.3.h,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.balckColorTypeFour),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: InkWell(
                              onTap: () {
                                controller.showLang.value = true;
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImagesPath.lang,
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "168-اللغة".tr,
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: InkWell(
                              onTap: () {
                                controller.showTheConditions.value = true;
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImagesPath.iconConditions,
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "263-0-الشروط والاحكام".tr,
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: InkWell(
                                onTap: () {
                                  controller.logOut();
                                },
                                child: Row(
                                  children: [
                                    Image.asset(
                                      ImagesPath.logOut,
                                      width: 20.w,
                                    ),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      "18-تسجيل خروج".tr,
                                      style: TextStyle(
                                          height: 1.3.h,
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.w600,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeFour),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: InkWell(
                              onTap: () {
                                controller.messageAboutDeleteAccount.value =
                                    true;
                              },
                              child: Row(
                                children: [
                                  Image.asset(
                                    ImagesPath.deleteAccount,
                                    width: 20.w,
                                  ),
                                  SizedBox(
                                    width: 10.w,
                                  ),
                                  Text(
                                    "19-حذف الحساب".tr,
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 0.17.h,
                                color: AppColors.balckColorTypeFour,
                              )),
                          SizedBox(
                            height: 10.h,
                          ),
                        ]),
                      ),
                    ))),
            Visibility(
                visible: controller.messageAboutDeleteAccount.value,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black38,
                )),
            Visibility(
                visible: controller.messageAboutDeleteAccount.value,
                child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 30.w, vertical: 10.h),
                        child: Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            width: MediaQuery.of(context).size.width,
                            height: 170.h,
                            child: SingleChildScrollView(
                                child: Column(children: [
                              Align(
                                alignment: Alignment.topRight,
                                child: InkWell(
                                  onTap: () {
                                    controller.messageAboutDeleteAccount.value =
                                        false;
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
                              SizedBox(
                                height: 20.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Text(
                                  "169-هل أنت متأكد برغبتك بحذف الحساب؟ لايمكن التراجع بعد عملية حذف الحساب"
                                      .tr
                                      .tr,
                                  style: TextStyle(
                                      height: 1.3.h,
                                      fontSize: 14.sp,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.balckColorTypeFour),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15.w),
                                child: Text(
                                  "170-ملاحظة:لايمكن حذف الحساب حال تاكيد طلبية ما ..عليك إنهاء إجراءات طلب الطلبية ثم حذف الحساب"
                                      .tr,
                                  style: TextStyle(
                                      height: 1.3.h,
                                      fontSize: 12.sp,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.theMainColorTwo),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              SizedBox(
                                height: 25.h,
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: InkWell(
                                  onTap: () {
                                    controller.deleteAccount();
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 35.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.yellowColor,
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      child: Text(
                                        "171-حذف الحساب الان".tr,
                                        style: TextStyle(
                                            height: 1.3.h,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: AppTextStyles.Almarai,
                                            color:
                                                AppColors.balckColorTypeFour),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              )
                            ]))))))
          ],
        ),
      ),
    );
  }
}
