import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../../../../core/localization/changelanguage.dart';
import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import '../../../../customWidgets/custom_cachednetworkimage.dart';

class viewTheMainTypesHomeScreen extends StatelessWidget {
  const viewTheMainTypesHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp controllerApp = Get.put(ControllerApp());
    return FutureBuilder(
        future: controllerApp.getMainTyps(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return controllerApp.isNoDataMainTypes.value == true
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        Text(
                          "5-لايوجد بيانات".tr,
                          style: TextStyle(
                              fontFamily: 'Cairo',
                              color: Color(0xFFC70039),
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500),
                          textAlign: TextAlign.center,
                        )
                      ])
                : GridView.builder(
                    itemCount: snapshot.data['data'].length,
                    itemBuilder: (context, i) {
                      return Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 5.h, horizontal: 5.w),
                          child: InkWell(
                              onTap: () async {
                                controllerApp.idMainType = snapshot.data['data']
                                    [i]['services_main_id'];

                                controllerApp.nameTheService.value = snapshot
                                    .data['data'][i]['services_main_name_ar'];
                                controllerApp.nameTheServiceEn.value = snapshot
                                    .data['data'][i]['services_main_name_en'];
                                controllerApp.showTheSubTypeOFService.value =
                                    true;
                              },
                              child: Padding(
                                padding: EdgeInsets.only(),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: SingleChildScrollView(
                                    child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          CustomCachedNetworkImage(
                                              urlTheImage: snapshot.data['data']
                                                  [i]['services_main_icon'],
                                              width: 70.w,
                                              height: 40.h,
                                              boxFit: BoxFit.contain),
                                          SizedBox(
                                            height: 7.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 10.w),
                                            child: GetX<ChangeLanguageToLocale>(
                                              builder: (scontroller) =>
                                                  scontroller.isChange.value ==
                                                          false
                                                      ? Text(
                                                          snapshot.data['data']
                                                                  [i][
                                                              'services_main_name_ar'],
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeThree),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                        )
                                                      : Text(
                                                          snapshot.data['data']
                                                                  [i][
                                                              'services_main_name_en'],
                                                          style: TextStyle(
                                                              height: 1.3.h,
                                                              fontSize: 15,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w600,
                                                              fontFamily:
                                                                  AppTextStyles
                                                                      .Almarai,
                                                              color: AppColors
                                                                  .balckColorTypeThree),
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                        ),
                                            ),
                                          )
                                        ]),
                                  ),
                                ),
                              )));
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      childAspectRatio: MediaQuery.of(context).size.width /
                          (MediaQuery.of(context).size.height / 1.5),
                      crossAxisCount: 4,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                    ));
          } else {
            return GridView.builder(
                itemCount: 20,
                itemBuilder: (context, i) {
                  return Shimmer.fromColors(
                      baseColor: Color.fromARGB(31, 192, 184, 184),
                      highlightColor: AppColors.whiteColor,
                      enabled: true,
                      child: Padding(
                          padding:
                              EdgeInsets.symmetric(vertical: 2, horizontal: 2),
                          child: InkWell(
                              onTap: () async {},
                              child: Padding(
                                padding: EdgeInsets.only(),
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: AppColors.whiteColor,
                                      borderRadius: BorderRadius.circular(10)),
                                  child: SingleChildScrollView(
                                    child: Column(children: [
                                      Container(
                                        color: AppColors.balckColorTypeThree,
                                        width: 70.w,
                                        height: 100.h,
                                      ),
                                      Text(
                                        "6-يتم التحميل".tr,
                                        style: TextStyle(
                                            height: 1.h,
                                            fontSize: 10,
                                            fontFamily: AppTextStyles.Marhey,
                                            color: AppColors.redColor),
                                        textAlign: TextAlign.center,
                                      ),
                                    ]),
                                  ),
                                ),
                              ))));
                },
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1.3),
                  crossAxisCount: 4,
                  mainAxisSpacing: 0.0,
                  crossAxisSpacing: 0.0,
                ));
          }
        });
  }
}
