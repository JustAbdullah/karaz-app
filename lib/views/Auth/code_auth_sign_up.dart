import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:karaz/core/constant/images_path.dart';
import 'package:karaz/customWidgets/custom_padding.dart';
import 'package:karaz/views/Auth/name_sign_up.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/controller_app.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../customWidgets/custome_textfiled.dart';

class AuthPhoneNumberOTP extends StatelessWidget {
  const AuthPhoneNumberOTP({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp homeController = Get.put(ControllerApp());

    TextEditingController t = TextEditingController();
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 100.h,
              ),
              Lottie.asset(
                ImagesPath.authCode,
                width: 400.w,
                height: 200.h,
              ),
              PaddingCustom(
                theTop: 20.h,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "150-صفحة التحقق من الرمز".tr,
                    style: TextStyle(
                        height: 1.3.h,
                        fontSize: 19,
                        fontFamily: AppTextStyles.Almarai,
                        color: Color.fromARGB(255, 69, 69, 69)),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
              ),
              PaddingCustom(
                theTop: 3.h,
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 00.h),
                      child: Text(
                        "151-قم بإدخال رمز التحقق المُرسل إلى رقم هاتفك المُدخل بالاسفل"
                            .tr,
                        style: TextStyle(
                            height: 1.3.h,
                            fontSize: 12,
                            fontFamily: AppTextStyles.Almarai,
                            color: Color.fromARGB(255, 69, 69, 69)),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    )),
              ),
              PaddingCustom(
                theTop: 8.h,
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 00.h),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "152-رقم هاتفك المُدخل:".tr,
                            style: TextStyle(
                                height: 1.3.h,
                                fontSize: 12,
                                fontFamily: AppTextStyles.Almarai,
                                color: Color.fromARGB(255, 69, 69, 69)),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                          SizedBox(
                            width: 5.w,
                          ),
                          Text(
                            homeController.thePhoneNumberTextSignUpLogin,
                            style: TextStyle(
                              height: 1.3.h,
                              fontSize: 14,
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.redColor,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                          ),
                        ],
                      ),
                    )),
              ),
              PaddingCustom(
                theTop: 20.h,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 80.w, vertical: 00.h),
                    child: TextFormFiledCustom(
                      labelData: "153-كود التحقق".tr,
                      hintData: "154-أدخل كود التحقق هنا".tr,
                      iconData: Icons.vertical_split_outlined,
                      controllerData: t,
                      value: (value) {
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                            overlays: []);
                        return value;
                      },
                      fillColor: AppColors.whiteColor,
                      hintColor: AppColors.blackColor,
                      iconColor: AppColors.blackColor,
                      borderSideColor: Color.fromARGB(255, 245, 239, 239),
                      fontColor: AppColors.balckColorTypeThree,
                      obscureText: false,
                      keyboardType: TextInputType.numberWithOptions(),
                      autofillHints: [AutofillHints.name],
                      onChanged: (value) {
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                            overlays: []);
                        return value;
                      },
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "144-قيم فارغة".tr;
                        }
                        return value.length < 5 || value.length > 10
                            ? "145-عليك التقيد بالعدد المسموح".tr
                            : null;
                      },
                    )),
              ),
              PaddingCustom(
                theTop: 40.h,
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 00.h),
                        child: InkWell(
                          onTap: () {
                            if (homeController.isLoginOrSignUp.value == 1) {
                              homeController.LoginUser(homeController
                                  .thePhoneNumberTextSignUpLogin
                                  .toString());
                            } else {
                              Get.to(AuthNameSignUP());
                            }
                          },
                          child: Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: AppColors.balckColorTypeFour,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.w),
                              child: Text(
                                "155-المتابعة".tr,
                                style: TextStyle(
                                  height: 2.h,
                                  fontSize: 17,
                                  fontFamily: AppTextStyles.Almarai,
                                  color: AppColors.whiteColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ))),
              ),
              PaddingCustom(
                theTop: 20.h,
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 70.w, vertical: 00.h),
                        child: Text(
                          "156-لم يصلك الرمز؟ قم بطلب رمز التحقق مُجددًا -اضغط هنا للطلب-"
                              .tr,
                          style: TextStyle(
                            height: 1.3.h,
                            fontSize: 13,
                            fontFamily: AppTextStyles.Almarai,
                            color: const Color.fromARGB(255, 234, 184, 4),
                          ),
                          textAlign: TextAlign.center,
                        ))),
              ),
            ]),
          ),
          Visibility(
              visible: false,
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        ImagesPath.loadingAppOpeartions,
                      ),
                      Text(
                        "157-أنتظر قليلاً إننا نقوم بالتحقق من الرقم".tr,
                        style: TextStyle(
                          height: 1.3.h,
                          fontSize: 14,
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.whiteColor,
                        ),
                        textAlign: TextAlign.center,
                      )
                    ],
                  )
                ],
              )),
        ],
      ),
    );
  }
}
