import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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

class SubTypes extends StatelessWidget {
  const SubTypes({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp homeController = Get.put(ControllerApp());
    return GetX<ControllerApp>(
        builder: (controller) => Visibility(
            visible: controller.showTheSubTypeOFService.value,
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
                Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10)),
                          width: MediaQuery.of(context).size.width,
                          height: 600.h,
                          child: SingleChildScrollView(
                              child: Column(children: [
                            SizedBox(
                              height: 10.h,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: 20.w),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors
                                                      .balckColorTypeFour),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                            )
                                          : Text(
                                              controller.nameTheServiceEn.value
                                                  .toString(),
                                              style: TextStyle(
                                                  height: 1.3.h,
                                                  fontSize: 19,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily:
                                                      AppTextStyles.Almarai,
                                                  color: AppColors
                                                      .balckColorTypeFour),
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                            )),
                                  InkWell(
                                    onTap: () {
                                      controller.countTheSerivce.value = 0;
                                      controller.totalPriceTheSerivce.value = 0;
                                      controller.choseService.clear();
                                      controller.showTheSubTypeOFService.value =
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
                              height: 20.h,
                            ),
                            FutureBuilder(
                                future: homeController.getSubTyps(
                                    homeController.idMainType.toString()),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return controller.isNoDataSubTypes.value ==
                                            true
                                        ? Center(
                                            child: Text(
                                              "11-لايوجد بيانات لهذا القسم".tr,
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
                                        : Container(
                                            width: MediaQuery.sizeOf(context)
                                                .width,
                                            height: 400.h,
                                            color: AppColors.whiteColorTypeTwo,
                                            child: ListView.builder(
                                                scrollDirection: Axis.vertical,
                                                itemCount: snapshot
                                                    .data['data'].length,
                                                shrinkWrap: true,
                                                itemBuilder: (context, i) {
                                                  return PaddingCustom(
                                                    theBottom: 10,
                                                    child: InkWell(
                                                      onTap: () async {
                                                        controller
                                                            .showTheDetialsAboutTheService
                                                            .value = true;
                                                        controller
                                                            .nameOftheSubService
                                                            .value = snapshot.data[
                                                                'data'][i][
                                                                'sub_type_name_ar']
                                                            .toString();

                                                        controller
                                                            .nameOftheSubServiceEn
                                                            .value = snapshot.data[
                                                                'data'][i][
                                                                'sub_type_name_en']
                                                            .toString();
                                                        controller
                                                                .imageTheSubService =
                                                            snapshot
                                                                .data['data'][i]
                                                                    [
                                                                    'sub_type_image']
                                                                .toString();

                                                        controller
                                                            .aboutTheSubMainService
                                                            .value = snapshot.data[
                                                                'data'][i][
                                                                'sub_type_description_ar']
                                                            .toString();
                                                        controller
                                                            .aboutTheSubMainServiceEn
                                                            .value = snapshot.data[
                                                                'data'][i][
                                                                'sub_type_description_en']
                                                            .toString();

                                                        controller.idSubType =
                                                            snapshot
                                                                .data['data'][i]
                                                                    [
                                                                    'sub_type_id']
                                                                .toString();
                                                      },
                                                      child: ContainerCustom(
                                                        theBorderRadius: 10,
                                                        colorContainer:
                                                            AppColors
                                                                .whiteColor,
                                                        heigthContainer: 90,
                                                        widthContainer:
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                        child:
                                                            SingleChildScrollView(
                                                          scrollDirection:
                                                              Axis.horizontal,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        20.w),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                InkWell(
                                                                  onTap: () {},
                                                                  child:
                                                                      CustomCachedNetworkImage(
                                                                    urlTheImage: snapshot
                                                                        .data[
                                                                            'data']
                                                                            [i][
                                                                            'sub_type_image']
                                                                        .toString(),
                                                                    width: 100,
                                                                    height: 100,
                                                                    boxFit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  width: 5.w,
                                                                ),
                                                                PaddingCustom(
                                                                    theTop: 5,
                                                                    child:
                                                                        Container(
                                                                      width:
                                                                          140.w,
                                                                      child: GetX<
                                                                          ChangeLanguageToLocale>(
                                                                        builder: (scontroller) => scontroller.isChange.value ==
                                                                                false
                                                                            ? Text(
                                                                                snapshot.data['data'][i]['sub_type_name_ar'],
                                                                                style: TextStyle(
                                                                                  height: 1.5.h,
                                                                                  color: AppColors.blackColor,
                                                                                  fontFamily: AppTextStyles.Almarai,
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                              )
                                                                            : Text(
                                                                                snapshot.data['data'][i]['sub_type_name_en'],
                                                                                style: TextStyle(
                                                                                  height: 1.5.h,
                                                                                  color: AppColors.blackColor,
                                                                                  fontFamily: AppTextStyles.Almarai,
                                                                                  fontSize: 14,
                                                                                  fontWeight: FontWeight.bold,
                                                                                ),
                                                                                textAlign: TextAlign.center,
                                                                              ),
                                                                      ),
                                                                    )),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }),
                                          );
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
                                                                  InkWell(
                                                                    onTap:
                                                                        () {},
                                                                    child: Image
                                                                        .asset(
                                                                      "${ImagesPath.logo}",
                                                                      width:
                                                                          100,
                                                                      height:
                                                                          100,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
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
                                                                  theTop: 30,
                                                                  child:
                                                                      TextCustom(
                                                                    theText:
                                                                        "6-يتم التحميل"
                                                                            .tr,
                                                                    fontColor:
                                                                        AppColors
                                                                            .blackColor,
                                                                    fontFamily:
                                                                        AppTextStyles
                                                                            .Almarai,
                                                                    fontSizeWidth:
                                                                        18,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 150.w,
                                                                height: 100.h,
                                                                child:
                                                                    PaddingCustom(
                                                                  theTop: 15,
                                                                  child: Text(
                                                                    "6-يتم التحميل"
                                                                        .tr,
                                                                    maxLines: 4,
                                                                    style: TextStyle(
                                                                        fontSize: 14
                                                                            .sp,
                                                                        height: 1.7
                                                                            .h,
                                                                        color: AppColors
                                                                            .balckColorTypeThree,
                                                                        fontFamily:
                                                                            AppTextStyles.Almarai),
                                                                    textAlign:
                                                                        TextAlign
                                                                            .center,
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
                                                                      child:
                                                                          Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: 8.h),
                                                                        child:
                                                                            Text(
                                                                          "6-يتم التحميل"
                                                                              .tr,
                                                                          style:
                                                                              TextStyle(
                                                                            color:
                                                                                AppColors.blackColor,
                                                                            fontFamily:
                                                                                AppTextStyles.Almarai,
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
                              height: 7.h,
                            ),
                            Visibility(
                              visible: controller.countTheSerivce.value >= 1,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10.w),
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
                              ),
                            ),
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
                                  ),
                                )),
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
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
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
                            ),
                          ]))),
                    )),
              ],
            )));
  }
}
