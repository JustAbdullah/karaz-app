import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:karaz/customWidgets/custom_padding.dart';
import 'package:lottie/lottie.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';

class GetLocation extends StatelessWidget {
  const GetLocation({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp controllerTheApp = Get.put(ControllerApp());

    return GetX<ControllerApp>(
        builder: (controller) => Visibility(
            visible: controller.locationPage.value,
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
                                controller.locationPage.value = false;
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
                                "27-تحديد موقعك على الخريطة".tr,
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
                                  "28-يتم أخذ موقعك الحالي على الخريطة بشكل تلقائي وحفظه للقيام بعمليات الخدمة"
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
                            height: 45.h,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: InkWell(
                                onTap: () {
                                  controller.askPermissionOfLocation();
                                },
                                child: Container(
                                  height: 40.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.yellowColor,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 30.w, vertical: 10.h),
                                      child: Text(
                                        "29-أخذ موقعك الان".tr,
                                        style: TextStyle(
                                            height: 1.6.h,
                                            fontSize: 15,
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.theMainColor),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              )),
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30.w),
                              child: Text(
                                "30-يتم حذف موقعك حال حذف الحساب..لايتم إستغلال الموقع او أرشفته او تخزين في سيرفرات تخزين خارجية"
                                    .tr,
                                style: TextStyle(
                                    height: 1.5.h,
                                    fontSize: 13,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.redColor),
                                textAlign: TextAlign.center,
                              ))
                        ])))),
              ),

              /////////////////..............Loading to Take The Location........../////////////////
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Visibility(
                      visible: controller.checkTheLocation.value,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 500.h,
                        color: Colors.black38,
                      ))),
              Align(
                  alignment: Alignment.center,
                  child: Visibility(
                      visible: controller.checkTheLocation.value,
                      child: PaddingCustom(
                        theTop: 150,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Lottie.asset(ImagesPath.loadingBlack, width: 130.w),
                            SizedBox(
                              height: 15.h,
                            ),
                            Text(
                              "31-انتظر قليلاً..يتم التحقق وأخذ الموقع الان".tr,
                              style: TextStyle(
                                  height: 1.5.h,
                                  fontSize: 13,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.whiteColor,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ))),

              ///////////////////////Error the Location is off.................////////////////
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Visibility(
                      visible:
                          controller.MessageAboutLocationServiceEnable.value,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 500.h,
                        color: Colors.black38,
                      ))),
              Align(
                alignment: Alignment.center,
                child: Visibility(
                    visible: controller.MessageAboutLocationServiceEnable.value,
                    child: PaddingCustom(
                        theTop: 150,
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.theMainColorTwo,
                                borderRadius: BorderRadius.circular(7)),
                            width: 240.w,
                            height: 140.h,
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      controller
                                          .MessageAboutLocationServiceEnable
                                          .value = false;
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColors.balckColorTypeFour,
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
                                  height: 10.h,
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "32-هنالك خطأ...!".tr,
                                      style: TextStyle(
                                          height: 1.3.h,
                                          fontSize: 19,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.whiteColor),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    )),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "33-خدمة -موقعي- غير مفعلة على جهازك..قم بتفعيلها ثم أعد المحاولة"
                                            .tr,
                                        style: TextStyle(
                                            height: 1.5.h,
                                            fontSize: 13,
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.whiteColor),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ]),
                            )))),
              ), ///////////////////////Error the Location is deind.................////////////////
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Visibility(
                      visible: controller.IsrequestPermissionDenied.value,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 500.h,
                        color: Colors.black38,
                      ))),
              Align(
                alignment: Alignment.center,
                child: Visibility(
                    visible: controller.IsrequestPermissionDenied.value,
                    child: PaddingCustom(
                        theTop: 150,
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.theMainColorTwo,
                                borderRadius: BorderRadius.circular(7)),
                            width: 240.w,
                            height: 140.h,
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: InkWell(
                                    onTap: () {
                                      controller.IsrequestPermissionDenied
                                          .value = false;
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          color: AppColors.balckColorTypeFour,
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
                                  height: 10.h,
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "32-هنالك خطأ...!".tr,
                                      style: TextStyle(
                                          height: 1.3.h,
                                          fontSize: 19,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.whiteColor),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    )),
                                SizedBox(
                                  height: 3.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "34-لقد قمت برفض عملية التحصل على موقعك بشكل تلقائي..قم بالسماح للوصول لموقعك"
                                            .tr,
                                        style: TextStyle(
                                            height: 1.5.h,
                                            fontSize: 13,
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.whiteColor),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ]),
                            )))),
              ), ///////////////////////is get The Location end.................////////////////
              Align(
                  alignment: Alignment.bottomCenter,
                  child: Visibility(
                      visible: controller.isVerificationLocationCompleted.value,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 500.h,
                        color: Colors.black38,
                      ))),
              Align(
                alignment: Alignment.center,
                child: Visibility(
                    visible: controller.isVerificationLocationCompleted.value,
                    child: PaddingCustom(
                        theTop: 150,
                        child: Container(
                            decoration: BoxDecoration(
                                color: AppColors.whiteColor,
                                borderRadius: BorderRadius.circular(7)),
                            width: 240.w,
                            height: 180.h,
                            child: SingleChildScrollView(
                              child: Column(children: [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Lottie.asset(ImagesPath.successfully,
                                        width: 70.w)),
                                SizedBox(
                                  height: 5.h,
                                ),
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Text(
                                      "35-انتهت العملية".tr,
                                      style: TextStyle(
                                          height: 1.3.h,
                                          fontSize: 19,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeFour),
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                    )),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 30.w),
                                  child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        "36-لقد تم أخذ موقعك بنجاح".tr,
                                        style: TextStyle(
                                            height: 1.5.h,
                                            fontSize: 13,
                                            fontFamily: AppTextStyles.Almarai,
                                            color:
                                                AppColors.balckColorTypeFour),
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.checkTheLocation.value = false;
                                    controllerTheApp.savelocationUser(
                                        controllerTheApp
                                            .myCurrentPositionLatitude
                                            .toString(),
                                        controllerTheApp
                                            .myCurrentPositionLongitude
                                            .toString());
                                    controllerTheApp.locationPage.value = false;
                                    controllerTheApp
                                        .isVerificationLocationCompleted
                                        .value = false;
                                    controllerTheApp.showTheLocation.value =
                                        true;
                                  },
                                  child: Container(
                                    height: 40.h,
                                    decoration: BoxDecoration(
                                        color: AppColors.yellowColor,
                                        borderRadius: BorderRadius.circular(7)),
                                    child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.w, vertical: 10.h),
                                        child: Text(
                                          "37-مشاهدة الموقع الان".tr,
                                          style: TextStyle(
                                              height: 1.6.h,
                                              fontSize: 15,
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour),
                                          textAlign: TextAlign.center,
                                        )),
                                  ),
                                )
                              ]),
                            )))),
              )
            ])));
  }
}
