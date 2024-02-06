import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../controllers/controller_app.dart';
import '../../../../core/constant/app_text_styles.dart';
import '../../../../core/constant/appcolors.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as m;

class ShowTheLocation extends StatelessWidget {
  const ShowTheLocation({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp controllerTheApp = Get.put(ControllerApp());

    Set<m.Marker> myMarker = {
      m.Marker(
          markerId: MarkerId("1"),
          position: LatLng(controllerTheApp.myCurrentPositionLatitude,
              controllerTheApp.myCurrentPositionLongitude))
    };

    return GetX<ControllerApp>(
        builder: (controller) => Visibility(
            visible: controller.showTheLocation.value,
            child: Stack(children: [
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
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.w),
                    child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width,
                        height: 500.h,
                        child: SingleChildScrollView(
                            child: Column(children: [
                          Align(
                            alignment: Alignment.topRight,
                            child: InkWell(
                              onTap: () {
                                controller.showTheLocation.value = false;
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
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Align(
                              alignment: Alignment.center,
                              child: Text(
                                "55-موقعك على الخريطة".tr,
                                style: TextStyle(
                                    height: 1.3.h,
                                    fontSize: 19,
                                    fontFamily: AppTextStyles.Almarai,
                                    color: AppColors.balckColorTypeFour),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                              )),
                          SizedBox(
                            height: 5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30.w),
                            child: Align(
                                alignment: Alignment.center,
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width,
                                  height: 300.h,
                                  child: GetX<ControllerApp>(
                                    builder: (controller) => GoogleMap(
                                      markers: myMarker,
                                      mapType: MapType.normal,
                                      initialCameraPosition: CameraPosition(
                                        target: controller.displayLongLocation
                                                    .value ==
                                                0.0
                                            ? LatLng(
                                                controller
                                                    .displayLatLocation.value,
                                                controller
                                                    .displayLongLocation.value)
                                            : LatLng(
                                                controller
                                                    .displayLatLocation.value,
                                                controller
                                                    .displayLongLocation.value),
                                        zoom: 17.4746,
                                      ),
                                      onMapCreated:
                                          (GoogleMapController controller) {
                                        controllerTheApp.controller
                                            .complete(controller);
                                      },
                                    ),
                                  ),
                                )),
                          ),
                          SizedBox(
                            height: 45.h,
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                        ])))),
              ),

              /////////////////..............Loading to Take The Location........../////////////////
            ])));
  }
}
