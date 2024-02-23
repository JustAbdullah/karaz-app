//import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import 'package:karaz/views/OnBoardinScreen/onboarding.dart';
import 'package:karaz/views/WelcomeScreen/welcome_screen.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../core/class/class/crud.dart';

import '../core/constant/appcolors.dart';
import '../core/services/appservices.dart';
import '../linksapi.dart';
import '../views/HomeScreen/home_screen.dart';

class ControllerApp extends GetxController {
  final crud = Crud();
  AppServices appServices = Get.find();

//////////////////............The Loading  Page Animation..................................................////////////////////

  RxBool theWay = false.obs;
  WhereGoingTheApp() {
    Future.delayed(Duration(seconds: 5), () async {
      if (theWay.value == false) {
        if (appServices.sharedPreferences.containsKey('onBoarding')) {
          if (appServices.sharedPreferences.containsKey('isHaveAccount')) {
            Get.to(HomeScreen());
            theWay.value = true;
          } else {
            Get.to(WelcomeScreen());
            theWay.value = true;
          }
        } else {
          Get.to(OnBoarding());
          theWay.value = true;
        }
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

  RxBool countTheAnimOfferInHome = true.obs;

  getAnimOfferInHome() {
    Timer.periodic(const Duration(seconds: 300), (Timer timer) async {
      if (countTheAnimOfferInHome.value == true) {
        countTheAnimOfferInHome.value = false;
      } else {
        countTheAnimOfferInHome.value = true;
      }
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

            savelocationUser(myCurrentPositionLatitude.toString(),
                myCurrentPositionLongitude.toString());
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
  String thePhoneNumberTextSignUpLogin = "a";
  TextEditingController theNameInSignUp = new TextEditingController();
  String theNameTextSignUp = "";

  TextEditingController theCode = new TextEditingController();
  String thecodeText = "";
  RxInt isLoginOrSignUp = 1.obs;
  Future<void> createAccount(String name, String phone) async {
    waitLoginSignAuth.value = true;
    var response = await crud.postRequest(AppLinksApi.createNewAccount, {
      'user_name': "${name.toString()}",
      'user_number_phone': "${phone.toString()}",
    });

    if (response['status'] == "success") {
      getDataUser(phone.toString());
      waitLoginSignAuth.value = false;

      Get.to(HomeScreen());
    } else {}

    return response;
  }

  Future<void> LoginUser(String phone) async {
    var response = await crud.postRequest(AppLinksApi.loginUser, {
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
      //appServices.sharedPreferences.setDouble('Long', user_longitude);
      // appServices.sharedPreferences.setDouble('Lat', user_latitude);

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
  RxBool messageAboutNotHaveAccount = false.obs;
  RxString displayUserPhone = "".obs;
  RxDouble displayLongLocation = 0.0.obs;
  RxDouble displayLatLocation = 0.0.obs;

/////////////////////////////////////////////////The OnInit......................................///////////////////
  @override
  void onInit() {
    GetDate();

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
      if (appServices.sharedPreferences.containsKey('Long')) {
        getDataUserLocation(displayUserPhone.value);
      } else {
        askPermissionOfLocation();
      }
    }

    //////////////Date

    super.onInit();
  }

  //////////////////...................About Order ...............................///////////////

/////////////////////..Add Order........To Database........../////////////
  RxInt countTheSerivce = 0.obs;
  RxInt totalPriceTheSerivce = 0.obs;
  String idTheMainType = "1";

  Map<String, String> choseService = {};

  RxBool waitLoadingAddOrder = false.obs;
  RxBool successfullyAddOrder = false.obs;

  RxInt StypsOfOrdersConf = 1.obs;
  Future<void> addOrder(
    String idType,
    String ordrNumber,
    String totle,
    String time,
    String date,
    String di,
    String image,
    String typePay,
  ) async {
    waitLoadingAddOrder.value = true;

    var response = await crud.postRequest(AppLinksApi.addOrder, {
      'user_id': displayUserId.toString(),
      'type_id': idType.toString(),
      'order_number': ordrNumber.toString(),
      'price_totle': totle.toString(),
      'order_time': time.toString(),
      'order_date': date.toString(),
      'order_description': di.toString(),
      'order_image': image.toString(),
      'type_of_pay': typePay.toString(),
    });

    if (response['status'] == "success") {
      /*  sendMessage(
          "لقد اضفت الخدمة إلى قائمة الطلبيات ورقم الطلبية هي :${ordrNumber}, الرجاء القيام بتاكيد الطلبية او إلغاءها في قائمة الطلبيات");*/
      /*   Future.delayed(Duration(seconds: 2), () async {
        waitLoadingAddOrder.value = false;
        countTheSerivce.value = 0;
        totalPriceTheSerivce.value = 0;
        successfullyAddOrder.value = true;
        choseService.clear();
        Future.delayed(Duration(seconds: 2), () async {
          countTheSerivce.value = 0;
          totalPriceTheSerivce.value = 0;
          successfullyAddOrder.value = false;
          choseService.clear();
        });
      });*/
    } else {}

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

  RxBool waitAddDetailsOrder = false.obs;
  RxBool addTheDetailsOrder = false.obs;
  Future endTheOrder(
      String idOrder,
      String desc,
      String urlImage,
      String timeOfOrder,
      String DateOFOrder,
      String howToPayOrder,
      String idOfOrder) async {
    waitAddDetailsOrder.value = true;
    var response = await crud.postRequest(AppLinksApi.endTheOrder, {
      'order_id': idOrder.toString(),
      'order_time': timeOfOrder.toString(),
      'order_date': DateOFOrder.toString(),
      'order_description': desc.toString(),
      'order_image': "https://larra.xyz/images_nara/$urlImage",
      'type_of_pay': howToPayOrder.toString(),
    });

    if (response['status'] == "success") {
      sendMessage(
          "لقد قمت بتاكيد الطلبية بنجاح رقم الطلبية المؤكده هي ${idOfOrder}..سيتم تقديم الخدمة إليك بتاريخ الجدولة المختارة وهي كالتالي اليوم : ${DateOFOrder}.. وبالوقت :${timeOfOrder}.. الرجاء تواجدك في هذا اليوم والوقت للقيام بالخدمة وفي حال وُجد اي إشكالية في الموعد سيتم إبلاغك..شُكرا منصة كرز");
      Future.delayed(Duration(seconds: 2), () async {
        waitAddDetailsOrder.value = false;
        addTheDetailsOrder.value = true;
        clearTheDataOrder();
      });
      Future.delayed(Duration(seconds: 5), () async {
        addTheDetailsOrder.value = false;
        Future.delayed(Duration(seconds: 1), () async {
          showTheOrderAndConfirmationThat.value = false;
          showTheOrderPage.value = false;
        });
      });
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

  //////////////////////////////////Message send and Get.....................//////////////

  void sendMessage(String title) async {
    var response = await crud.postRequest(AppLinksApi.sendMessage, {
      'user_id': displayUserId.value.toString(),
      'body': title.toString(),
    });

    return response;
  }

  RxBool showTheMessage = false.obs;
  RxBool isTheUserHaveMessage = false.obs;
  Future getTheMessageUser() async {
    var response = await crud.postRequest(AppLinksApi.getMessage, {
      'user_id': displayUserId.value.toString(),
    });
    if (response['status'] == "success") {
      isTheUserHaveMessage.value = true;
    } else {
      isTheUserHaveMessage.value = false;
    }
    return response;
  }

  ////////////////////////////////
  RxBool showLang = false.obs;

  RxBool showInvoice = false.obs;

///////////////////////////////Date with week day-month Order New...... ............//////

  RxInt theNumberOFORder = 0.obs;
  RxBool OpeartionsOrderPage = false.obs;
  RxInt whereIsTheOrderStyp = 3.obs;
  RxBool showTheSh = true.obs;
  RxString titleOfOrder = "الجدولة".obs;
  RxString buttonInOrder = "المتابعة".obs;
  RxString theDateChoosd = "".obs;
  RxString theTimeChosed = "".obs;
  RxInt countTheTimeChosed = 0.obs;

  RxInt choosedPay = 1.obs;
  RxBool showTheConfOrder = false.obs;
  RxBool showTheEndOfPageOrder = false.obs;

  FuwhereIsTheOrderStyp() {
    if (whereIsTheOrderStyp.value == 3) {
      if (countTheTimeChosed != 0 && countTheWhatChooseOfDate != 0) {
        whereIsTheOrderStyp.value = 4;
        showTheSh.value = false;
        titleOfOrder.value = "185-التاكيد".tr;
        buttonInOrder.value = "الإنهاء";
        showTheConfOrder.value = true;
      } else {}
    } else if (whereIsTheOrderStyp.value == 4) {
      whereIsTheOrderStyp.value = 5;

      showTheConfOrder.value = false;
      addOrder(
          idMainType.toString(),
          theNumberOFORder.toString(),
          totalPriceTheSerivce.value.toString(),
          theTimeChosed.value.toString(),
          theDateChoosd.value.toString(),
          "",
          "",
          choosedPay.value.toString());
      showTheEndOfPageOrder.value = true;
      titleOfOrder.value = "إنتهاء التاكيد";
      buttonInOrder.value = "الإنهاء";
    }
  }

  RxInt countTheWhatChooseOfDate = 0.obs;
///////Day Text......
  RxString afterOneDay = "".obs;
  RxString afterTwoDay = "".obs;
  RxString afterThreeDay = "".obs;
  RxString afterFourDay = "".obs;
  RxString afterFiveDay = "".obs;
  RxString afterSixDay = "".obs;
  RxString afterSevenDay = "".obs;
////////////day Number.............//////
  RxString afterOneDayNumber = "".obs;
  RxString afterTwoDayNumber = "".obs;
  RxString afterThreeDayNumber = "".obs;
  RxString afterFourDayNumber = "".obs;
  RxString afterFiveDayNumber = "".obs;
  RxString afterSixDayNumber = "".obs;
  RxString afterSevenDayNumber = "".obs;
  ////////////Day Month..............///////
  RxString afterOneDate = "".obs;
  RxString afterTwoDate = "".obs;
  RxString afterThreeDate = "".obs;
  RxString afterFourDate = "".obs;
  RxString afterFiveDate = "".obs;
  RxString afterSixDate = "".obs;
  RxString afterSevenDate = "".obs;

  Future GetDate() async {
    initializeDateFormatting();
    Intl.defaultLocale = 'ar';
    /////////Date................//////
    afterOneDate.value =
        DateFormat.MMM().format(DateTime.now().add(Duration(days: 1)));
    afterTwoDate.value =
        DateFormat.MMM().format(DateTime.now().add(Duration(days: 2)));
    afterThreeDate.value =
        DateFormat.MMM().format(DateTime.now().add(Duration(days: 3)));
    afterFourDate.value =
        DateFormat.MMM().format(DateTime.now().add(Duration(days: 4)));
    afterFiveDate.value =
        DateFormat.MMM().format(DateTime.now().add(Duration(days: 5)));
    afterSixDate.value =
        DateFormat.MMM().format(DateTime.now().add(Duration(days: 6)));
    afterSevenDate.value =
        DateFormat.MMM().format(DateTime.now().add(Duration(days: 7)));
    ///////////////////Day Text...........................///////
    afterOneDay.value =
        DateFormat('EEE').format(DateTime.now().add(Duration(days: 1)));
    afterTwoDay.value =
        DateFormat('EEE').format(DateTime.now().add(Duration(days: 2)));
    afterThreeDay.value =
        DateFormat('EEE').format(DateTime.now().add(Duration(days: 3)));
    afterFourDay.value =
        DateFormat('EEE').format(DateTime.now().add(Duration(days: 4)));
    afterFiveDay.value =
        DateFormat('EEE').format(DateTime.now().add(Duration(days: 5)));
    afterSixDay.value =
        DateFormat('EEE').format(DateTime.now().add(Duration(days: 6)));
    afterSevenDay.value = DateFormat('EEE').format(DateTime.now().add(Duration(
        days:
            7))); ///////////////////Day Number...........................///////
    afterOneDayNumber.value =
        DateFormat.d().format(DateTime.now().add(Duration(days: 1)));
    afterTwoDayNumber.value =
        DateFormat.d().format(DateTime.now().add(Duration(days: 2)));
    afterThreeDayNumber.value =
        DateFormat.d().format(DateTime.now().add(Duration(days: 3)));
    afterFourDayNumber.value =
        DateFormat.d().format(DateTime.now().add(Duration(days: 4)));
    afterFiveDayNumber.value =
        DateFormat.d().format(DateTime.now().add(Duration(days: 5)));
    afterSixDayNumber.value =
        DateFormat.d().format(DateTime.now().add(Duration(days: 6)));
    afterSevenDayNumber.value =
        DateFormat.d().format(DateTime.now().add(Duration(days: 7)));
  }

  clearOrder() {
    theNumberOFORder.value = 0;
    OpeartionsOrderPage.value = false;
    whereIsTheOrderStyp.value = 3;
    showTheSh.value = true;
    titleOfOrder.value = "180-الجدولة".tr;
    buttonInOrder.value = "181-المتابعة".tr;
    theDateChoosd.value = "";
    theTimeChosed.value = "";
    countTheTimeChosed.value = 0;

    choosedPay.value = 1;
    showTheConfOrder.value = false;
    showTheEndOfPageOrder.value = false;

    countTheWhatChooseOfDate.value = 0;
  }

  RxBool isTheUserInv = false.obs;
  Future getTheInvUser() async {
    var response = await crud.postRequest(AppLinksApi.getInv, {});
    if (response['status'] == "success") {
      isTheUserInv.value = true;
    } else {
      isTheUserInv.value = false;
    }
    return response;
  }

  //////////////////////////////////////Is No selecetd Itmes......Or No haveLoctaiont.................////////
  RxBool noSelecetdItems = false.obs;
  RxBool noAddLocation = false.obs;
}
