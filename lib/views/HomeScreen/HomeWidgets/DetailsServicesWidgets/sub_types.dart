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
                    padding: EdgeInsets.symmetric(horizontal: 00.w),
                    child: Align(
                      alignment: Alignment.center,
                      child: Container(
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
                                        : Padding(
                                            padding: EdgeInsets.only(top: 0.h),
                                            child: Container(
                                              width: MediaQuery.sizeOf(context)
                                                  .width,
                                              height: 700.h,
                                              color:
                                                  AppColors.whiteColorTypeTwo,
                                              child: ListView.builder(
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount: snapshot
                                                      .data['data'].length,
                                                  shrinkWrap: true,
                                                  itemBuilder: (context, i) {
                                                    return Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 10.w),
                                                      child: PaddingCustom(
                                                        theBottom: 0,
                                                        theTop: 20,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color: AppColors
                                                                  .whiteColor,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          5),
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  color: Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.1),
                                                                  spreadRadius:
                                                                      5,
                                                                  blurRadius: 7,
                                                                  offset: Offset(
                                                                      0,
                                                                      3), // changes position of shadow
                                                                ),
                                                              ]),
                                                          height: 80,
                                                          width:
                                                              MediaQuery.sizeOf(
                                                                      context)
                                                                  .width,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        15.w),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: [
                                                                CustomCachedNetworkImage(
                                                                  urlTheImage: snapshot
                                                                      .data[
                                                                          'data']
                                                                          [i][
                                                                          'sub_type_image']
                                                                      .toString(),
                                                                  width: 50,
                                                                  height: 50,
                                                                  boxFit: BoxFit
                                                                      .cover,
                                                                ),
                                                                SizedBox(
                                                                  width: 100.w,
                                                                ),
                                                                PaddingCustom(
                                                                    theTop: 5,
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () {
                                                                        controller
                                                                            .showTheDetialsAboutTheService
                                                                            .value = true;
                                                                        controller
                                                                            .nameOftheSubService
                                                                            .value = snapshot.data['data'][i]
                                                                                ['sub_type_name_ar']
                                                                            .toString();

                                                                        controller
                                                                            .nameOftheSubServiceEn
                                                                            .value = snapshot.data['data'][i]
                                                                                ['sub_type_name_en']
                                                                            .toString();
                                                                        controller.imageTheSubService = snapshot
                                                                            .data['data'][i]['sub_type_image']
                                                                            .toString();

                                                                        controller
                                                                            .aboutTheSubMainService
                                                                            .value = snapshot.data['data'][i]
                                                                                ['sub_type_description_ar']
                                                                            .toString();
                                                                        controller
                                                                            .aboutTheSubMainServiceEn
                                                                            .value = snapshot.data['data'][i]
                                                                                ['sub_type_description_en']
                                                                            .toString();

                                                                        controller.idSubType = snapshot
                                                                            .data['data'][i]['sub_type_id']
                                                                            .toString();
                                                                      },
                                                                      child:
                                                                          Row(
                                                                        children: [
                                                                          GetX<
                                                                              ChangeLanguageToLocale>(
                                                                            builder: (scontroller) => scontroller.isChange.value == false
                                                                                ? Text(
                                                                                    snapshot.data['data'][i]['sub_type_name_ar'],
                                                                                    style: TextStyle(
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
                                                                                      color: AppColors.blackColor,
                                                                                      fontFamily: AppTextStyles.Almarai,
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.bold,
                                                                                    ),
                                                                                    textAlign: TextAlign.center,
                                                                                  ),
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
                                                  }),
                                            ),
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
                          ]))),
                    )),
              ],
            )));
  }
}
