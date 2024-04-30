import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:karaz/core/constant/images_path.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/localization/changelanguage.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_container_api.dart';
import '../../../../customWidgets/custom_padding.dart';
import '../../../../customWidgets/custom_text.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:async';
import 'dart:io';
import 'dart:math';

class orderConf extends StatefulWidget {
  const orderConf({super.key});

  @override
  State<orderConf> createState() => _orderConfState();
}

class _orderConfState extends State<orderConf> {
  @override
  Widget build(BuildContext context) {
    ControllerApp controllerApp = Get.put(ControllerApp());

    return GetX<ControllerApp>(
        builder: (controller) => Visibility(
            visible: controllerApp.OpeartionsOrderPage.value,
            child: Container(
              color: AppColors.whiteColorTypeTwo,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 60.h,
                            color: AppColors.theMainColor,
                            child: Row(children: [
                              SizedBox(
                                width: 10.w,
                              ),
                              Visibility(
                                  visible: controllerApp
                                              .whereIsTheOrderStyp.value ==
                                          3 ||
                                      controllerApp.whereIsTheOrderStyp.value ==
                                          4,
                                  child: InkWell(
                                    onTap: () {
                                      if (controllerApp
                                              .whereIsTheOrderStyp.value ==
                                          3) {
                                        controllerApp
                                            .OpeartionsOrderPage.value = false;
                                        controllerApp.countTheTimeChosed.value =
                                            0;
                                        controllerApp
                                            .countTheWhatChooseOfDate.value = 0;
                                      } else if (controllerApp
                                              .whereIsTheOrderStyp.value ==
                                          4) {
                                        controllerApp
                                            .whereIsTheOrderStyp.value = 3;
                                        controllerApp.showTheConfOrder.value =
                                            false;
                                        controllerApp.showTheSh.value = true;

                                        controller.titleOfOrder.value =
                                            "180-الجدولة".tr;
                                        controller.buttonInOrder.value =
                                            "261-المتابعة".tr;
                                      }
                                    },
                                    child: Image.asset(
                                      ImagesPath.arrowRight,
                                      width: 30.w,
                                    ),
                                  )),
                              SizedBox(
                                width: 15.w,
                              ),
                              Padding(
                                  padding: EdgeInsets.only(top: 10.h),
                                  child: Text(
                                    controllerApp.titleOfOrder.value.tr,
                                    style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor,
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  )),
                            ]),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Visibility(
                            visible: controllerApp.whereIsTheOrderStyp.value ==
                                    3 ||
                                controllerApp.whereIsTheOrderStyp.value == 4,
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: AppColors.whiteColor,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.1),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                  ),
                                  width: MediaQuery.of(context).size.width,
                                  height: 80.h,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: GetX<ControllerApp>(
                                        builder: (controller) => Row(children: [
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 40.w,
                                                height: 25.h,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.theMainColor,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: Image.asset(
                                                      ImagesPath.theTrueIcon),
                                                ),
                                              ),
                                              Text(
                                                "182-المحتوى".tr,
                                                style: TextStyle(
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color:
                                                        AppColors.theMainColor,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 11.h),
                                            child: Container(
                                              width: 45.w,
                                              height: 1.h,
                                              color: AppColors.theMainColor,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 40.w,
                                                height: 25.h,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.theMainColor,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: Image.asset(
                                                      ImagesPath.theTrueIcon),
                                                ),
                                              ),
                                              Text(
                                                "183-الموقع".tr,
                                                style: TextStyle(
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color:
                                                        AppColors.theMainColor,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 11.h),
                                            child: Container(
                                              width: 45.w,
                                              height: 1.h,
                                              color: AppColors.theMainColor,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 40.w,
                                                height: 25.h,
                                                decoration: BoxDecoration(
                                                    color:
                                                        AppColors.theMainColor,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: controllerApp
                                                              .whereIsTheOrderStyp
                                                              .value ==
                                                          3
                                                      ? Text(
                                                          "3".tr,
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color:
                                                                  Colors.white,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )
                                                      : Image.asset(ImagesPath
                                                          .theTrueIcon),
                                                ),
                                              ),
                                              Text(
                                                "184-الجدولة".tr,
                                                style: TextStyle(
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color:
                                                        AppColors.theMainColor,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 11.h),
                                            child: Container(
                                              width: 45.w,
                                              height: 1.h,
                                              color: controllerApp
                                                          .whereIsTheOrderStyp
                                                          .value ==
                                                      3
                                                  ? Colors.black
                                                  : AppColors.theMainColor,
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 40.w,
                                                height: 25.h,
                                                decoration: BoxDecoration(
                                                    color: controllerApp
                                                                .whereIsTheOrderStyp
                                                                .value ==
                                                            3
                                                        ? Colors.white
                                                        : AppColors
                                                            .theMainColor,
                                                    shape: BoxShape.circle),
                                                child: Center(
                                                  child: Text(
                                                    "4".tr,
                                                    style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: controllerApp
                                                                    .whereIsTheOrderStyp
                                                                    .value ==
                                                                3
                                                            ? Colors.black
                                                            : Colors.white,
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                "185-التاكيد".tr,
                                                style: TextStyle(
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: controllerApp
                                                                .whereIsTheOrderStyp
                                                                .value ==
                                                            3
                                                        ? Colors.black
                                                        : AppColors
                                                            .theMainColor,
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.w500),
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ]),
                                      ),
                                    ),
                                  ),
                                )),
                          ),

                          //////////////////////////Show The Sh........................................./////////////////////
                          GetX<ControllerApp>(
                              builder: (controller) => Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Visibility(
                                    visible: controller.showTheSh.value,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15.w, vertical: 10.h),
                                        child: Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Row(
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  controllerApp
                                                      .countTheWhatChooseOfDate
                                                      .value = 1;

                                                  controllerApp
                                                          .theDateChoosd.value =
                                                      "${controllerApp.afterOneDate.value.toString()} -${controllerApp.afterOneDayNumber.value}";
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: controller
                                                                  .countTheWhatChooseOfDate
                                                                  .value ==
                                                              1
                                                          ? AppColors
                                                              .theMainColor
                                                          : AppColors
                                                              .whiteColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                        color: AppColors
                                                            .theMainColor,
                                                        width: 1.0,
                                                      )),
                                                  width: 80.w,
                                                  height: 90.h,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          controllerApp
                                                              .afterOneDate
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      1
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterOneDayNumber
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      1
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterOneDay.value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      1
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controllerApp
                                                      .countTheWhatChooseOfDate
                                                      .value = 2;
                                                  controllerApp
                                                          .theDateChoosd.value =
                                                      "${controllerApp.afterTwoDate.value.toString()} -${controllerApp.afterTwoDayNumber.value}";
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: controller
                                                                  .countTheWhatChooseOfDate
                                                                  .value ==
                                                              2
                                                          ? AppColors
                                                              .theMainColor
                                                          : AppColors
                                                              .whiteColor,
                                                      border: Border.all(
                                                        color: AppColors
                                                            .theMainColor, //                   <--- border color
                                                        width: 1.0,
                                                      )),
                                                  width: 80.w,
                                                  height: 90.h,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          controllerApp
                                                              .afterTwoDate
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      2
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterTwoDayNumber
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      2
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterTwoDay.value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      2
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controllerApp
                                                      .countTheWhatChooseOfDate
                                                      .value = 3;
                                                  controllerApp
                                                          .theDateChoosd.value =
                                                      "${controllerApp.afterThreeDate.value.toString()} -${controllerApp.afterThreeDayNumber.value}";
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: controller
                                                                  .countTheWhatChooseOfDate
                                                                  .value ==
                                                              3
                                                          ? AppColors
                                                              .theMainColor
                                                          : AppColors
                                                              .whiteColor,
                                                      border: Border.all(
                                                        color: AppColors
                                                            .theMainColor, //                   <--- border color
                                                        width: 1.0,
                                                      )),
                                                  width: 80.w,
                                                  height: 90.h,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          controllerApp
                                                              .afterThreeDate
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      3
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterThreeDayNumber
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      3
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterThreeDay
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      3
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controllerApp
                                                      .countTheWhatChooseOfDate
                                                      .value = 4;
                                                  controllerApp
                                                          .theDateChoosd.value =
                                                      "${controllerApp.afterFourDate.value.toString()} -${controllerApp.afterFourDayNumber.value}";
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: controller
                                                                  .countTheWhatChooseOfDate
                                                                  .value ==
                                                              4
                                                          ? AppColors
                                                              .theMainColor
                                                          : AppColors
                                                              .whiteColor,
                                                      border: Border.all(
                                                        color: AppColors
                                                            .theMainColor, //                   <--- border color
                                                        width: 1.0,
                                                      )),
                                                  width: 80.w,
                                                  height: 90.h,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          controllerApp
                                                              .afterFourDate
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      4
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterFourDayNumber
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      4
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterFourDay
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      4
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controllerApp
                                                      .countTheWhatChooseOfDate
                                                      .value = 5;
                                                  controllerApp
                                                          .theDateChoosd.value =
                                                      "${controllerApp.afterFiveDate.value.toString()} -${controllerApp.afterFiveDayNumber.value}";
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: controller
                                                                  .countTheWhatChooseOfDate
                                                                  .value ==
                                                              5
                                                          ? AppColors
                                                              .theMainColor
                                                          : AppColors
                                                              .whiteColor,
                                                      border: Border.all(
                                                        color: AppColors
                                                            .theMainColor, //                   <--- border color
                                                        width: 1.0,
                                                      )),
                                                  width: 80.w,
                                                  height: 90.h,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          controllerApp
                                                              .afterFiveDate
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      5
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterFiveDayNumber
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      5
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterFiveDay
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      5
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controllerApp
                                                      .countTheWhatChooseOfDate
                                                      .value = 6;
                                                  controllerApp
                                                          .theDateChoosd.value =
                                                      "${controllerApp.afterSixDate.value.toString()} -${controllerApp.afterSixDayNumber.value}";
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: controller
                                                                  .countTheWhatChooseOfDate
                                                                  .value ==
                                                              6
                                                          ? AppColors
                                                              .theMainColor
                                                          : AppColors
                                                              .whiteColor,
                                                      border: Border.all(
                                                        color: AppColors
                                                            .theMainColor, //                   <--- border color
                                                        width: 1.0,
                                                      )),
                                                  width: 80.w,
                                                  height: 90.h,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          controllerApp
                                                              .afterSixDate
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      6
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterSixDayNumber
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      6
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterSixDay.value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      6
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 10.w,
                                              ),
                                              InkWell(
                                                onTap: () {
                                                  controllerApp
                                                      .countTheWhatChooseOfDate
                                                      .value = 7;
                                                  controllerApp
                                                          .theDateChoosd.value =
                                                      "${controllerApp.afterSevenDate.value.toString()} -${controllerApp.afterSevenDayNumber.value}";
                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      color: controller
                                                                  .countTheWhatChooseOfDate
                                                                  .value ==
                                                              7
                                                          ? AppColors
                                                              .theMainColor
                                                          : AppColors
                                                              .whiteColor,
                                                      border: Border.all(
                                                        color: AppColors
                                                            .theMainColor, //                   <--- border color
                                                        width: 1.0,
                                                      )),
                                                  width: 80.w,
                                                  height: 90.h,
                                                  child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Text(
                                                          controllerApp
                                                              .afterSevenDate
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      7
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterSevenDayNumber
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      7
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        Text(
                                                          controllerApp
                                                              .afterSevenDay
                                                              .value
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controller
                                                                          .countTheWhatChooseOfDate
                                                                          .value ==
                                                                      7
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                      ]),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ))),

                          //////////////Time.......////////

                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible: controller.showTheSh.value,
                                  child: Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.w,
                                                  vertical: 10.h),
                                              child: Directionality(
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  child: Row(children: [
                                                    InkWell(
                                                      onTap: () {
                                                        controllerApp
                                                            .countTheTimeChosed
                                                            .value = 1;
                                                        controllerApp
                                                                .theTimeChosed
                                                                .value =
                                                            "صباحًا 10:00   - صباحًا 8:00 ";
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: controllerApp
                                                                            .countTheTimeChosed
                                                                            .value ==
                                                                        1
                                                                    ? AppColors
                                                                        .theMainColor
                                                                    : AppColors
                                                                        .whiteColor,
                                                                border:
                                                                    Border.all(
                                                                  color: AppColors
                                                                      .theMainColor, //                   <--- border color
                                                                  width: 1.0,
                                                                )),
                                                        width: 160.w,
                                                        height: 50.h,
                                                        child: Center(
                                                            child: Text(
                                                          "صباحًا 10:00   - صباحًا  8:00 "
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controllerApp
                                                                          .countTheTimeChosed
                                                                          .value ==
                                                                      1
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        controllerApp
                                                            .countTheTimeChosed
                                                            .value = 2;
                                                        controllerApp
                                                                .theTimeChosed
                                                                .value =
                                                            "صباحًا 12:00   - صباحًا  10:00 ";
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: controllerApp
                                                                            .countTheTimeChosed
                                                                            .value ==
                                                                        2
                                                                    ? AppColors
                                                                        .theMainColor
                                                                    : AppColors
                                                                        .whiteColor,
                                                                border:
                                                                    Border.all(
                                                                  color: AppColors
                                                                      .theMainColor, //                   <--- border color
                                                                  width: 1.0,
                                                                )),
                                                        width: 160.w,
                                                        height: 50.h,
                                                        child: Center(
                                                            child: Text(
                                                          "صباحًا 12:00   - صباحًا  10:00 "
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controllerApp
                                                                          .countTheTimeChosed
                                                                          .value ==
                                                                      2
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ),
                                                    ),
                                                  ]))))))),

                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible: controller.showTheSh.value,
                                  child: Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.w,
                                                  vertical: 10.h),
                                              child: Directionality(
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  child: Row(children: [
                                                    InkWell(
                                                      onTap: () {
                                                        controllerApp
                                                            .countTheTimeChosed
                                                            .value = 3;
                                                        controllerApp
                                                                .theTimeChosed
                                                                .value =
                                                            "مساءًا 4:00   - مساءًا  2:00 ";
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: controllerApp
                                                                            .countTheTimeChosed
                                                                            .value ==
                                                                        3
                                                                    ? AppColors
                                                                        .theMainColor
                                                                    : AppColors
                                                                        .whiteColor,
                                                                border:
                                                                    Border.all(
                                                                  color: AppColors
                                                                      .theMainColor, //                   <--- border color
                                                                  width: 1.0,
                                                                )),
                                                        width: 160.w,
                                                        height: 50.h,
                                                        child: Center(
                                                            child: Text(
                                                          "مساءًا 4:00   - مساءًا  2:00 "
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controllerApp
                                                                          .countTheTimeChosed
                                                                          .value ==
                                                                      3
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        controllerApp
                                                            .countTheTimeChosed
                                                            .value = 4;
                                                        controllerApp
                                                                .theTimeChosed
                                                                .value =
                                                            "مساءًا 6:00   - مساءًا  4:00 ";
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: controllerApp
                                                                            .countTheTimeChosed
                                                                            .value ==
                                                                        4
                                                                    ? AppColors
                                                                        .theMainColor
                                                                    : AppColors
                                                                        .whiteColor,
                                                                border:
                                                                    Border.all(
                                                                  color: AppColors
                                                                      .theMainColor, //                   <--- border color
                                                                  width: 1.0,
                                                                )),
                                                        width: 160.w,
                                                        height: 50.h,
                                                        child: Center(
                                                            child: Text(
                                                          "مساءًا 6:00   - مساءًا  4:00 "
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controllerApp
                                                                          .countTheTimeChosed
                                                                          .value ==
                                                                      4
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ),
                                                    ),
                                                  ]))))))),

                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible: controller.showTheSh.value,
                                  child: Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: SingleChildScrollView(
                                          scrollDirection: Axis.horizontal,
                                          child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 15.w,
                                                  vertical: 10.h),
                                              child: Directionality(
                                                  textDirection:
                                                      TextDirection.ltr,
                                                  child: Row(children: [
                                                    InkWell(
                                                      onTap: () {
                                                        controllerApp
                                                            .countTheTimeChosed
                                                            .value = 5;
                                                        controllerApp
                                                                .theTimeChosed
                                                                .value =
                                                            "مساءًا 8:00   - مساءًا  6:00 ";
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: controllerApp
                                                                            .countTheTimeChosed
                                                                            .value ==
                                                                        5
                                                                    ? AppColors
                                                                        .theMainColor
                                                                    : AppColors
                                                                        .whiteColor,
                                                                border:
                                                                    Border.all(
                                                                  color: AppColors
                                                                      .theMainColor,
                                                                  width: 1.0,
                                                                )),
                                                        width: 160.w,
                                                        height: 50.h,
                                                        child: Center(
                                                            child: Text(
                                                          "مساءًا 8:00   - مساءًا  6:00 "
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controllerApp
                                                                          .countTheTimeChosed
                                                                          .value ==
                                                                      5
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 5.w,
                                                    ),
                                                    InkWell(
                                                      onTap: () {
                                                        controllerApp
                                                            .countTheTimeChosed
                                                            .value = 6;
                                                        controllerApp
                                                                .theTimeChosed
                                                                .value =
                                                            "مساءًا 10:00   - مساءًا  8:00 ";
                                                      },
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                                color: controllerApp
                                                                            .countTheTimeChosed
                                                                            .value ==
                                                                        6
                                                                    ? AppColors
                                                                        .theMainColor
                                                                    : AppColors
                                                                        .whiteColor,
                                                                border:
                                                                    Border.all(
                                                                  color: AppColors
                                                                      .theMainColor, //                   <--- border color
                                                                  width: 1.0,
                                                                )),
                                                        width: 160.w,
                                                        height: 50.h,
                                                        child: Center(
                                                            child: Text(
                                                          "مساءًا 10:00   - مساءًا  8:00 "
                                                              .toString(),
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: controllerApp
                                                                          .countTheTimeChosed
                                                                          .value ==
                                                                      6
                                                                  ? AppColors
                                                                      .whiteColor
                                                                  : Colors
                                                                      .black,
                                                              fontSize: 14.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                          textAlign:
                                                              TextAlign.center,
                                                        )),
                                                      ),
                                                    ),
                                                  ]))))))), //////////////////////////Show The Sh........................................./////////////////////

                          //////////////////////////////////////..........End The................................................................/////////////

                          SizedBox(
                            height: 10.h,
                          ),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Padding(
                                padding: EdgeInsets.only(bottom: 40.h),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Row(
                                          children: [
                                            GetX<ChangeLanguageToLocale>(
                                                builder: (scontroller) =>
                                                    scontroller.isChange
                                                                .value ==
                                                            false
                                                        ? Text(
                                                            controller
                                                                .nameTheService
                                                                .value
                                                                .toString(),
                                                            style: TextStyle(
                                                                height: 1.3.h,
                                                                fontSize: 16.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    AppTextStyles
                                                                        .Almarai,
                                                                color: AppColors
                                                                    .balckColorTypeFour),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 2,
                                                          )
                                                        : Text(
                                                            controller
                                                                .nameTheServiceEn
                                                                .value
                                                                .toString(),
                                                            style: TextStyle(
                                                                height: 1.3.h,
                                                                fontSize: 16.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    AppTextStyles
                                                                        .Almarai,
                                                                color: AppColors
                                                                    .blackColor),
                                                            textAlign: TextAlign
                                                                .center,
                                                            maxLines: 2,
                                                          )),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                      FutureBuilder(
                                          future: controllerApp.getSubOfOrders(
                                              controller.theNumberOFORder.value
                                                  .toString()),
                                          builder: (BuildContext context,
                                              AsyncSnapshot snapshot) {
                                            if (snapshot.hasData) {
                                              return controller
                                                          .isHaveTheUserSubOrders
                                                          .value ==
                                                      false
                                                  ? Center(
                                                      child: Text(
                                                        "65-لاتمتلك اي تفرعات لعرضها"
                                                            .tr,
                                                        style: TextStyle(
                                                          height: 1.5.h,
                                                          color: AppColors
                                                              .blackColor,
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                        ),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                    )
                                                  : ListView.builder(
                                                      physics:
                                                          NeverScrollableScrollPhysics(),
                                                      scrollDirection:
                                                          Axis.vertical,
                                                      itemCount: snapshot
                                                          .data['data'].length,
                                                      shrinkWrap: true,
                                                      itemBuilder:
                                                          (context, i) {
                                                        return PaddingCustom(
                                                          theTop: 5.h,
                                                          theBottom: 5.h,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        15.w),
                                                            child: Container(
                                                              width:
                                                                  MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width,
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceBetween,
                                                                children: [
                                                                  Container(
                                                                    child:
                                                                        Column(
                                                                      children: [
                                                                        GetX<ChangeLanguageToLocale>(
                                                                            builder: (scontroller) => scontroller.isChange.value == false
                                                                                ? Text(
                                                                                    snapshot.data['data'][i]['sub_type_name_ar'],
                                                                                    style: TextStyle(height: 1.5.h, fontSize: 13, fontWeight: FontWeight.w600, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                                    textAlign: TextAlign.center,
                                                                                  )
                                                                                : Text(
                                                                                    snapshot.data['data'][i]['sub_type_name_en'],
                                                                                    style: TextStyle(height: 1.5.h, fontSize: 13, fontWeight: FontWeight.w600, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                                    textAlign: TextAlign.center,
                                                                                  )),
                                                                        GetX<ChangeLanguageToLocale>(
                                                                            builder: (scontroller) => scontroller.isChange.value == false
                                                                                ? Center(
                                                                                    child: Text(
                                                                                      snapshot.data['data'][i]['name_type_sub'],
                                                                                      style: TextStyle(height: 1.6.h, fontSize: 10, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                  )
                                                                                : Center(
                                                                                    child: Text(
                                                                                      snapshot.data['data'][i]['name_type_sub_en'],
                                                                                      style: TextStyle(height: 1.6.h, fontSize: 10, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                                  )),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      Text(
                                                                        "AED",
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            2.w,
                                                                      ),
                                                                      Text(
                                                                        snapshot.data['data'][i]
                                                                            [
                                                                            'price_type_sub'],
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.w600,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      });
                                            } else {
                                              return ListView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: 5,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, i) {
                                                    return Shimmer.fromColors(
                                                        baseColor:
                                                            Color.fromARGB(31,
                                                                169, 167, 167),
                                                        highlightColor:
                                                            AppColors
                                                                .whiteColor,
                                                        enabled: true,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10.h),
                                                          child: PaddingCustom(
                                                            theBottom: 10,
                                                            child:
                                                                ContainerCustom(
                                                              theBorderRadius:
                                                                  10,
                                                              colorContainer:
                                                                  AppColors
                                                                      .whiteColor,
                                                              heigthContainer:
                                                                  130,
                                                              widthContainer:
                                                                  MediaQuery.sizeOf(
                                                                          context)
                                                                      .width,
                                                              child:
                                                                  SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.horizontal,
                                                                child: Row(
                                                                  children: [
                                                                    Row(
                                                                      children: [
                                                                        Column(
                                                                          children: [
                                                                            SizedBox(
                                                                              height: 10.h,
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          5.w,
                                                                    ),
                                                                    Column(
                                                                      children: [
                                                                        Align(
                                                                          alignment:
                                                                              Alignment.topCenter,
                                                                          child:
                                                                              PaddingCustom(
                                                                            theTop:
                                                                                30,
                                                                            child:
                                                                                TextCustom(
                                                                              theText: "6-يتم التحميل".tr,
                                                                              fontColor: AppColors.blackColor,
                                                                              fontFamily: AppTextStyles.Almarai,
                                                                              fontSizeWidth: 18,
                                                                              fontWeight: FontWeight.bold,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        Container(
                                                                          width:
                                                                              150.w,
                                                                          height:
                                                                              100.h,
                                                                          child:
                                                                              PaddingCustom(
                                                                            theTop:
                                                                                15,
                                                                            child:
                                                                                Text(
                                                                              "6-يتم التحميل".tr,
                                                                              maxLines: 4,
                                                                              style: TextStyle(fontSize: 14.sp, height: 1.7.h, color: AppColors.balckColorTypeThree, fontFamily: AppTextStyles.Almarai),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.symmetric(
                                                                          vertical:
                                                                              10.h),
                                                                      child:
                                                                          Column(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Align(
                                                                            alignment:
                                                                                Alignment.topCenter,
                                                                            child:
                                                                                PaddingCustom(
                                                                              theTop: 5,
                                                                              child: ContainerCustomApi(
                                                                                colorContainer: AppColors.theMainColor,
                                                                                theBorderRadius: 15,
                                                                                heigthContainer: 15.h,
                                                                                child: Padding(
                                                                                  padding: EdgeInsets.symmetric(horizontal: 8.h),
                                                                                  child: Text(
                                                                                    "6-يتم التحميل".tr,
                                                                                    style: TextStyle(
                                                                                      color: AppColors.blackColor,
                                                                                      fontFamily: AppTextStyles.Almarai,
                                                                                      fontSize: 14,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ),
                                                          ),
                                                        ));
                                                  });
                                            }
                                          }),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        color: Colors.black,
                                        height: 0.7.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              "186-ملخص الدفع".tr,
                                              style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: Colors.black,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "187-سعر العناصر".tr,
                                              style: TextStyle(
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors
                                                    .balckColorTypeThree,
                                                fontSize: 14.sp,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              controller
                                                  .totalPriceTheSerivce.value
                                                  .toString(),
                                              style: TextStyle(
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors
                                                    .balckColorTypeThree,
                                                fontSize: 14.sp,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "188-سعر الخصم".tr,
                                              style: TextStyle(
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors
                                                    .balckColorTypeThree,
                                                fontSize: 14.sp,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              "0",
                                              style: TextStyle(
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors
                                                    .balckColorTypeThree,
                                                fontSize: 14.sp,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Container(
                                        color: AppColors.balckColorTypeThree,
                                        height: 0.1.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              "189-الإجمالي النهائي".tr,
                                              style: TextStyle(
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors
                                                    .balckColorTypeThree,
                                                fontWeight: FontWeight.bold,
                                                fontSize: 14.sp,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  controller
                                                      .totalPriceTheSerivce
                                                      .value
                                                      .toString(),
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors
                                                        .balckColorTypeThree,
                                                    fontSize: 14.sp,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                                Text(
                                                  "AED",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors
                                                        .balckColorTypeThree,
                                                    fontSize: 14.sp,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Container(
                                        color: Colors.black,
                                        height: 0.7.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              "190-طريقة السداد".tr,
                                              style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: Colors.black,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: GetX<ControllerApp>(
                                            builder: (Thecontroller) => Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Thecontroller
                                                        .choosedPay.value = 1;
                                                  },
                                                  child: Container(
                                                    width: 20.w,
                                                    height: 20.h,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Thecontroller
                                                                    .choosedPay
                                                                    .value ==
                                                                1
                                                            ? AppColors
                                                                .theMainColor
                                                            : AppColors
                                                                .whiteColor,
                                                        border: Border.all(
                                                          color: AppColors
                                                              .theMainColor, //                   <--- border color
                                                          width: 1.0,
                                                        )),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text(
                                                  "191-دفع-كاش".tr,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors
                                                        .balckColorTypeThree,
                                                    fontSize: 14.sp,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 20.w),
                                          child: GetX<ControllerApp>(
                                            builder: (Thecontroller) => Row(
                                              children: [
                                                InkWell(
                                                  onTap: () {
                                                    Thecontroller
                                                        .choosedPay.value = 2;
                                                  },
                                                  child: Container(
                                                    width: 20.w,
                                                    height: 20.h,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                        color: Thecontroller
                                                                    .choosedPay
                                                                    .value ==
                                                                2
                                                            ? AppColors
                                                                .theMainColor
                                                            : AppColors
                                                                .whiteColor,
                                                        border: Border.all(
                                                          color: AppColors
                                                              .theMainColor, //                   <--- border color
                                                          width: 1.0,
                                                        )),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 10.w,
                                                ),
                                                Text(
                                                  "192-دفع-اونلاين".tr,
                                                  style: TextStyle(
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors
                                                        .balckColorTypeThree,
                                                    fontSize: 14.sp,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                          )),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Container(
                                        color: Colors.black,
                                        height: 0.7.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              "193-الجدولة المختارة".tr,
                                              style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: Colors.black,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Row(
                                          children: [
                                            Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: Text(
                                                controllerApp
                                                    .theDateChoosd.value
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors
                                                      .balckColorTypeThree,
                                                  fontSize: 14.sp,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Row(
                                          children: [
                                            Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: Text(
                                                controllerApp
                                                    .theTimeChosed.value
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors
                                                      .balckColorTypeThree,
                                                  fontSize: 14.sp,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Container(
                                        color: Colors.black,
                                        height: 0.7.h,
                                        width:
                                            MediaQuery.of(context).size.width,
                                      ),
                                      SizedBox(
                                        height: 15.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.w),
                                        child: Row(
                                          children: [
                                            Text(
                                              "193-البيانات الإضافية".tr,
                                              style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: Colors.black,
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 5.h,
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Material(
                                          elevation: 4,
                                          shadowColor: AppColors.theMainColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: TextFormField(
                                            controller: controller
                                                .addDescriptionController,
                                            onChanged: (value) {
                                              SystemChrome
                                                  .setEnabledSystemUIMode(
                                                      SystemUiMode.manual,
                                                      overlays: []);
                                              controller.textdescriptionOrder =
                                                  value.toString();
                                            },
                                            onSaved: (newValue) {
                                              SystemChrome
                                                  .setEnabledSystemUIMode(
                                                      SystemUiMode.manual,
                                                      overlays: []);
                                              controller.textdescriptionOrder =
                                                  newValue.toString();
                                            },
                                            keyboardType: TextInputType.text,
                                            decoration: InputDecoration(
                                                hintText:
                                                    "81-إضافة تفاصيل اخرى مهمة علينا معرفتها -اكتب ماتريد هنا-"
                                                        .tr,
                                                // important line
                                                // control your hints text size
                                                hintStyle: TextStyle(
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    letterSpacing: 0.8,
                                                    color: AppColors
                                                        .balckColorTypeFour
                                                        .withOpacity(0.5),
                                                    fontWeight:
                                                        FontWeight.bold),
                                                fillColor: Colors.white54,
                                                filled: true,
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    borderSide:
                                                        BorderSide.none)),
                                            maxLines: 7,
                                            minLines: 7,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 5.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            TextCustom(
                                                theText:
                                                    "82-إضافة صورة توضيحية:".tr,
                                                fontSizeWidth: 17,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                fontColor: AppColors
                                                    .blackColorsTypeOne),
                                            InkWell(
                                              onTap: () async {
                                                XFile? xfile =
                                                    await ImagePicker()
                                                        .pickImage(
                                                            source: ImageSource
                                                                .gallery);
                                                if (xfile != null) {
                                                  Random random = new Random();
                                                  int randomNumber =
                                                      random.nextInt(10000000);
                                                  File myfile =
                                                      await File(xfile!.path);

                                                  String dir =
                                                      (await getApplicationDocumentsDirectory())
                                                          .path;
                                                  String newPath = path.join(
                                                      dir, '$randomNumber.jpg');
                                                  File f =
                                                      await File(myfile.path)
                                                          .copy(newPath);

                                                  Timer.periodic(
                                                      Duration(seconds: 1),
                                                      (Timer timer) {
                                                    // ignore: unnecessary_null_comparison
                                                    if (myfile == null) {
                                                    } else {
                                                      if (controller
                                                              .isChooesImage
                                                              .value ==
                                                          false) {
                                                        setState(() {});

                                                        controller.upIm(f);
                                                        setState(() {
                                                          controller.filename =
                                                              basename(f.path);
                                                        });
                                                        controller.addImageWork
                                                            .value = true;
                                                        controller.isChooesImage
                                                            .value = true;
                                                      } else {}
                                                    }
                                                  });
                                                } else {}
                                              },
                                              child: GetX<ControllerApp>(
                                                builder: (controller) =>
                                                    ContainerCustomApi(
                                                        colorContainer: controller
                                                                    .addImageWork
                                                                    .value ==
                                                                true
                                                            ? Colors.green
                                                            : AppColors
                                                                .redColor,
                                                        theBorderRadius: 15,
                                                        heigthContainer: 30.h,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      37.h),
                                                          child: Text(
                                                            controller.addImageWork
                                                                        .value ==
                                                                    true
                                                                ? "83-تم رفع الصورة"
                                                                    .tr
                                                                : "84-رفع صورة"
                                                                    .tr,
                                                            style: TextStyle(
                                                              color: AppColors
                                                                  .whiteColor,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              fontSize: 16,
                                                            ),
                                                          ),
                                                        )),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                    ],
                                  ),
                                ),
                              )),

//#######################################################################//
/*
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  children: [
                                    GetX<ChangeLanguageToLocale>(
                                        builder: (scontroller) => scontroller
                                                    .isChange.value ==
                                                false
                                            ? Text(
                                                controller.nameTheService.value
                                                    .toString(),
                                                style: TextStyle(
                                                    height: 1.3.h,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors
                                                        .balckColorTypeFour),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                              )
                                            : Text(
                                                controller
                                                    .nameTheServiceEn.value
                                                    .toString(),
                                                style: TextStyle(
                                                    height: 1.3.h,
                                                    fontSize: 16.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color:
                                                        AppColors.blackColor),
                                                textAlign: TextAlign.center,
                                                maxLines: 2,
                                              )),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 3.h,
                          ),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Container(
                                height: 100.h,
                                child: FutureBuilder(
                                    future: controllerApp.getSubOfOrders(
                                        controller.theNumberOFORder.value
                                            .toString()),
                                    builder: (BuildContext context,
                                        AsyncSnapshot snapshot) {
                                      if (snapshot.hasData) {
                                        return controller.isHaveTheUserSubOrders
                                                    .value ==
                                                false
                                            ? Center(
                                                child: Text(
                                                  "65-لاتمتلك اي تفرعات لعرضها"
                                                      .tr,
                                                  style: TextStyle(
                                                    height: 1.5.h,
                                                    color: AppColors.blackColor,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )
                                            : ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: snapshot
                                                    .data['data'].length,
                                                shrinkWrap: true,
                                                itemBuilder: (context, i) {
                                                  return PaddingCustom(
                                                    theTop: 5.h,
                                                    theBottom: 5.h,
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 15.w),
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Container(
                                                              child: Column(
                                                                children: [
                                                                  GetX<ChangeLanguageToLocale>(
                                                                      builder: (scontroller) => scontroller.isChange.value == false
                                                                          ? Text(
                                                                              snapshot.data['data'][i]['sub_type_name_ar'],
                                                                              style: TextStyle(height: 1.5.h, fontSize: 13, fontWeight: FontWeight.w600, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                              textAlign: TextAlign.center,
                                                                            )
                                                                          : Text(
                                                                              snapshot.data['data'][i]['sub_type_name_en'],
                                                                              style: TextStyle(height: 1.5.h, fontSize: 13, fontWeight: FontWeight.w600, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                              textAlign: TextAlign.center,
                                                                            )),
                                                                  GetX<ChangeLanguageToLocale>(
                                                                      builder: (scontroller) => scontroller.isChange.value == false
                                                                          ? Center(
                                                                              child: Text(
                                                                                snapshot.data['data'][i]['name_type_sub'],
                                                                                style: TextStyle(height: 1.6.h, fontSize: 10, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                            )
                                                                          : Center(
                                                                              child: Text(
                                                                                snapshot.data['data'][i]['name_type_sub_en'],
                                                                                style: TextStyle(height: 1.6.h, fontSize: 10, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                            )),
                                                                ],
                                                              ),
                                                            ),
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "AED",
                                                                  style: TextStyle(
                                                                      height:
                                                                          1.3.h,
                                                                      fontSize:
                                                                          12,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      fontFamily:
                                                                          AppTextStyles
                                                                              .Almarai,
                                                                      color: AppColors
                                                                          .balckColorTypeFour),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                                SizedBox(
                                                                  width: 2.w,
                                                                ),
                                                                Text(
                                                                  snapshot.data[
                                                                          'data'][i]
                                                                      [
                                                                      'price_type_sub'],
                                                                  style: TextStyle(
                                                                      height:
                                                                          1.3.h,
                                                                      fontSize:
                                                                          15,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w600,
                                                                      fontFamily:
                                                                          AppTextStyles
                                                                              .Almarai,
                                                                      color: AppColors
                                                                          .balckColorTypeFour),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                });
                                      } else {
                                        return ListView.builder(
                                            scrollDirection: Axis.vertical,
                                            itemCount: 5,
                                            shrinkWrap: true,
                                            itemBuilder: (context, i) {
                                              return Shimmer.fromColors(
                                                  baseColor: Color.fromARGB(
                                                      31, 169, 167, 167),
                                                  highlightColor:
                                                      AppColors.whiteColor,
                                                  enabled: true,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 10.h),
                                                    child: PaddingCustom(
                                                      theBottom: 10,
                                                      child: ContainerCustom(
                                                        theBorderRadius: 10,
                                                        colorContainer:
                                                            AppColors
                                                                .whiteColor,
                                                        heigthContainer: 130,
                                                        widthContainer:
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Row(
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Column(
                                                                    children: [
                                                                      SizedBox(
                                                                        height:
                                                                            10.h,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                width: 5.w,
                                                              ),
                                                              Column(
                                                                children: [
                                                                  Align(
                                                                    alignment:
                                                                        Alignment
                                                                            .topCenter,
                                                                    child:
                                                                        PaddingCustom(
                                                                      theTop:
                                                                          30,
                                                                      child:
                                                                          TextCustom(
                                                                        theText:
                                                                            "6-يتم التحميل".tr,
                                                                        fontColor:
                                                                            AppColors.blackColor,
                                                                        fontFamily:
                                                                            AppTextStyles.Almarai,
                                                                        fontSizeWidth:
                                                                            18,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width:
                                                                        150.w,
                                                                    height:
                                                                        100.h,
                                                                    child:
                                                                        PaddingCustom(
                                                                      theTop:
                                                                          15,
                                                                      child:
                                                                          Text(
                                                                        "6-يتم التحميل"
                                                                            .tr,
                                                                        maxLines:
                                                                            4,
                                                                        style: TextStyle(
                                                                            fontSize:
                                                                                14.sp,
                                                                            height: 1.7.h,
                                                                            color: AppColors.balckColorTypeThree,
                                                                            fontFamily: AppTextStyles.Almarai),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        vertical:
                                                                            10.h),
                                                                child: Column(
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .spaceBetween,
                                                                  children: [
                                                                    Align(
                                                                      alignment:
                                                                          Alignment
                                                                              .topCenter,
                                                                      child:
                                                                          PaddingCustom(
                                                                        theTop:
                                                                            5,
                                                                        child:
                                                                            ContainerCustomApi(
                                                                          colorContainer:
                                                                              AppColors.theMainColor,
                                                                          theBorderRadius:
                                                                              15,
                                                                          heigthContainer:
                                                                              15.h,
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: 8.h),
                                                                            child:
                                                                                Text(
                                                                              "6-يتم التحميل".tr,
                                                                              style: TextStyle(
                                                                                color: AppColors.blackColor,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                fontSize: 14,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  ));
                                            });
                                      }
                                    }),
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 10.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Container(
                                color: Colors.black,
                                height: 0.7.h,
                                width: MediaQuery.of(context).size.width,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 10.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  children: [
                                    Text(
                                      "186-ملخص الدفع".tr,
                                      style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: Colors.black,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 10.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "187-سعر العناصر".tr,
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeThree,
                                        fontSize: 14.sp,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      controller.totalPriceTheSerivce.value
                                          .toString(),
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeThree,
                                        fontSize: 14.sp,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 10.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "188-سعر الخصم".tr,
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeThree,
                                        fontSize: 14.sp,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "0",
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeThree,
                                        fontSize: 14.sp,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 10.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Container(
                                color: AppColors.balckColorTypeThree,
                                height: 0.1.h,
                                width: MediaQuery.of(context).size.width,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 10.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "189-الإجمالي النهائي".tr,
                                      style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeThree,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14.sp,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          controller.totalPriceTheSerivce.value
                                              .toString(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppTextStyles.Almarai,
                                            color:
                                                AppColors.balckColorTypeThree,
                                            fontSize: 14.sp,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "AED",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppTextStyles.Almarai,
                                            color:
                                                AppColors.balckColorTypeThree,
                                            fontSize: 14.sp,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 15.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Container(
                                color: Colors.black,
                                height: 0.7.h,
                                width: MediaQuery.of(context).size.width,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 15.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  children: [
                                    Text(
                                      "190-طريقة السداد".tr,
                                      style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: Colors.black,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 10.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: GetX<ControllerApp>(
                                    builder: (Thecontroller) => Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Thecontroller.choosedPay.value = 1;
                                          },
                                          child: Container(
                                            width: 20.w,
                                            height: 20.h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Thecontroller
                                                            .choosedPay.value ==
                                                        1
                                                    ? AppColors.theMainColor
                                                    : AppColors.whiteColor,
                                                border: Border.all(
                                                  color: AppColors
                                                      .theMainColor, //                   <--- border color
                                                  width: 1.0,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          "191-دفع-كاش".tr,
                                          style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color:
                                                AppColors.balckColorTypeThree,
                                            fontSize: 14.sp,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ))),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 5.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 20.w),
                                  child: GetX<ControllerApp>(
                                    builder: (Thecontroller) => Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Thecontroller.choosedPay.value = 2;
                                          },
                                          child: Container(
                                            width: 20.w,
                                            height: 20.h,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Thecontroller
                                                            .choosedPay.value ==
                                                        2
                                                    ? AppColors.theMainColor
                                                    : AppColors.whiteColor,
                                                border: Border.all(
                                                  color: AppColors
                                                      .theMainColor, //                   <--- border color
                                                  width: 1.0,
                                                )),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 10.w,
                                        ),
                                        Text(
                                          "192-دفع-اونلاين".tr,
                                          style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color:
                                                AppColors.balckColorTypeThree,
                                            fontSize: 14.sp,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ))),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 15.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Container(
                                color: Colors.black,
                                height: 0.7.h,
                                width: MediaQuery.of(context).size.width,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 15.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  children: [
                                    Text(
                                      "193-الجدولة المختارة".tr,
                                      style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: Colors.black,
                                          fontSize: 17.sp,
                                          fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 10.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  children: [
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Text(
                                        controllerApp.theDateChoosd.value
                                            .toString(),
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  ],
                                ),
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: SizedBox(
                                height: 5.h,
                              )),
                          Visibility(
                              visible: controllerApp.showTheConfOrder.value,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20.w),
                                child: Row(
                                  children: [
                                    Directionality(
                                      textDirection: TextDirection.ltr,
                                      child: Text(
                                        controllerApp.theTimeChosed.value
                                            .toString(),
                                        style: TextStyle(
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.balckColorTypeThree,
                                          fontSize: 14.sp,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
*/
                          /////////////////////////////////////////////End Order...................///////////
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: Align(
                                    alignment: Alignment.center,
                                    child: Lottie.asset(ImagesPath.successfully,
                                        repeat: false,
                                        width: 150.w,
                                        height: 120.h),
                                  ))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: Text(
                                    "194-إنتهت العملية".tr,
                                    style: TextStyle(
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.blackColor,
                                        fontSize: 18.sp,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: SizedBox(
                                    height: 10.h,
                                  ))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 20.w),
                                      child: Container(
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            color: AppColors.whiteColor,
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.1),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0,
                                                    3), // changes position of shadow
                                              ),
                                            ],
                                          ),
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 80.h,
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                    Text(
                                                      "195-رقم الطلبية:".tr,
                                                      style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .blackColor,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                    Text(
                                                      controllerApp
                                                          .theNumberOFORder
                                                          .value
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .blackColor,
                                                          fontSize: 15.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 10.w),
                                                  child: Text(
                                                    "196-عزيزي العميل,شُكرا لك على إتمام الطلب..قريبًا سيتم التواصل معك لأتمام العملية"
                                                        .tr,
                                                    style: TextStyle(
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: AppColors
                                                          .balckColorTypeThree,
                                                      fontSize: 12.sp,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ))))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: SizedBox(
                                    height: 10.h,
                                  ))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "197-إجمالي الطلب".tr,
                                          style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color: AppColors.blackColor,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              controller
                                                  .totalPriceTheSerivce.value
                                                  .toString(),
                                              style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors.blackColor,
                                                  fontSize: 18.sp,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                            Text(
                                              "AED",
                                              style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors.theMainColor,
                                                  fontSize: 14.sp,
                                                  fontWeight: FontWeight.bold),
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: SizedBox(
                                    height: 5.h,
                                  ))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: Container(
                                    color: Colors.black,
                                    height: 0.7.h,
                                    width: MediaQuery.of(context).size.width,
                                  ))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: SizedBox(
                                    height: 5.h,
                                  ))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Row(
                                        children: [
                                          Text(
                                            "198-جدولة الوقت والتاريخ".tr,
                                            style: TextStyle(
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors.blackColor,
                                                fontSize: 18.sp,
                                                fontWeight: FontWeight.bold),
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      )))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Row(
                                        children: [
                                          Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: Text(
                                                controllerApp
                                                    .theDateChoosd.value
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors
                                                      .balckColorTypeThree,
                                                  fontSize: 14.sp,
                                                ),
                                                textAlign: TextAlign.center,
                                              )),
                                        ],
                                      )))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 10.w),
                                      child: Row(
                                        children: [
                                          Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: Text(
                                                controllerApp
                                                    .theTimeChosed.value
                                                    .toString(),
                                                style: TextStyle(
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors
                                                      .balckColorTypeThree,
                                                  fontSize: 14.sp,
                                                ),
                                                textAlign: TextAlign.center,
                                              )),
                                        ],
                                      )))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: SizedBox(
                                    height: 25.h,
                                  ))),
                          GetX<ControllerApp>(
                              builder: (controller) => Visibility(
                                  visible:
                                      controller.showTheEndOfPageOrder.value,
                                  child: SingleChildScrollView(
                                      scrollDirection: Axis.horizontal,
                                      child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 15.w, vertical: 10.h),
                                          child: Directionality(
                                              textDirection: TextDirection.ltr,
                                              child: Row(children: [
                                                InkWell(
                                                  onTap: () {
                                                    controllerApp
                                                        .showTheOrderPage
                                                        .value = true;
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: AppColors
                                                            .theMainColor,
                                                        border: Border.all(
                                                          color: AppColors
                                                              .theMainColor, //                   <--- border color
                                                          width: 1.0,
                                                        )),
                                                    width: 160.w,
                                                    height: 50.h,
                                                    child: Center(
                                                        child: Text(
                                                      "199-العملية"
                                                          .tr
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: AppColors
                                                              .whiteColor,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: 5.w,
                                                ),
                                                InkWell(
                                                  onTap: () {
                                                    controllerApp
                                                        .showTheEndOfPageOrder
                                                        .value = false;
                                                    controllerApp
                                                        .OpeartionsOrderPage
                                                        .value = false;
                                                    controller
                                                        .showTheDetialsAboutTheService
                                                        .value = false;
                                                    controller
                                                        .showTheSubTypeOFService
                                                        .value = false;
                                                    controllerApp.clearOrder();
                                                    controllerApp
                                                        .clearTheDataOrder();
                                                    controller.countTheSerivce
                                                        .value = 0;
                                                    controller
                                                        .totalPriceTheSerivce
                                                        .value = 0;
                                                    controller.choseService
                                                        .clear();
                                                    controller
                                                        .showTheSubTypeOFService
                                                        .value = false;
                                                  },
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: AppColors
                                                            .whiteColor,
                                                        border: Border.all(
                                                          color: AppColors
                                                              .theMainColor, //                   <--- border color
                                                          width: 1.0,
                                                        )),
                                                    width: 160.w,
                                                    height: 50.h,
                                                    child: Center(
                                                        child: Text(
                                                      "200-العودة"
                                                          .tr
                                                          .toString(),
                                                      style: TextStyle(
                                                          fontFamily:
                                                              AppTextStyles
                                                                  .Almarai,
                                                          color: Colors.black,
                                                          fontSize: 14.sp,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                      textAlign:
                                                          TextAlign.center,
                                                    )),
                                                  ),
                                                ),
                                              ])))))),

                          //////////////////////////////////////////////////////////////////
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: GetX<ControllerApp>(
                        builder: (controller) => Visibility(
                            visible:
                                controller.whereIsTheOrderStyp.value == 3 ||
                                    controller.whereIsTheOrderStyp.value == 4,
                            child: Container(
                              color: AppColors.theMainColor,
                              width: MediaQuery.of(context).size.width,
                              height: 50.h,
                              child: Center(
                                  child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 30.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.FuwhereIsTheOrderStyp();
                                      },
                                      child: Text(
                                        controllerApp.buttonInOrder.value,
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.whiteColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          controller.totalPriceTheSerivce.value
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color: AppColors.whiteColor,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                        Text(
                                          "AED",
                                          style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color: AppColors.yellowColor,
                                              fontSize: 14.sp,
                                              fontWeight: FontWeight.bold),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                            ))),
                  )
                ],
              ),
            )));
  }
}
