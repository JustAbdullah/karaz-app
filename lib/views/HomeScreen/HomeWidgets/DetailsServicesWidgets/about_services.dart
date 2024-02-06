import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../core/constant/images_path.dart';
import '../../../../core/localization/changelanguage.dart';
import '../../../../customWidgets/custom_cachednetworkimage.dart';
import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_container_api.dart';
import '../../../../customWidgets/custom_padding.dart';

import '../../../../customWidgets/custom_text.dart';

class aboutTheDetailsService extends StatelessWidget {
  const aboutTheDetailsService({super.key});

  @override
  Widget build(BuildContext context) {
    return GetX<ControllerApp>(
        builder: (controller) => Visibility(
            visible: controller.showTheDetialsAboutTheService.value,
            child: Stack(
              children: [
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 00.w),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          child: SingleChildScrollView(
                              child: Column(children: [
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(top: 20.h),
                                      child: GetX<ChangeLanguageToLocale>(
                                        builder: (scontroller) => scontroller
                                                    .isChange.value ==
                                                false
                                            ? Text(
                                                controller
                                                    .nameOftheSubService.value
                                                    .toString(),
                                                style: TextStyle(
                                                    height: 1.5.h,
                                                    fontSize: 14,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors
                                                        .balckColorTypeFour),
                                                textAlign: TextAlign.center,
                                              )
                                            : Text(
                                                controller
                                                    .nameOftheSubServiceEn.value
                                                    .toString(),
                                                style: TextStyle(
                                                    height: 1.5.h,
                                                    fontSize: 14,
                                                    fontFamily:
                                                        AppTextStyles.Almarai,
                                                    color: AppColors
                                                        .balckColorTypeFour),
                                                textAlign: TextAlign.center,
                                              ),
                                      )),
                                  InkWell(
                                    onTap: () {
                                      controller.showTheDetialsAboutTheService
                                          .value = false;
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
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 120.h,
                              child: CustomCachedNetworkImage(
                                urlTheImage:
                                    controller.imageTheSubService.toString(),
                                width: MediaQuery.of(context).size.width,
                                height: 150.h,
                                boxFit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            FutureBuilder(
                                future: controller.getTypeOFSubTyps(
                                    controller.idSubType.toString()),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return controller
                                                .isNoDataTypeOFSubTypes.value ==
                                            true
                                        ? Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                                Text(
                                                  "5-لايوجد بيانات".tr,
                                                  style: TextStyle(
                                                      fontFamily: 'Cairo',
                                                      color: Color(0xFFC70039),
                                                      fontSize: 20.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                  textAlign: TextAlign.center,
                                                )
                                              ])
                                        : Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            height: 100.h,
                                            child: ListView.builder(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                itemCount: snapshot
                                                    .data['data'].length,
                                                shrinkWrap: true,
                                                itemBuilder: (context, i) {
                                                  return Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      child: InkWell(
                                                        onTap: () {},
                                                        child: SizedBox(
                                                          height: 100.h,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: [
                                                                Image.asset(
                                                                  ImagesPath
                                                                      .info,
                                                                  width: 20.w,
                                                                ),
                                                                SizedBox(
                                                                  height: 5.h,
                                                                ),
                                                                InkWell(
                                                                    onTap: () {
                                                                      if (controller.choseService.containsKey(snapshot
                                                                          .data[
                                                                              'data']
                                                                              [
                                                                              i]
                                                                              [
                                                                              'type_sub_id']
                                                                          .toString())) {
                                                                        controller
                                                                            .countTheSerivce
                                                                            .value = controller
                                                                                .countTheSerivce.value -
                                                                            1;
                                                                        controller
                                                                            .totalPriceTheSerivce
                                                                            .value = controller
                                                                                .totalPriceTheSerivce.value -
                                                                            int.parse(snapshot.data['data'][i]['price_type_sub'].toString());

                                                                        controller
                                                                            .choseService
                                                                            .remove(snapshot.data['data'][i]['type_sub_id'].toString());
                                                                      } else {
                                                                        controller
                                                                            .countTheSerivce
                                                                            .value = controller
                                                                                .countTheSerivce.value +
                                                                            1;
                                                                        controller
                                                                            .totalPriceTheSerivce
                                                                            .value = controller
                                                                                .totalPriceTheSerivce.value +
                                                                            int.parse(snapshot.data['data'][i]['price_type_sub'].toString());

                                                                        controller.choseService[
                                                                            snapshot.data['data'][i]['type_sub_id']
                                                                                .toString()] = snapshot
                                                                            .data['data'][i]['sub_type_id_key']
                                                                            .toString();

                                                                        /////////////
                                                                      }
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      height:
                                                                          40.h,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(
                                                                              6),
                                                                          color: controller.choseService.containsKey(snapshot.data['data'][i]['type_sub_id'].toString())
                                                                              ? AppColors.yellowColor
                                                                              : AppColors.balckColorTypeFour),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                10.w,
                                                                            vertical: 10.h),
                                                                        child: GetX<
                                                                            ChangeLanguageToLocale>(
                                                                          builder: (scontroller) => scontroller.isChange.value == false
                                                                              ? Text(
                                                                                  snapshot.data['data'][i]['name_type_sub'].toString(),
                                                                                  style: TextStyle(height: 1.3.h, fontSize: 15, fontFamily: AppTextStyles.Almarai, color: AppColors.whiteColor),
                                                                                  textAlign: TextAlign.center,
                                                                                )
                                                                              : Text(
                                                                                  snapshot.data['data'][i]['name_type_sub_en'].toString(),
                                                                                  style: TextStyle(height: 1.3.h, fontSize: 15, fontFamily: AppTextStyles.Almarai, color: AppColors.whiteColor),
                                                                                  textAlign: TextAlign.center,
                                                                                ),
                                                                        ),
                                                                      ),
                                                                    )),
                                                                SizedBox(
                                                                  height: 5.h,
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Text(
                                                                      snapshot
                                                                          .data[
                                                                              'data']
                                                                              [
                                                                              i]
                                                                              [
                                                                              'price_type_sub']
                                                                          .toString(),
                                                                      style: TextStyle(
                                                                          height: 1.3
                                                                              .h,
                                                                          fontSize:
                                                                              15,
                                                                          fontFamily: AppTextStyles
                                                                              .Almarai,
                                                                          color:
                                                                              AppColors.balckColorTypeFour),
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          2.w,
                                                                    ),
                                                                    Text(
                                                                      "AED",
                                                                      style: TextStyle(
                                                                          height: 1.3
                                                                              .h,
                                                                          fontSize:
                                                                              15,
                                                                          fontFamily: AppTextStyles
                                                                              .Almarai,
                                                                          color:
                                                                              AppColors.yellowColor),
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
                                                      ));
                                                }),
                                          );
                                  } else {
                                    return Container(
                                        width:
                                            MediaQuery.of(context).size.width,
                                        height: 50.h,
                                        child: ListView.builder(
                                            scrollDirection: Axis.horizontal,
                                            itemCount: 5,
                                            shrinkWrap: true,
                                            itemBuilder: (context, i) {
                                              return Shimmer.fromColors(
                                                  baseColor: Color.fromARGB(
                                                      31, 83, 82, 82),
                                                  highlightColor:
                                                      AppColors.whiteColor,
                                                  enabled: true,
                                                  child: Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      child: Shimmer.fromColors(
                                                          baseColor:
                                                              Color.fromARGB(31,
                                                                  83, 82, 82),
                                                          highlightColor:
                                                              AppColors
                                                                  .whiteColor,
                                                          enabled: true,
                                                          child: Container(
                                                            alignment: Alignment
                                                                .center,
                                                            height: 50.h,
                                                            decoration: BoxDecoration(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            6),
                                                                color: AppColors
                                                                    .yellowColor),
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      horizontal:
                                                                          7),
                                                              child: Center(
                                                                child: Text(
                                                                  "5-لايوجد بيانات"
                                                                      .tr,
                                                                  style: TextStyle(
                                                                      fontFamily:
                                                                          'Cairo',
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          17.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                ),
                                                              ),
                                                            ),
                                                          ))));
                                            }));
                                  }
                                }),
                            SizedBox(
                              height: 40.h,
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: GetX<ChangeLanguageToLocale>(
                                  builder: (scontroller) => scontroller
                                              .isChange.value ==
                                          false
                                      ? Text(
                                          controller
                                              .aboutTheSubMainService.value
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        )
                                      : Text(
                                          controller
                                              .aboutTheSubMainServiceEn.value
                                              .toString(),
                                          style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        )),
                            ),
                            SizedBox(
                              height: 100.h,
                            ),
                            Visibility(
                                visible: controller.countTheSerivce.value >= 1,
                                child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "49-عدد تفرعات الخدمة التي طلبتها:".tr,
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.balckColorTypeFour,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        controller.countTheSerivce.value
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.theMainColorTwo,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "50-خدمة حتى الان".tr,
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.balckColorTypeFour,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  ),
                                )),
                            SizedBox(
                              height: 7.h,
                            ),
                            Visibility(
                              visible: controller.countTheSerivce.value >= 1,
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Row(
                                    children: [
                                      Text(
                                        "51-إجمالي سعر الخدمة وتفرعاتها:".tr,
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.balckColorTypeFour,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        controller.totalPriceTheSerivce.value
                                            .toString(),
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.theMainColorTwo,
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center,
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Text(
                                        "AED",
                                        style: TextStyle(
                                            fontFamily: AppTextStyles.Almarai,
                                            color: AppColors.yellowColor,
                                            fontSize: 14.sp,
                                            fontWeight: FontWeight.w500),
                                        textAlign: TextAlign.center,
                                      ),
                                    ],
                                  )),
                            ),
                            SizedBox(
                              height: 15.h,
                            ),
                            Visibility(
                                visible: controller.countTheSerivce.value >= 1,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: InkWell(
                                    onTap: () {
                                      Random random = new Random();
                                      var randomNumber;
                                      randomNumber = random.nextInt(10000000);
                                      controller.addOrder(
                                          controller.idMainType.toString(),
                                          randomNumber.toString(),
                                          controller.totalPriceTheSerivce.value
                                              .toString());

                                      controller.choseService.forEach(
                                          (k, v) => controller.addOrderSubType(
                                                randomNumber.toString(),
                                                k.toString(),
                                                v.toString(),
                                              ));
                                    },
                                    child: Container(
                                      width: 220.w,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: AppColors.yellowColor,
                                          borderRadius:
                                              BorderRadius.circular(7)),
                                      child: Center(
                                        child: Text(
                                          "52-طلب الخدمة".tr,
                                          style: TextStyle(
                                              fontFamily: AppTextStyles.Almarai,
                                              color:
                                                  AppColors.balckColorTypeFour,
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w500),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                  ),
                                )),
                            SizedBox(
                              height: 7.h,
                            ),
                            Visibility(
                                visible: controller.countTheSerivce.value >= 1,
                                child: Text(
                                  "53-ملاحظة:يتم إضافة الخدمة في قائمة -الطلبيات- بشكل معلق عليك إكمال الإجراءت الطلب والجدولة"
                                      .tr,
                                  style: TextStyle(
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.balckColorTypeFour,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )),
                          ]))),
                    )),
                Visibility(
                    visible: controller.waitLoadingAddOrder.value,
                    child: Stack(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black45,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height,
                          color: Colors.black45,
                        ),
                        PaddingCustom(
                          theBottom: 100,
                          child: Align(
                            alignment: Alignment.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Lottie.asset(ImagesPath.loadingBlack,
                                    width: 150.w),
                                SizedBox(
                                  height: 7.h,
                                ),
                                Text(
                                  "54-أنتظر قليلاً..يتم إضافة الطلبية".tr,
                                  style: TextStyle(
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.yellowColor,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ],
            )));
  }
}
