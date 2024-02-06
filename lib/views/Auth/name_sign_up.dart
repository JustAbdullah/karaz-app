import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:karaz/core/constant/images_path.dart';
import 'package:karaz/customWidgets/custom_padding.dart';
import 'package:lottie/lottie.dart';

import '../../controllers/controller_app.dart';
import '../../core/constant/app_text_styles.dart';
import '../../core/constant/appcolors.dart';
import '../../customWidgets/custome_textfiled.dart';

class AuthNameSignUP extends StatelessWidget {
  const AuthNameSignUP({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp homeController = Get.put(ControllerApp());

    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(children: [
              Align(
                  alignment: Alignment.topLeft,
                  child: Image.asset(
                    ImagesPath.logo,
                    width: 120.w,
                    height: 100,
                  )),
              SizedBox(
                height: 00.h,
              ),
              Lottie.asset(ImagesPath.login,
                  width: 300.w, height: 200.h, repeat: false),
              PaddingCustom(
                theTop: 20.h,
                child: Align(
                  alignment: Alignment.center,
                  child: Text(
                    "مرحبًا بك..صفحة إنشاء الحساب",
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
                        "لقد أنهيت عملية التحقق من الرقم..رجاءًا قم بإدخال أسمك لإنهاء عملية تسجيل الحساب",
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
                        EdgeInsets.symmetric(horizontal: 40.w, vertical: 00.h),
                    child: TextFormFiledCustom(
                      labelData: "الاسم",
                      hintData: "رجاءًا..قم بإدخال اسمك",
                      iconData: Icons.person,
                      controllerData: homeController.theNameInSignUp,
                      value: (value) {
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                            overlays: []);
                        homeController.theNameTextSignUp = value.toString();
                        return value;
                      },
                      fillColor: AppColors.whiteColor,
                      hintColor: AppColors.blackColor,
                      iconColor: AppColors.blackColor,
                      borderSideColor: Color.fromARGB(255, 245, 239, 239),
                      fontColor: AppColors.balckColorTypeThree,
                      obscureText: false,
                      keyboardType: TextInputType.name,
                      autofillHints: [AutofillHints.name],
                      onChanged: (value) {
                        SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                            overlays: []);
                        homeController.theNameTextSignUp = value.toString();
                        return value;
                      },
                      // ignore: body_might_complete_normally_nullable
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "قيم فارغة";
                        }
                        return value.length < 5 || value.length > 30
                            ? "عليك التقيد بالعدد المسموح".tr
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
                            homeController.createAccount(
                                homeController.theNameTextSignUp.toString(),
                                homeController.thePhoneNumberTextSignUpLogin
                                    .toString());
                          },
                          child: Container(
                            height: 30.h,
                            decoration: BoxDecoration(
                                color: AppColors.balckColorTypeFour,
                                borderRadius: BorderRadius.circular(5)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 50.w),
                              child: Text(
                                "الإنشاء الان",
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
                      Image.asset(
                        ImagesPath.logoWithOutbackGround,
                      ),
                      Text(
                        "أنتظر قليلاً إننا نقوم بالتحقق من الرقم",
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
