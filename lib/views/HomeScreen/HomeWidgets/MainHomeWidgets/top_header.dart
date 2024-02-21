import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';

class TopHeaderHomeScreen extends StatelessWidget {
  const TopHeaderHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp controllerApp = Get.put(ControllerApp());
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60.h,
      color: AppColors.whiteColor,
      child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: GetX<ControllerApp>(
            builder: (controller) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 200.w,
                    child: Text(
                      controller.address.value,
                      style: TextStyle(
                          height: 1.5.h,
                          fontSize: 12.sp,
                          fontFamily: AppTextStyles.Almarai,
                          color: AppColors.blackColor),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                    ),
                  ),
                  Text(
                    controller.displayUserName.value.toString(),
                    style: TextStyle(
                        height: 1.3.h,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: AppTextStyles.Almarai,
                        color: AppColors.theMainColorTwo),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ]),
          )),
    );
  }
}
