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

import '../../../../customWidgets/custom_padding.dart';

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
                              height: 70.h,
                              child: CustomCachedNetworkImage(
                                urlTheImage:
                                    controller.imageTheSubService.toString(),
                                width: MediaQuery.of(context).size.width,
                                height: 70.h,
                                boxFit: BoxFit.contain,
                              ),
                            ),
                            SizedBox(
                              height: 35.h,
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
                                            child: GridView.builder(
                                                itemCount: snapshot
                                                    .data['data'].length,
                                                itemBuilder: (context, i) {
                                                  return Padding(
                                                      padding: EdgeInsets.only(
                                                          left: 5, right: 5),
                                                      child: InkWell(
                                                        onTap: () {},
                                                        child: SizedBox(
                                                          height: 70.h,
                                                          child:
                                                              SingleChildScrollView(
                                                            child: Column(
                                                              children: [
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
                                                                      width:
                                                                          140.w,
                                                                      height:
                                                                          40.h,
                                                                      decoration: BoxDecoration(
                                                                          color: controller.choseService.containsKey(snapshot.data['data'][i]['type_sub_id'].toString()) ? AppColors.theMainColor : AppColors.whiteColor,
                                                                          borderRadius: BorderRadius.circular(5),
                                                                          border: Border.all(
                                                                            color:
                                                                                AppColors.theMainColor,
                                                                            width:
                                                                                1.3,
                                                                          )),
                                                                      child:
                                                                          Center(
                                                                        child:
                                                                            SingleChildScrollView(
                                                                          scrollDirection:
                                                                              Axis.horizontal,
                                                                          child:
                                                                              Padding(
                                                                            padding:
                                                                                EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
                                                                            child:
                                                                                GetX<ChangeLanguageToLocale>(
                                                                              builder: (scontroller) => scontroller.isChange.value == false
                                                                                  ? Text(
                                                                                      snapshot.data['data'][i]['name_type_sub'].toString(),
                                                                                      style: TextStyle(height: 1.3.h, fontSize: 15, fontFamily: AppTextStyles.Almarai, color: controller.choseService.containsKey(snapshot.data['data'][i]['type_sub_id'].toString()) ? AppColors.whiteColor : AppColors.blackColor),
                                                                                      textAlign: TextAlign.center,
                                                                                    )
                                                                                  : Text(
                                                                                      snapshot.data['data'][i]['name_type_sub_en'].toString(),
                                                                                      style: TextStyle(height: 1.3.h, fontSize: 15, fontFamily: AppTextStyles.Almarai, color: controller.choseService.containsKey(snapshot.data['data'][i]['type_sub_id'].toString()) ? AppColors.whiteColor : AppColors.blackColor),
                                                                                      textAlign: TextAlign.center,
                                                                                    ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ));
                                                },
                                                gridDelegate:
                                                    SliverGridDelegateWithFixedCrossAxisCount(
                                                  childAspectRatio:
                                                      MediaQuery.of(context)
                                                              .size
                                                              .width /
                                                          (MediaQuery.of(
                                                                      context)
                                                                  .size
                                                                  .height /
                                                              5),
                                                  crossAxisCount: 3,
                                                  mainAxisSpacing: 0.0,
                                                  crossAxisSpacing: 0.0,
                                                )),
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
                              height: 20.h,
                            ),
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
                                child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(5),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.1),
                                          spreadRadius: 5,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    width: MediaQuery.of(context).size.width,
                                    height: 50.h,
                                    child: Center(
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10.w),
                                        child: Directionality(
                                          textDirection: TextDirection.ltr,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                onTap: () {
                                                  if (controller
                                                          .displayIsHavaAccount
                                                          .value ==
                                                      0) {
                                                    controller
                                                        .messageAboutNotHaveAccount
                                                        .value = true;
                                                  } else {
                                                    Random random =
                                                        new Random();
                                                    var randomNumber;
                                                    randomNumber = random
                                                        .nextInt(10000000);

                                                    /*   controller.addOrder(
                                            controller.idMainType.toString(),
                                            randomNumber.toString(),
                                            controller
                                                .totalPriceTheSerivce.value
                                                .toString());*/

                                                    controller.choseService
                                                        .forEach((k, v) =>
                                                            controller
                                                                .addOrderSubType(
                                                              randomNumber
                                                                  .toString(),
                                                              k.toString(),
                                                              v.toString(),
                                                            ));
                                                    controller.theNumberOFORder
                                                        .value = randomNumber;

                                                    controller
                                                        .OpeartionsOrderPage
                                                        .value = true;
                                                  }
                                                },
                                                child: Container(
                                                  alignment: Alignment.center,
                                                  width: 60.w,
                                                  height: 30.h,
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .theMainColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                  child: Text(
                                                    "الطلب",
                                                    style: TextStyle(
                                                      fontFamily:
                                                          AppTextStyles.Almarai,
                                                      color:
                                                          AppColors.whiteColor,
                                                      fontSize: 15.sp,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                              Row(
                                                children: [
                                                  Text(
                                                    controller
                                                        .totalPriceTheSerivce
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
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  SizedBox(
                                                    width: 1.w,
                                                  ),
                                                  Text(
                                                    "AED",
                                                    style: TextStyle(
                                                        fontFamily:
                                                            AppTextStyles
                                                                .Almarai,
                                                        color: AppColors
                                                            .blackColor,
                                                        fontSize: 14.sp,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ))),
                            SizedBox(
                              height: 20.h,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "يتضمن",
                                  style: TextStyle(
                                      fontFamily: AppTextStyles.Almarai,
                                      color: AppColors.theMainColor,
                                      fontSize: 21.sp,
                                      fontWeight: FontWeight.bold),
                                  textAlign: TextAlign.center,
                                )),
                            SizedBox(
                              height: 5.h,
                            ),
                            Container(
                              color: AppColors.theMainColor,
                              height: 1.4.h,
                              width: 70.w,
                            ),
                            SizedBox(
                              height: 20.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 25.w),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                child: GetX<ChangeLanguageToLocale>(
                                    builder: (scontroller) => scontroller
                                                .isChange.value ==
                                            false
                                        ? Text(
                                            controller
                                                .aboutTheSubMainService.value
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors
                                                    .balckColorTypeFour,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500),
                                          )
                                        : Text(
                                            controller
                                                .aboutTheSubMainServiceEn.value
                                                .toString(),
                                            style: TextStyle(
                                                fontFamily:
                                                    AppTextStyles.Almarai,
                                                color: AppColors
                                                    .balckColorTypeFour,
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.w500),
                                          )),
                              ),
                            ),

                            /* SizedBox(
                              height: 150.h,
                            ),*/
                            /*   Visibility(
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
                            ),*/
                            /*    Visibility(
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
                            ),*/
                            /*    Visibility(
                                visible: controller.countTheSerivce.value >= 1,
                                child: Align(
                                  alignment: Alignment.bottomCenter,
                                  child: InkWell(
                                    onTap: () {
                                      if (controller
                                              .displayIsHavaAccount.value ==
                                          0) {
                                        controller.messageAboutNotHaveAccount
                                            .value = true;
                                      } else {
                                        Random random = new Random();
                                        var randomNumber;
                                        randomNumber = random.nextInt(10000000);

                                        /*   controller.addOrder(
                                            controller.idMainType.toString(),
                                            randomNumber.toString(),
                                            controller
                                                .totalPriceTheSerivce.value
                                                .toString());*/

                                        controller.choseService.forEach(
                                            (k, v) =>
                                                controller.addOrderSubType(
                                                  randomNumber.toString(),
                                                  k.toString(),
                                                  v.toString(),
                                                ));
                                        controller.theNumberOFORder.value =
                                            randomNumber;

                                        controller.OpeartionsOrderPage.value =
                                            true;
                                      }
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
                                )),*/
                            /*  SizedBox(
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
                                )),*/
                          ]))),
                    )),
              ],
            )));
  }
}
