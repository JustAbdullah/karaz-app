//import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:karaz/views/WelcomeScreen/welcome_screen.dart';

import '../core/class/class/crud.dart';

import '../core/constant/appcolors.dart';
import '../core/services/appservices.dart';
import '../linksapi.dart';
import '../views/HomeScreen/home_screen.dart';

class ControllerApp extends GetxController {
  final crud = Crud();
  AppServices appServices = Get.find();

//////////////////............The Loading  Page Animation..................................................////////////////////
  RxString welcomeText = "مرحبًا بك,, في تطبيق يُقدم لك مختلف الخدمات".obs;
  Color weclomeColor = AppColors.whiteColor;
  RxInt countTheNumber = 0.obs;

  get showTheMenuOfSettings => null;

  getAnimationTextWelcome() {
    Timer.periodic(const Duration(seconds: 8), (Timer timer) async {
      if (countTheNumber.value == 0) {
        weclomeColor = AppColors.whiteColor;

        countTheNumber.value += 1;
      } else if (countTheNumber.value == 1) {
        weclomeColor = AppColors.yellowColor;

        welcomeText.value = "خدماتنا متعددة..موسعة,, عالية الجودة";
        countTheNumber.value += 1;
      } else if (countTheNumber.value == 2) {
        weclomeColor = AppColors.whiteColor;

        welcomeText.value =
            "قدم الإن وأطلب اي خدمة تريدها,,ثم قم بالجدولة واختيار اليوم المناسب لك";
        countTheNumber.value += 1;
      } else if (countTheNumber.value == 3) {
        weclomeColor = AppColors.yellowColor;

        welcomeText.value = "ستصلك الخدمة بالوقت المناسب والأحترافية الأمثل";
        countTheNumber.value += 1;
      } else {
        weclomeColor = AppColors.whiteColor;

        countTheNumber.value = 0;
        welcomeText.value = "مرحبًا بك,, في تطبيق يُقدم لك مختلف الخدمات";

        Get.to(HomeScreen());
      }
    });
  }

  ////////////////////////////...................The Home Page...........................................///////////////

////////////////..............SubTypes Details............///////////////////////////////////////
  RxBool showTheSubTypeOFService = false.obs;
  RxString nameTheService = "".obs;
  RxString nameTheServiceEn = "".obs;

  RxBool showTheDetialsAboutTheService = false.obs;
  RxString nameOftheSubService = "".obs;
  RxString nameOftheSubServiceEn = "".obs;

  RxString aboutTheSubMainService = "".obs;
  RxString aboutTheSubMainServiceEn = "".obs;

  String imageTheSubService = "";

//////////////...............................Get Data FROM Database .............................../////////

  RxBool isNoDataMainTypes = false.obs;
  getMainTyps() async {
    var response = await crud.postRequest(AppLinksApi.getMainTypes, {});
    response['status'] == "success"
        ? isNoDataMainTypes.value = false
        : isNoDataMainTypes.value = true;

    return response;
  }

  String idMainType = "";
  RxBool isNoDataSubTypes = false.obs;
  getSubTyps(String idMainType) async {
    var response = await crud.postRequest(
        AppLinksApi.getSubTypes, {"main_type_id": idMainType.toString()});
    response['status'] == "success"
        ? isNoDataSubTypes.value = false
        : isNoDataSubTypes.value = true;

    return response;
  }

  String idSubType = "";

  RxBool isNoDataTypeOFSubTypes = false.obs;
  getTypeOFSubTyps(String idSubType) async {
    var response = await crud.postRequest(AppLinksApi.getTypeOfSubType,
        {"sub_type_id_key": idSubType.toString()});
    response['status'] == "success"
        ? isNoDataTypeOFSubTypes.value = false
        : isNoDataTypeOFSubTypes.value = true;

    return response;
  }
  ///////////////////////////// Home Page Offers Anim,,,,,,,,,,,,,,.............................

  RxInt countTheAnimOfferInHome = 0.obs;

  getAnimOfferInHome() {
    Timer.periodic(const Duration(seconds: 8), (Timer timer) async {
      countTheAnimOfferInHome.value >= 2
          ? countTheAnimOfferInHome.value = 0
          : countTheAnimOfferInHome.value += 1;
    });
  }

//...........Settings Accounts......///////////////////

  RxBool ShowThemenuApp = false.obs;
  RxBool isEnableLocationService = false.obs;
  RxBool MessageAboutLocationServiceEnable = false.obs;
  RxBool showTheAccountInfo = false.obs;
  RxBool IsEnterPhoneNumber = false.obs;
  RxBool isVerificationLocationCompleted = false.obs;

//////////////////............................Get The Location..............///////////////////////
  RxBool aboutLocation = false.obs;
  RxBool locationPage = false.obs;
  RxBool showTheLocation = false.obs;
  RxBool checkTheLocation = false.obs;
  var myCurrentPositionLatitude = 2.2;
  var myCurrentPositionLongitude = 2.2;
  RxBool IsrequestPermissionDenied = false.obs;
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();
  Future getPo() async {
    bool services;
    LocationPermission per;
    services = await Geolocator.isLocationServiceEnabled();
    if (services == true) {
      per = await Geolocator.checkPermission();
      if (per == LocationPermission.denied) {
        per = await Geolocator.requestPermission();
      } else {
        await Geolocator.getCurrentPosition().then((value) {
          myCurrentPositionLatitude = value.latitude;
          myCurrentPositionLongitude = value.longitude;
        });
      }
    }
  }

  Future checkIsEnableLocationServices() async {
    checkTheLocation.value = true;
    bool services;
    LocationPermission per;
    await Future.delayed(Duration(seconds: 3), () async {
      services = await Geolocator.isLocationServiceEnabled();
      if (services == true) {
        per = await Geolocator.checkPermission();
        if (per == LocationPermission.denied) {
          IsrequestPermissionDenied.value = true;
          per = await Geolocator.requestPermission();
        } else {
          await Geolocator.getCurrentPosition().then((value) {
            myCurrentPositionLatitude = value.latitude;
            myCurrentPositionLongitude = value.longitude;
            displayLongLocation.value = value.longitude;
            displayLatLocation.value = value.latitude;
          });

          isVerificationLocationCompleted.value = true;
        }
      } else {
        MessageAboutLocationServiceEnable.value = true;
      }
    });
  }

  Future askPermissionOfLocation() async {
    // ignore: unused_local_variable
    LocationPermission per;
    per = await Geolocator.requestPermission();
    checkIsEnableLocationServices();
  }

///////////////////////////////......................Auth SignUp..........................////////////////////
  ////////////////////////////////////////.........Auth,,,,,,,,,,,,,,,,,,,,,,,,,,,,,..............///////////////////////////////
  TextEditingController phoneAuthLoginController = TextEditingController();
  TextEditingController passwordAuthLoginController = TextEditingController();
  final keyAuthLogin = GlobalKey();

  String numberPhoneAuthLogin = "";
  String passwordAuthLogin = "";
  RxBool waitLoginSignAuth = false.obs;
  RxBool isLoginSignAuthSuccessfully = false.obs;
  RxBool errorLoginSignAuth = false.obs;

  TextEditingController thePhoneNumberInSignUpLogin =
      new TextEditingController();
  String thePhoneNumberTextSignUpLogin = "";
  TextEditingController theNameInSignUp = new TextEditingController();
  String theNameTextSignUp = "";

  Future<void> createAccount(String name, String phone) async {
    var response = await crud.postRequest(AppLinksApi.createNewAccount, {
      'user_name': "${name.toString()}",
      'user_number_phone': "${phone.toString()}",
    });

    if (response['status'] == "success") {
      getDataUser(phone.toString());

      Get.to(HomeScreen());
    } else {}

    return response;
  }

  String userID = "";
  String userName = "";
  String userPhone = "";
  double user_latitude = 5.0;
  double user_longitude = 5.0;

  getDataUser(String phone) async {
    var response = await crud.postRequest(AppLinksApi.getDataUser, {
      'user_number_phone': phone.toString(),
    });

    if (response['status'] == "success") {
      userID = response['data'][0]['user_id'].toString();
      userName = response['data'][0]['user_name'].toString();
      userPhone = response['data'][0]['user_number_phone'].toString();
      user_latitude =
          double.parse(response['data'][0]['user_latitude'].toString());
      user_longitude =
          double.parse(response['data'][0]['user_longitude'].toString());

      appServices.sharedPreferences.setInt('isHaveAccount', 1);
      appServices.sharedPreferences.setString('userName', userName);
      appServices.sharedPreferences.setString('userID', userID);
      appServices.sharedPreferences.setString('phone', userPhone);
      appServices.sharedPreferences.setDouble('Long', user_longitude);
      appServices.sharedPreferences.setDouble('Lat', user_latitude);

      await Future.delayed(const Duration(seconds: 5), () async {
        onInit();
      });
    } else {}
    return response;
  }

  Future<void> savelocationUser(
    String lat,
    String long,
  ) async {
    var response = await crud.postRequest(AppLinksApi.savelocation, {
      'user_id': displayUserId.value.toString(),
      'user_latitude': lat.toString(),
      'user_longitude': long.toString(),
    });

    if (response['status'] == "success") {
      appServices.sharedPreferences.setDouble('long', double.parse(long));
      appServices.sharedPreferences.setDouble('lat', double.parse(lat));

      getDataUserLocation(displayUserPhone.value.toString());
    } else {}

    return response;
  }

  getDataUserLocation(String phone) async {
    var response = await crud.postRequest(AppLinksApi.getDataUser, {
      'user_number_phone': phone.toString(),
    });

    if (response['status'] == "success") {
      displayLatLocation.value =
          double.parse(response['data'][0]['user_latitude'].toString());
      displayLongLocation.value =
          double.parse(response['data'][0]['user_longitude'].toString());
      appServices.sharedPreferences.setDouble('Long', displayLatLocation.value);
      appServices.sharedPreferences.setDouble('Lat', displayLongLocation.value);
      await Future.delayed(const Duration(seconds: 3), () async {
        ConvertIntoTextAddress();
        onInit();
      });
    } else {}
    return response;
  }

  RxString displayUserName = "ليس لديك حساب".obs;
  RxString displayUserId = "".obs;
  RxInt displayIsHavaAccount = 0.obs;
  RxString displayUserPhone = "".obs;
  RxDouble displayLongLocation = 0.0.obs;
  RxDouble displayLatLocation = 0.0.obs;

/////////////////////////////////////////////////The OnInit......................................///////////////////
  @override
  void onInit() {
    if (appServices.sharedPreferences.containsKey('isHaveAccount')) {
      displayIsHavaAccount.value =
          appServices.sharedPreferences.getInt('isHaveAccount') as int;

      displayUserName.value =
          appServices.sharedPreferences.getString('userName') as String;
      displayUserId.value =
          appServices.sharedPreferences.getString('userID') as String;

      displayUserPhone.value =
          appServices.sharedPreferences.getString('phone') as String;
      getDataUser(displayUserName.value.toString());
      addTokenUser();
    }

    if (appServices.sharedPreferences.containsKey('Long')) {
      getDataUserLocation(displayUserPhone.value);
    }
    super.onInit();
  }

  //////////////////...................About Order ...............................///////////////

/////////////////////..Add Order........To Database........../////////////
  RxInt countTheSerivce = 0.obs;
  RxInt totalPriceTheSerivce = 0.obs;
  String idTheMainType = "1";

  Map<String, String> choseService = {};

  RxBool waitLoadingAddOrder = false.obs;

  Future<void> addOrder(
    String idType,
    String ordrNumber,
    String totle,
  ) async {
    waitLoadingAddOrder.value = true;

    var response = await crud.postRequest(AppLinksApi.addOrder, {
      'user_id': displayUserId.toString(),
      'type_id': idType.toString(),
      'order_number': ordrNumber.toString(),
      'price_totle': totle.toString(),
    });

    if (response['status'] == "success") {
    } else {}

    Future.delayed(Duration(seconds: 5), () async {
      waitLoadingAddOrder.value = false;
      countTheSerivce.value = 0;
      totalPriceTheSerivce.value = 0;
      choseService.clear();
    });
    return response;
  }

  Future<void> addOrderSubType(
      String ordrNumber, String idType, String subType) async {
    var response = await crud.postRequest(AppLinksApi.addSubOrder, {
      'user_id': displayUserId.toString(),
      'order_number': ordrNumber.toString(),
      'type_id': idType.toString(),
      'sub_type': subType.toString(),
    });

    if (response['status'] == "success") {
    } else {}

    return response;
  }

//////////////////////.Get The Orders And Show .................///////////
  RxBool showTheOrderPage = false.obs;
  RxBool showTheConfirmationOrderDetials = false.obs;
  RxBool showTheOrderAndConfirmationThat = false.obs;

  RxBool isHaveTheUserOrders = false.obs;

  String idOfOrder = "";
  String nameOfMainTypeOrder = "";
  String nameOfMainTypeOrderEn = "";

  String totalOfOrder = "";
  String numberOfOrder = "";
  String dateOfOrder = "";
  String timeOfOrder = "";
  String descriptionOfOrder = "";
  String urlImageOfOrder = "";
  String theWayToPayTheOrder = "";

  RxBool showTheDetails = false.obs;

  Future getOrders() async {
    var response = await crud.postRequest(AppLinksApi.getOrders, {
      'user_id': displayUserId.toString(),
    });

    if (response['status'] == "success") {
      isHaveTheUserOrders.value = true;
    } else {
      isHaveTheUserOrders.value = false;
    }

    return response;
  }

  RxBool isHaveTheUserSubOrders = false.obs;

  Future getSubOfOrders(String numberOfOrder) async {
    var response = await crud.postRequest(AppLinksApi.getTypeOrders, {
      'user_id': displayUserId.toString(),
      'order_number': numberOfOrder.toString(),
    });

    if (response['status'] == "success") {
      isHaveTheUserSubOrders.value = true;
    } else {
      isHaveTheUserSubOrders.value = false;
    }

    return response;
  }

///////////Add Text And Images And How To Pay To The Orders,,,..................../////////
  TextEditingController addDescriptionController = new TextEditingController();
  String textdescriptionOrder = "";
  var filename;
  RxBool isChooesImage = false.obs;
  RxBool addImageWork = false.obs;

  upIm(File? mfile) async {
    // ignore: unused_local_variable
    var response =
        await crud.postRequestFile(AppLinksApi.uploadimage, {}, mfile!);
  }

  RxInt howToPayTheOrder = 0.obs;
  RxBool showTheDate = false.obs;
  RxString theDate = "لايوجد تاريخ مُدخل".obs;
  RxBool showTheTime = false.obs;
  RxString theTime = "لايوجد وقت مُدخل".obs;

  RxInt showTheflexibleORspecific = 0.obs;
  RxInt chooseFlexibleTime = 0.obs;
  RxString chooseTextFlexibleTime = "".obs;
  RxInt choosespecificTime = 0.obs;

  Future endTheOrder(String idOrder, String desc, String urlImage,
      String timeOfOrder, String DateOFOrder, String howToPayOrder) async {
    var response = await crud.postRequest(AppLinksApi.endTheOrder, {
      'order_id': idOrder.toString(),
      'order_time': timeOfOrder.toString(),
      'order_date': DateOFOrder.toString(),
      'order_description': desc.toString(),
      'order_image': "https://larra.xyz/images_nara/$urlImage",
      'type_of_pay': howToPayOrder.toString(),
    });

    if (response['status'] == "success") {
      clearTheDataOrder();
    } else {}

    return response;
  }

  clearTheDataOrder() {
    howToPayTheOrder.value = 0;
    showTheDate.value = false;
    theDate.value = "لايوجد تاريخ مُدخل";
    showTheTime = false.obs;
    theTime.value = "لايوجد وقت مُدخل";
    showTheflexibleORspecific.value = 0;
    chooseFlexibleTime.value = 0;
    chooseTextFlexibleTime.value = "";
    choosespecificTime.value = 0;
    addDescriptionController.clear();
    textdescriptionOrder = "";

    isChooesImage.value = false;
    addImageWork.value = false;
  }

  ////////////////////////////////////////////////////////Take User Token......////////////

  RxBool isHaveUserMessages = false.obs;
  Future getUserMessages() async {
    var response = await crud.postRequest(AppLinksApi.getTypeOrders, {
      'user_id': displayUserId.toString(),
    });

    if (response['status'] == "success") {
      isHaveUserMessages.value = true;
    } else {
      isHaveUserMessages.value = false;
    }

    return response;
  }

  RxBool messageAboutDeleteAccount = false.obs;
  RxString token = "".obs;
  RxString address = "لايوجد عنوان".obs;

  ///////////////////////////LogOut..............////////

  void logOut() {
    appServices.sharedPreferences.clear();

    Get.delete<ControllerApp>();

    Get.offAll(WelcomeScreen());
  }

  ///////////////////Delete Account..................///////////

  void deleteAccount() async {
    var response = await crud.postRequest(AppLinksApi.deleteAccount, {
      'user_id': displayUserId.toString(),
    });

    if (response['status'] == "success") {
      appServices.sharedPreferences.clear();
      Get.offAll(WelcomeScreen());
    } else {}

    return response;
  }

  /////////.........../Add User Token...........................///////////////////.
  void addTokenUser() async {
    FirebaseMessaging.instance.getToken().then((value) async {
      token.value = value!;
      var response = await crud.postRequest(AppLinksApi.addTokenUser, {
        'token': token.value.toString(),
        'user_id': displayUserId.toString(),
      });

      return response;
    });
  }

  ////////////////...........Conver To Text Address ..//////////////////

  void ConvertIntoTextAddress() async {
    List<Placemark> placemarks = await placemarkFromCoordinates(
        displayLatLocation.value, displayLongLocation.value);
    Placemark placeMark = placemarks[0];

    address.value = placeMark.toString();
  }
}
