import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
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

class OrdersConfirmation extends StatefulWidget {
  const OrdersConfirmation({super.key});

  @override
  State<OrdersConfirmation> createState() => _OrdersConfirmationState();
}

class _OrdersConfirmationState extends State<OrdersConfirmation> {
  @override
  Widget build(BuildContext context) {
    ControllerApp homeController = Get.put(ControllerApp());

    return GetX<ControllerApp>(
        builder: (controller) => Visibility(
            visible: controller.showTheOrderAndConfirmationThat.value,
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
                Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(0)),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                        child: Column(children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "59-عملية تاكيد الطلبية".tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 17,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                            ),
                            InkWell(
                              onTap: () {
                                controller.showTheOrderAndConfirmationThat
                                    .value = false;
                                controller.clearTheDataOrder();
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
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
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "60-التفاصيل العامة".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: SizedBox(
                          height: 20.h,
                          child: Row(
                            children: [
                              Text(
                                "61-نوع الخدمة:".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                height: 20.h,
                                decoration: BoxDecoration(
                                    color: AppColors.yellowColor,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: GetX<ChangeLanguageToLocale>(
                                      builder: (scontroller) => scontroller
                                                  .isChange.value ==
                                              false
                                          ? Text(
                                              controller.nameOfMainTypeOrder
                                                  .toString(),
                                              style: TextStyle(
                                                  height: 1.3.h,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors
                                                      .balckColorTypeFour),
                                              textAlign: TextAlign.center,
                                            )
                                          : Text(
                                              controller.nameOfMainTypeOrderEn
                                                  .toString(),
                                              style: TextStyle(
                                                  height: 1.3.h,
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.w600,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors
                                                      .balckColorTypeFour),
                                              textAlign: TextAlign.center,
                                            )),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Text(
                              "62-رقم الطلبية:".tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                                height: 20.h,
                                decoration: BoxDecoration(
                                    color: Colors.cyan,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Text(
                                    controller.numberOfOrder.toString(),
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 15,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor),
                                    textAlign: TextAlign.center,
                                  ),
                                ))
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          children: [
                            Text(
                              "63-إجمالي الطلبية:".tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            Container(
                                height: 20.h,
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(5)),
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "AED",
                                        style: TextStyle(
                                            height: 1.3.h,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.whiteColor),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Text(
                                        controller.totalOfOrder.toString(),
                                        style: TextStyle(
                                            height: 1.3.h,
                                            fontSize: 15,
                                            fontWeight: FontWeight.w600,
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.whiteColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "64-تفاصيل أنواع الخدمة المقدمة".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      FutureBuilder(
                          future: homeController.getSubOfOrders(
                              controller.numberOfOrder.toString()),
                          builder:
                              (BuildContext context, AsyncSnapshot snapshot) {
                            if (snapshot.hasData) {
                              return controller.isHaveTheUserSubOrders.value ==
                                      false
                                  ? Center(
                                      child: Text(
                                        "65-لاتمتلك اي تفرعات لعرضها".tr,
                                        style: TextStyle(
                                          height: 1.5.h,
                                          color: AppColors.blackColor,
                                          fontFamily: AppTextStyles.Almarai,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    )
                                  : ListView.builder(
                                      scrollDirection: Axis.vertical,
                                      itemCount: snapshot.data['data'].length,
                                      shrinkWrap: true,
                                      itemBuilder: (context, i) {
                                        return PaddingCustom(
                                          theTop: 5.h,
                                          theBottom: 5.h,
                                          child: SizedBox(
                                            height: 20.h,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 10.w),
                                              child: SingleChildScrollView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      child: GetX<
                                                              ChangeLanguageToLocale>(
                                                          builder: (scontroller) =>
                                                              scontroller.isChange
                                                                          .value ==
                                                                      false
                                                                  ? Text(
                                                                      snapshot.data['data']
                                                                              [
                                                                              i]
                                                                          [
                                                                          'sub_type_name_ar'],
                                                                      style: TextStyle(
                                                                          height: 1.5
                                                                              .h,
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontFamily: AppTextStyles
                                                                              .Almarai,
                                                                          color:
                                                                              AppColors.balckColorTypeFour),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    )
                                                                  : Text(
                                                                      snapshot.data['data']
                                                                              [
                                                                              i]
                                                                          [
                                                                          'sub_type_name_en'],
                                                                      style: TextStyle(
                                                                          height: 1.5
                                                                              .h,
                                                                          fontSize:
                                                                              13,
                                                                          fontWeight: FontWeight
                                                                              .w600,
                                                                          fontFamily: AppTextStyles
                                                                              .Almarai,
                                                                          color:
                                                                              AppColors.balckColorTypeFour),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    )),
                                                    ),
                                                    SizedBox(
                                                      width: 7.w,
                                                    ),
                                                    Container(
                                                      alignment:
                                                          Alignment.center,
                                                      height: 20.h,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .yellowColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5)),
                                                      child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10.w),
                                                          child: Center(
                                                            child: GetX<
                                                                    ChangeLanguageToLocale>(
                                                                builder: (scontroller) =>
                                                                    scontroller.isChange.value ==
                                                                            false
                                                                        ? Center(
                                                                            child:
                                                                                Text(
                                                                              snapshot.data['data'][i]['name_type_sub'],
                                                                              style: TextStyle(height: 1.6.h, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          )
                                                                        : Center(
                                                                            child:
                                                                                Text(
                                                                              snapshot.data['data'][i]['name_type_sub_en'],
                                                                              style: TextStyle(height: 1.6.h, fontSize: 12, fontWeight: FontWeight.w600, fontFamily: AppTextStyles.Almarai, color: AppColors.balckColorTypeFour),
                                                                              textAlign: TextAlign.center,
                                                                            ),
                                                                          )),
                                                          )),
                                                    ),
                                                    SizedBox(
                                                      width: 5,
                                                    ),
                                                    Container(
                                                        height: 20.h,
                                                        decoration: BoxDecoration(
                                                            color: Colors.green,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10.w),
                                                          child: Row(
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
                                                                        .whiteColor),
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
                                                                        .whiteColor),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ],
                                                ),
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
                                        baseColor:
                                            Color.fromARGB(31, 169, 167, 167),
                                        highlightColor: AppColors.whiteColor,
                                        enabled: true,
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.h),
                                          child: PaddingCustom(
                                            theBottom: 10,
                                            child: ContainerCustom(
                                              theBorderRadius: 10,
                                              colorContainer:
                                                  AppColors.whiteColor,
                                              heigthContainer: 130,
                                              widthContainer:
                                                  MediaQuery.sizeOf(context)
                                                      .width,
                                              child: SingleChildScrollView(
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
                                                      width: 5.w,
                                                    ),
                                                    Column(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment
                                                              .topCenter,
                                                          child: PaddingCustom(
                                                            theTop: 30,
                                                            child: TextCustom(
                                                              theText:
                                                                  "6-يتم التحميل"
                                                                      .tr,
                                                              fontColor: AppColors
                                                                  .blackColor,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              fontSizeWidth: 18,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 150.w,
                                                          height: 100.h,
                                                          child: PaddingCustom(
                                                            theTop: 15,
                                                            child: Text(
                                                              "6-يتم التحميل"
                                                                  .tr,
                                                              maxLines: 4,
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      14.sp,
                                                                  height: 1.7.h,
                                                                  color: AppColors
                                                                      .balckColorTypeThree,
                                                                  fontFamily:
                                                                      AppTextStyles
                                                                          .Almarai),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 10.h),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: [
                                                          Align(
                                                            alignment: Alignment
                                                                .topCenter,
                                                            child:
                                                                PaddingCustom(
                                                              theTop: 5,
                                                              child:
                                                                  ContainerCustomApi(
                                                                colorContainer:
                                                                    AppColors
                                                                        .theMainColor,
                                                                theBorderRadius:
                                                                    15,
                                                                heigthContainer:
                                                                    15.h,
                                                                child: Padding(
                                                                  padding: EdgeInsets
                                                                      .symmetric(
                                                                          horizontal:
                                                                              8.h),
                                                                  child: Text(
                                                                    "6-يتم التحميل"
                                                                        .tr,
                                                                    style:
                                                                        TextStyle(
                                                                      color: AppColors
                                                                          .blackColor,
                                                                      fontFamily:
                                                                          AppTextStyles
                                                                              .Almarai,
                                                                      fontSize:
                                                                          14,
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
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "66-عملية الجدولة".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      PaddingCustom(
                        theTop: 10.h,
                        theBottom: 00.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "67-قم بجدولة الخدمة..أختار التاريخ والوقت المناسبين لك عن طريق الخيارات التالية"
                                  .tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 12,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          controller.showTheDate.value = true;
                        },
                        child: Container(
                            height: 20.h,
                            decoration: BoxDecoration(
                                color: AppColors.yellowColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              child: Text(
                                "68-إختيار تاريخ".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "69-التاريخ المُدخل:".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeFour),
                            textAlign: TextAlign.center,
                          ),
                          Text(
                            controller.theDate.value.toString(),
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.theMainColorTwo),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          controller.showTheTime.value = true;
                        },
                        child: Container(
                            height: 20.h,
                            decoration: BoxDecoration(
                                color: AppColors.yellowColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 40.w),
                              child: Text(
                                "70-إختيار الوقت".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "71-الوقت المُدخل:".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.balckColorTypeFour),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Text(
                            controller.theTime.value.toString(),
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.theMainColorTwo),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "72-آلية الدفع".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      PaddingCustom(
                          theTop: 20.h,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10.w),
                            child: Row(
                              children: [
                                Text(
                                  "73-دفع نقدي-كاش".tr,
                                  style: TextStyle(
                                      height: 1.3.h,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600,
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.balckColorTypeFour),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  width: 20.w,
                                ),
                                InkWell(
                                    onTap: () {
                                      controller.howToPayTheOrder.value = 1;
                                    },
                                    child: AnimatedContainer(
                                        duration: Duration(milliseconds: 1250),
                                        height: 20.h,
                                        decoration: BoxDecoration(
                                            color: controller.howToPayTheOrder
                                                        .value ==
                                                    1
                                                ? Colors.green
                                                : AppColors.yellowColor,
                                            borderRadius:
                                                BorderRadius.circular(5)),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: controller
                                                          .howToPayTheOrder
                                                          .value ==
                                                      1
                                                  ? 30.w
                                                  : 10.w),
                                          child: Text(
                                            "74-إختيار هذه الآلية".tr,
                                            style: TextStyle(
                                                height: 1.3.h,
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: controller
                                                            .howToPayTheOrder
                                                            .value ==
                                                        1
                                                    ? AppColors.whiteColor
                                                    : AppColors
                                                        .balckColorTypeFour),
                                            textAlign: TextAlign.center,
                                          ),
                                        ))),
                              ],
                            ),
                          )),
                      PaddingCustom(
                        theTop: 10.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10.w),
                          child: Row(
                            children: [
                              Text(
                                "75-دفع إلكتروني-عبر البطاقة".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              InkWell(
                                onTap: () {
                                  controller.howToPayTheOrder.value = 2;
                                },
                                child: AnimatedContainer(
                                    duration: Duration(milliseconds: 1250),
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                        color:
                                            controller.howToPayTheOrder.value ==
                                                    2
                                                ? Colors.green
                                                : AppColors.yellowColor,
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: controller
                                                      .howToPayTheOrder.value ==
                                                  2
                                              ? 30.w
                                              : 10.w),
                                      child: Text(
                                        "76-إختيار هذه الآلية".tr,
                                        style: TextStyle(
                                            height: 1.3.h,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: AppTextStyles.Almarai,
                                            color: controller.howToPayTheOrder
                                                        .value ==
                                                    2
                                                ? AppColors.whiteColor
                                                : AppColors.balckColorTypeFour),
                                        textAlign: TextAlign.center,
                                      ),
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "77-موقعك".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      PaddingCustom(
                        theTop: 00.h,
                        theBottom: 00.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "78-هذا موقعك الذي سيتم تقديم الخدمة فيه-اضغط على الزر لرؤية الموقع-"
                                  .tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 12,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      InkWell(
                        onTap: () {
                          controller.showTheLocation.value = true;
                        },
                        child: Container(
                            height: 20.h,
                            decoration: BoxDecoration(
                                color: AppColors.yellowColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Text(
                                "79-مشاهدة موقعك".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                              ),
                            )),
                      ),
                      PaddingCustom(
                        theTop: 10.h,
                        theBottom: 10.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "80-هل هنالك خطا في موقعك؟ تستطيع تغيير موقعك من خلال الذهاب إلى الاعدادت-موقعي-تغيير الموقع"
                                  .tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 10,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.theMainColorTwo),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "80-تفاصيل أخرى".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Material(
                          elevation: 4,
                          shadowColor: AppColors.theMainColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: TextFormField(
                            controller: homeController.addDescriptionController,
                            onChanged: (value) {
                              controller.textdescriptionOrder =
                                  value.toString();
                            },
                            onSaved: (newValue) {
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
                                    fontFamily: AppTextStyles.Almarai,
                                    letterSpacing: 0.8,
                                    color: AppColors.balckColorTypeFour
                                        .withOpacity(0.5),
                                    fontWeight: FontWeight.bold),
                                fillColor: Colors.white54,
                                filled: true,
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                    borderSide: BorderSide.none)),
                            maxLines: 7,
                            minLines: 7,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          TextCustom(
                              theText: "82-إضافة صورة توضيحية:".tr,
                              fontSizeWidth: 17,
                              fontFamily: AppTextStyles.Almarai,
                              fontColor: AppColors.blackColorsTypeOne),
                          InkWell(
                            onTap: () async {
                              XFile? xfile = await ImagePicker()
                                  .pickImage(source: ImageSource.gallery);
                              if (xfile != null) {
                                Random random = new Random();
                                int randomNumber = random.nextInt(10000000);
                                File myfile = await File(xfile!.path);

                                String dir =
                                    (await getApplicationDocumentsDirectory())
                                        .path;
                                String newPath =
                                    path.join(dir, '$randomNumber.jpg');
                                File f = await File(myfile.path).copy(newPath);

                                Timer.periodic(Duration(seconds: 1),
                                    (Timer timer) {
                                  // ignore: unnecessary_null_comparison
                                  if (myfile == null) {
                                  } else {
                                    if (homeController.isChooesImage.value ==
                                        false) {
                                      setState(() {});

                                      homeController.upIm(f);
                                      setState(() {
                                        homeController.filename =
                                            basename(f.path);
                                      });
                                      homeController.addImageWork.value = true;
                                      homeController.isChooesImage.value = true;
                                    } else {}
                                  }
                                });
                              } else {}
                            },
                            child: GetX<ControllerApp>(
                              builder: (controller) => ContainerCustomApi(
                                  colorContainer:
                                      controller.addImageWork.value == true
                                          ? Colors.green
                                          : AppColors.redColor,
                                  theBorderRadius: 15,
                                  heigthContainer: 30.h,
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 37.h),
                                    child: Text(
                                      controller.addImageWork.value == true
                                          ? "83-تم رفع الصورة".tr
                                          : "84-رفع صورة".tr,
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontFamily: AppTextStyles.Almarai,
                                        fontSize: 16,
                                      ),
                                    ),
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          alignment: Alignment.center,
                          width: 200.w,
                          height: 35.h,
                          decoration: BoxDecoration(
                              color: AppColors.balckColorTypeFour,
                              borderRadius: BorderRadius.circular(5)),
                          child: Text(
                            "85-الإنهاء".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 15,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      PaddingCustom(
                        theTop: 00.h,
                        theBottom: 00.h,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 30.w),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              "86-قم بإنهاء العملية الان إما للتاكيد الطلبية من أجل القيام بها..او إلغاء الطلبية"
                                  .tr,
                              style: TextStyle(
                                  height: 1.3.h,
                                  fontSize: 12,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.balckColorTypeFour),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 50.w, vertical: 10.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      color: AppColors.theMainColorTwo,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.w),
                                    child: Text(
                                      "87-الالغاء".tr,
                                      style: TextStyle(
                                          height: 1.3.h,
                                          fontSize: 17,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.whiteColor),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                            InkWell(
                              onTap: () {
                                controller.endTheOrder(
                                    controller.idOfOrder.toString(),
                                    controller.textdescriptionOrder.toString(),
                                    controller.filename.toString(),
                                    controller.theTime.value.toString(),
                                    controller.theDate.value.toString(),
                                    controller.howToPayTheOrder.value
                                        .toString());
                              },
                              child: Container(
                                  alignment: Alignment.center,
                                  height: 20.h,
                                  decoration: BoxDecoration(
                                      color: Colors.green,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 30.w),
                                    child: Text(
                                      "88-التاكيد الان".tr,
                                      style: TextStyle(
                                          height: 1.3.h,
                                          fontSize: 17,
                                          fontFamily: AppTextStyles.Almarai,
                                          color: AppColors.whiteColor),
                                      textAlign: TextAlign.center,
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ]))),
                Visibility(
                    visible: controller.showTheDate.value,
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black38,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  height: 320.h,
                                  color: AppColors.whiteColor,
                                  child: CupertinoDatePicker(
                                    mode: CupertinoDatePickerMode.date,
                                    initialDateTime: DateTime(
                                        DateTime.now().year,
                                        DateTime.now().month,
                                        DateTime.now().day),
                                    onDateTimeChanged: (DateTime newDateTime) {
                                      // Do something
                                      controller.theDate.value =
                                          "${newDateTime.year.toString()} - ${newDateTime.month.toString()} - ${newDateTime.day.toString()}";
                                    },
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    controller.showTheDate.value = false;
                                  },
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 20.h,
                                      decoration: BoxDecoration(
                                          color: AppColors.theMainColorTwo,
                                          borderRadius:
                                              BorderRadius.circular(0)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 30.w),
                                        child: Text(
                                          "89-التاكيد".tr,
                                          style: TextStyle(
                                              height: 1.3.h,
                                              fontSize: 17,
                                              fontFamily: AppTextStyles.Almarai,
                                              color: AppColors.whiteColor),
                                          textAlign: TextAlign.center,
                                        ),
                                      )),
                                ),
                              ],
                            )),
                      ],
                    )),
                Visibility(
                    visible: controller.showTheTime.value,
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
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black38,
                        ),
                        Align(
                            alignment: Alignment.center,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.90,
                              height: 300.h,
                              color: AppColors.whiteColor,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 20.w, vertical: 10.h),
                                    child: Row(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            controller.showTheflexibleORspecific
                                                .value = 1;
                                          },
                                          child: Container(
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .showTheflexibleORspecific
                                                              .value ==
                                                          1
                                                      ? AppColors
                                                          .theMainColorTwo
                                                      : AppColors.yellowColor,
                                                  borderRadius:
                                                      BorderRadius.circular(0)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                child: Text(
                                                  "90-جدول وقتي مرن".tr,
                                                  style: TextStyle(
                                                      height: 1.3.h,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: controller
                                                                  .showTheflexibleORspecific
                                                                  .value ==
                                                              1
                                                          ? AppColors.whiteColor
                                                          : AppColors
                                                              .balckColorTypeFour),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        ),
                                        SizedBox(
                                          width: 5.w,
                                        ),
                                        InkWell(
                                          onTap: () {
                                            controller.showTheflexibleORspecific
                                                .value = 2;
                                          },
                                          child: Container(
                                              height: 20.h,
                                              decoration: BoxDecoration(
                                                  color: controller
                                                              .showTheflexibleORspecific
                                                              .value ==
                                                          2
                                                      ? AppColors
                                                          .theMainColorTwo
                                                      : AppColors.yellowColor,
                                                  borderRadius:
                                                      BorderRadius.circular(0)),
                                              child: Padding(
                                                padding: EdgeInsets.symmetric(
                                                    horizontal: 20.w),
                                                child: Text(
                                                  "91-جدول وقتي محدد".tr,
                                                  style: TextStyle(
                                                      height: 1.3.h,
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color: controller
                                                                  .showTheflexibleORspecific
                                                                  .value ==
                                                              2
                                                          ? AppColors.whiteColor
                                                          : AppColors
                                                              .balckColorTypeFour),
                                                  textAlign: TextAlign.center,
                                                ),
                                              )),
                                        ),
                                      ],
                                    ),
                                  ),
                                  ///////////////////////////////////////////////
                                  Container(
                                    width: MediaQuery.of(context).size.width *
                                        0.90,
                                    height: 250.h,
                                    child: SingleChildScrollView(
                                      child: controller
                                                  .showTheflexibleORspecific
                                                  .value ==
                                              2
                                          ? Column(
                                              ////////////////////////Flexible Time..............///////////////////////
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                  Text(
                                                    "92-الاوقات المحددة  للقيام بعمليات الخدمة..أختر الوقت المناسب لك..."
                                                        .tr,
                                                    style: TextStyle(
                                                        height: 1.3.h,
                                                        fontSize: 15,
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .balckColorTypeFour),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    height: 9.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "9 AM",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 1;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "9 Am";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          1
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        1
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  /////////////////////////////////////
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "10 AM",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 2;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "10 Am";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          2
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        2
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  /////////////////////
                                                  /////////////////////////////////////
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "11 AM",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 3;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "11 Am";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          3
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        3
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //////////////////////////////
                                                  /////////////////////////////////////
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "12 AM",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 4;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "12 Am";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          4
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        4
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //////////////////////////////////
                                                  /////////////////////////////////////
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "1 PM",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 5;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "1 Pm";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          5
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        5
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  //////////////////////////////
                                                  /////////////////////////////////////
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "2 Pm",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 6;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "2 Pm";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          6
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        6
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),

                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "3 Pm",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 7;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "3 Pm";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          7
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        7
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "4 Pm",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 8;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "4 Pm";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          8
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        8
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "5 Pm",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 9;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "5 Pm";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          9
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        9
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "6 Pm",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 10;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "6 Pm";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          10
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        10
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "7 Pm",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 11;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "7 Pm";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          11
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        11
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "8 Pm",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 12;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "8 Pm";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          12
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        12
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    height: 10.h,
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 20.w),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Text(
                                                          "9 Pm",
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeFour),
                                                          textAlign:
                                                              TextAlign.center,
                                                        ),
                                                        SizedBox(
                                                          width: 3.w,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            controller
                                                                .choosespecificTime
                                                                .value = 13;

                                                            controller
                                                                .chooseTextFlexibleTime
                                                                .value = "9 Pm";
                                                          },
                                                          child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 20.h,
                                                              decoration: BoxDecoration(
                                                                  color: controller
                                                                              .choosespecificTime.value ==
                                                                          13
                                                                      ? Colors
                                                                          .green
                                                                      : AppColors
                                                                          .yellowColor,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              0)),
                                                              child: Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                child: controller
                                                                            .choosespecificTime
                                                                            .value ==
                                                                        13
                                                                    ? Text(
                                                                        "93-مختار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.whiteColor),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      )
                                                                    : Text(
                                                                        "96-الاختيار"
                                                                            .tr,
                                                                        style: TextStyle(
                                                                            height: 1.3
                                                                                .h,
                                                                            fontSize:
                                                                                15,
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            fontFamily: AppTextStyles.Almarai,
                                                                            color: AppColors.balckColorTypeFour),
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                      ),
                                                              )),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  ///////////////////////
                                                  /////////////////////////////////////
                                                  SizedBox(
                                                    height: 15.h,
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      controller.showTheTime
                                                          .value = false;
                                                      controller.theTime.value =
                                                          controller
                                                              .chooseTextFlexibleTime
                                                              .value;
                                                    },
                                                    child: Container(
                                                        height: 20.h,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .theMainColorTwo,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        0)),
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      20.w),
                                                          child: Text(
                                                            "94-التاكيد-الإخفاء"
                                                                .tr,
                                                            style: TextStyle(
                                                                height: 1.3.h,
                                                                fontSize: 15,
                                                                fontFamily:
                                                                    AppTextStyles
                                                                        .Almarai,
                                                                color: AppColors
                                                                    .whiteColor),
                                                            textAlign: TextAlign
                                                                .center,
                                                          ),
                                                        )),
                                                  ),
                                                ])
                                          : controller.showTheflexibleORspecific
                                                      .value ==
                                                  1
                                              ? Column(
                                                  ////////////////////////Flexible Time..............///////////////////////
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  children: [
                                                      Text(
                                                        "95-الاوقات المرنة المتوفرة للقيام بعمليات الخدمة..أختر الوقت المناسب لك..."
                                                            .tr,
                                                        style: TextStyle(
                                                            height: 1.3.h,
                                                            fontSize: 15,
                                                            fontFamily:
                                                                AppTextStyles
                                                                    .Almarai,
                                                            color: AppColors
                                                                .balckColorTypeFour),
                                                        textAlign:
                                                            TextAlign.center,
                                                      ),
                                                      SizedBox(
                                                        height: 9.h,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    20.w),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "96-وقت صباحي 8-12 ظهرًا"
                                                                  .tr,
                                                              style: TextStyle(
                                                                  height: 1.3.h,
                                                                  fontSize: 15,
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
                                                              width: 3.w,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .chooseFlexibleTime
                                                                    .value = 1;

                                                                controller
                                                                        .chooseTextFlexibleTime
                                                                        .value =
                                                                    "8-12 Am";
                                                              },
                                                              child: Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 20.h,
                                                                  decoration: BoxDecoration(
                                                                      color: controller.chooseFlexibleTime.value == 1
                                                                          ? Colors
                                                                              .green
                                                                          : AppColors
                                                                              .yellowColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0)),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                    child: controller.chooseFlexibleTime.value ==
                                                                            1
                                                                        ? Text(
                                                                            "93-مختار".tr,
                                                                            style: TextStyle(
                                                                                height: 1.3.h,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.whiteColor),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )
                                                                        : Text(
                                                                            "96-الاختيار".tr,
                                                                            style: TextStyle(
                                                                                height: 1.3.h,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.balckColorTypeFour),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      /////////////////////////////////////
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    20.w),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "97-توقيت صباحي 10صباحًا-2 ظهرًا"
                                                                  .tr,
                                                              style: TextStyle(
                                                                  height: 1.3.h,
                                                                  fontSize: 15,
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
                                                              width: 3.w,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .chooseFlexibleTime
                                                                    .value = 2;

                                                                controller
                                                                        .chooseTextFlexibleTime
                                                                        .value =
                                                                    "10AM - 2Pm";
                                                              },
                                                              child: Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 20.h,
                                                                  decoration: BoxDecoration(
                                                                      color: controller.chooseFlexibleTime.value == 2
                                                                          ? Colors
                                                                              .green
                                                                          : AppColors
                                                                              .yellowColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0)),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                    child: controller.chooseFlexibleTime.value ==
                                                                            2
                                                                        ? Text(
                                                                            "93-مختار".tr,
                                                                            style: TextStyle(
                                                                                height: 1.3.h,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.whiteColor),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )
                                                                        : Text(
                                                                            "96-الاختيار".tr,
                                                                            style: TextStyle(
                                                                                height: 1.3.h,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.balckColorTypeFour),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      /////////////////////
                                                      /////////////////////////////////////
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    20.w),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "98-توقيت عصري 12-4 عصرًا"
                                                                  .tr,
                                                              style: TextStyle(
                                                                  height: 1.3.h,
                                                                  fontSize: 15,
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
                                                              width: 3.w,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .chooseFlexibleTime
                                                                    .value = 3;

                                                                controller
                                                                        .chooseTextFlexibleTime
                                                                        .value =
                                                                    "12-4 Pm";
                                                              },
                                                              child: Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 20.h,
                                                                  decoration: BoxDecoration(
                                                                      color: controller.chooseFlexibleTime.value == 3
                                                                          ? Colors
                                                                              .green
                                                                          : AppColors
                                                                              .yellowColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0)),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                    child: controller.chooseFlexibleTime.value ==
                                                                            3
                                                                        ? Text(
                                                                            "93-مختار".tr,
                                                                            style: TextStyle(
                                                                                height: 1.3.h,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.whiteColor),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )
                                                                        : Text(
                                                                            "96-الاختيار".tr,
                                                                            style: TextStyle(
                                                                                height: 1.3.h,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.balckColorTypeFour),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      //////////////////////////////
                                                      /////////////////////////////////////
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    20.w),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "99-توقيت عصري 2-6 عصرًا"
                                                                  .tr,
                                                              style: TextStyle(
                                                                  height: 1.3.h,
                                                                  fontSize: 15,
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
                                                              width: 3.w,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .chooseFlexibleTime
                                                                    .value = 4;

                                                                controller
                                                                        .chooseTextFlexibleTime
                                                                        .value =
                                                                    "2-6 Pm";
                                                              },
                                                              child: Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 20.h,
                                                                  decoration: BoxDecoration(
                                                                      color: controller.chooseFlexibleTime.value == 4
                                                                          ? Colors
                                                                              .green
                                                                          : AppColors
                                                                              .yellowColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0)),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                    child: controller.chooseFlexibleTime.value ==
                                                                            4
                                                                        ? Text(
                                                                            "93-مختار".tr,
                                                                            style: TextStyle(
                                                                                height: 1.3.h,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.whiteColor),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )
                                                                        : Text(
                                                                            "96-الاختيار".tr,
                                                                            style: TextStyle(
                                                                                height: 1.3.h,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.balckColorTypeFour),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      //////////////////////////////////
                                                      /////////////////////////////////////
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    20.w),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "100-توقيت مسائي 4-8 مساءاً"
                                                                  .tr,
                                                              style: TextStyle(
                                                                  height: 1.3.h,
                                                                  fontSize: 15,
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
                                                              width: 3.w,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .chooseFlexibleTime
                                                                    .value = 5;

                                                                controller
                                                                        .chooseTextFlexibleTime
                                                                        .value =
                                                                    "4-8 Pm";
                                                              },
                                                              child: Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 20.h,
                                                                  decoration: BoxDecoration(
                                                                      color: controller.chooseFlexibleTime.value == 5
                                                                          ? Colors
                                                                              .green
                                                                          : AppColors
                                                                              .yellowColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0)),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                    child: controller.chooseFlexibleTime.value ==
                                                                            5
                                                                        ? Text(
                                                                            "93-مختار".tr,
                                                                            style: TextStyle(
                                                                                height: 1.3.h,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.whiteColor),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )
                                                                        : Text(
                                                                            "96-الاختيار".tr,
                                                                            style: TextStyle(
                                                                                height: 1.3.h,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.balckColorTypeFour),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      //////////////////////////////
                                                      /////////////////////////////////////
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    20.w),
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          children: [
                                                            Text(
                                                              "101-توقيت مسائي 6-10 مساءاً"
                                                                  .tr,
                                                              style: TextStyle(
                                                                  height: 1.3.h,
                                                                  fontSize: 15,
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
                                                              width: 3.w,
                                                            ),
                                                            InkWell(
                                                              onTap: () {
                                                                controller
                                                                    .chooseFlexibleTime
                                                                    .value = 6;

                                                                controller
                                                                        .chooseTextFlexibleTime
                                                                        .value =
                                                                    "6-10 Pm";
                                                              },
                                                              child: Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 20.h,
                                                                  decoration: BoxDecoration(
                                                                      color: controller.chooseFlexibleTime.value == 6
                                                                          ? Colors
                                                                              .green
                                                                          : AppColors
                                                                              .yellowColor,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              0)),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            20.w),
                                                                    child: controller.chooseFlexibleTime.value ==
                                                                            6
                                                                        ? Text(
                                                                            "93-مختار".tr,
                                                                            style: TextStyle(
                                                                                height: 1.3.h,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.whiteColor),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          )
                                                                        : Text(
                                                                            "96-الاختيار".tr,
                                                                            style: TextStyle(
                                                                                height: 1.3.h,
                                                                                fontSize: 15,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontFamily: AppTextStyles.Almarai,
                                                                                color: AppColors.balckColorTypeFour),
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                          ),
                                                                  )),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      ///////////////////////
                                                      /////////////////////////////////////
                                                      SizedBox(
                                                        height: 15.h,
                                                      ),
                                                      InkWell(
                                                        onTap: () {
                                                          controller.showTheTime
                                                              .value = false;

                                                          controller.theTime
                                                                  .value =
                                                              controller
                                                                  .chooseTextFlexibleTime
                                                                  .value;
                                                        },
                                                        child: Container(
                                                            height: 20.h,
                                                            decoration: BoxDecoration(
                                                                color: AppColors
                                                                    .theMainColorTwo,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            0)),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          20.w),
                                                              child: Text(
                                                                "94-التاكيد-الإخفاء"
                                                                    .tr,
                                                                style: TextStyle(
                                                                    height:
                                                                        1.3.h,
                                                                    fontSize:
                                                                        15,
                                                                    fontFamily:
                                                                        AppTextStyles
                                                                            .Almarai,
                                                                    color: AppColors
                                                                        .whiteColor),
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                              ),
                                                            )),
                                                      ),
                                                    ])
                                              : Align(
                                                  alignment: Alignment.center,
                                                  child: Text(
                                                    "102-لم يتم إختيار اي جدول زمني قم بإختيار زمن جدولي"
                                                        .tr,
                                                    style: TextStyle(
                                                        height: 1.3.h,
                                                        fontSize: 15,
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .balckColorTypeFour),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ],
                    ))
              ],
            )));
  }
}
