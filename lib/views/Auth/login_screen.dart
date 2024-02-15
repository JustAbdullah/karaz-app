import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:karaz/core/constant/images_path.dart';
import 'package:karaz/customWidgets/custom_padding.dart';
import 'package:karaz/views/Auth/code_auth_sign_up.dart';
import 'package:karaz/views/Auth/sign_screen.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/controller_app.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../customWidgets/custome_textfiled.dart';

class AuthPhoneNumberLogin extends StatelessWidget {
  const AuthPhoneNumberLogin({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp homeController = Get.put(ControllerApp());

    return Scaffold(
      backgroundColor:Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              SizedBox(
                height: 90.h,
              ),
              PaddingCustom(
                theTop: 20.h,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "مرحبًا بك..صفحة تسجيل الدخول ",
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
              SizedBox(
                height: 20.h,
              ),
              Lottie.asset(
                ImagesPath.authOTP,
                width: 300.w,
                height: 220.h,
              ),
              PaddingCustom(
                theTop: 3.h,
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40.w, vertical: 00.h),
                      child: Text(
                        "141-قم بإدخال رقمك..سيتم التحقق من الرقم عبر إرسال رسالة نصية تحتوي على رمز التحقق"
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
                theTop: 20.h,
                child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.w, vertical: 00.h),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 220.w,
                            child: TextFormFiledCustom(
                              labelData: "142-رقم الهاتف".tr,
                              hintData: "143-رجاءًا..قم بإدخال رقم الهاتف".tr,
                              iconData: Icons.phone_android,
                              controllerData:
                                  homeController.thePhoneNumberInSignUpLogin,
                              value: (value) {
                                SystemChrome.setEnabledSystemUIMode(
                                    SystemUiMode.manual,
                                    overlays: []);
                                homeController.thePhoneNumberTextSignUpLogin =
                                    value.toString();
                                return value;
                              },
                              fillColor: AppColors.whiteColor,
                              hintColor: AppColors.blackColor,
                              iconColor: AppColors.blackColor,
                              borderSideColor:
                                  Color.fromARGB(255, 245, 239, 239),
                              fontColor: AppColors.balckColorTypeThree,
                              obscureText: false,
                              keyboardType: TextInputType.number,
                              autofillHints: [AutofillHints.name],
                              onChanged: (value) {
                                SystemChrome.setEnabledSystemUIMode(
                                    SystemUiMode.manual,
                                    overlays: []);
                                homeController.thePhoneNumberTextSignUpLogin =
                                    value.toString();
                                return value;
                              },
                              // ignore: body_might_complete_normally_nullable
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "144-قيم فارغة".tr;
                                }
                                return value.length < 7 || value.length > 20
                                    ? "145-عليك التقيد بالعدد المسموح".tr
                                    : null;
                              },
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                              height: 40.h,
                              width: 60.w,
                              decoration: BoxDecoration(
                                  color: AppColors.theMainColorTwo,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.w),
                                  child: Center(
                                    child: Text(
                                      "971+",
                                      style: TextStyle(
                                        fontSize: 17,
                                        fontFamily: AppTextStyles.Almarai,
                                        color: AppColors.whiteColor,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ))),
                        ],
                      ),
                    )),
              ),
              PaddingCustom(
                theTop: 50.h,
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 00.h),
                        child: InkWell(
                          onTap: () {
                            homeController.waitLoginSignAuth.value = true;
                            Future.delayed(const Duration(seconds: 5),
                                () async {
                              homeController.waitLoginSignAuth.value = false;
                              Get.to(AuthPhoneNumberOTP());
                            });
                          },
                          child: Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: AppColors.balckColorTypeFour,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.w),
                              child: Text(
                                "147-التحقق الان".tr,
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
                theTop: 10.h,
                child: Align(
                    alignment: Alignment.center,
                    child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 40.w, vertical: 00.h),
                        child: InkWell(
                          onTap: () {
                            homeController.isLoginOrSignUp.value = 2;
                            Get.to(AuthPhoneNumberSignUP());
                          },
                          child: Text(
                            "163-ليس لديك حساب  قم بإنشاء حساب الان-اضغط هنا-"
                                .tr,
                            style: TextStyle(
                              height: 1.3.h,
                              fontSize: 12,
                              fontFamily: AppTextStyles.Almarai,
                              color: AppColors.yellowColor,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ))),
              ),
            ]),
          ),
          GetX<ControllerApp>(
              builder: (controller) => Visibility(
                  visible: controller.waitLoginSignAuth.value,
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
                      Padding(
                        padding: EdgeInsets.only(bottom: 50.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 130.h,
                            ),
                            Align(
                                alignment: Alignment.center,
                                child: Lottie.asset(
                                    ImagesPath.loadingAppOpeartions,
                                    width: 100.w)),
                            SizedBox(
                              height: 00.h,
                            ),
                            Text(
                              "149-انتظر قليلًا..يتم التحقق وإرسال الرمز".tr,
                              style: TextStyle(
                                height: 1.3.h,
                                fontSize: 16.sp,
                                fontFamily: AppTextStyles.Almarai,
                                color: AppColors.whiteColor,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      )
                    ],
                  ))),
        ],
      ),
    );
  }
}
