import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

import '../../../../customWidgets/custom_container.dart';
import '../../../../customWidgets/custom_container_api.dart';
import '../../../../customWidgets/custom_padding.dart';

import '../../../../customWidgets/custom_text.dart';

class MessagesList extends StatelessWidget {
  const MessagesList({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp homeController = Get.put(ControllerApp());
    return GetX<ControllerApp>(
        builder: (controller) => Visibility(
            visible: controller.showTheMessage.value,
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
                          height: 500.h,
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
                                  Text(
                                    "175-قائمة رسائلك والتنبيهات".tr,
                                    style: TextStyle(
                                        height: 1.3.h,
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.balckColorTypeFour),
                                    textAlign: TextAlign.center,
                                    maxLines: 2,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.showTheMessage.value = false;
                                    },
                                    child: Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                future: homeController.getTheMessageUser(),
                                builder: (BuildContext context,
                                    AsyncSnapshot snapshot) {
                                  if (snapshot.hasData) {
                                    return controller
                                                .isTheUserHaveMessage.value ==
                                            false
                                        ? Center(
                                            child: Text(
                                              "176-لاتمتلك اي رسائل لعرضها".tr,
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
                                                    theTop: 10,
                                                    child: InkWell(
                                                      onTap: () async {},
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        decoration: BoxDecoration(
                                                            color: AppColors
                                                                .whiteColor,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10)),
                                                        width:
                                                            MediaQuery.sizeOf(
                                                                    context)
                                                                .width,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  horizontal:
                                                                      10.w,
                                                                  vertical:
                                                                      10.h),
                                                          child: Text(
                                                            snapshot.data[
                                                                    'data'][i]
                                                                ['body'],
                                                            style: TextStyle(
                                                              height: 1.5.h,
                                                              color: AppColors
                                                                  .balckColorTypeFour,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              fontSize: 16.sp,
                                                            ),
                                                            textAlign: TextAlign
                                                                .center,
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
                          ]))),
                    ))
              ],
            )));
  }
}
