import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../controllers/controller_app.dart';
import '../../core/constant/appcolors.dart';
import 'HomeWidgets/DetailsServicesWidgets/about_services.dart';
import 'HomeWidgets/DetailsServicesWidgets/sub_types.dart';
import 'HomeWidgets/MainHomeWidgets/no_have_location.dart';
import 'HomeWidgets/MainHomeWidgets/not_have_account.dart';
import 'HomeWidgets/MainHomeWidgets/not_seleced_itmes.dart';
import 'HomeWidgets/MenuAndSettingsWidgets/about_location.dart';
import 'HomeWidgets/MenuAndSettingsWidgets/choose_language.dart';
import 'HomeWidgets/MenuAndSettingsWidgets/info_account.dart';
import 'HomeWidgets/MenuAndSettingsWidgets/get_location.dart';
import 'HomeWidgets/MenuAndSettingsWidgets/menu.dart';
import 'HomeWidgets/MenuAndSettingsWidgets/settings_menu.dart';
import 'HomeWidgets/MenuAndSettingsWidgets/show_location.dart';
import 'HomeWidgets/MainHomeWidgets/container_offers.dart';
import 'HomeWidgets/MenuAndSettingsWidgets/show_invoice.dart';

import 'HomeWidgets/MainHomeWidgets/top_header.dart';
import 'HomeWidgets/MainHomeWidgets/view_main_types.dart';
import 'HomeWidgets/MessagesWidgets/message_widgets.dart';
import 'HomeWidgets/OrdersWidgets/order_confirmation.dart';
import 'HomeWidgets/OrdersWidgets/order_details.dart';
import 'HomeWidgets/OrdersWidgets/orders_confirmation.dart';
import 'HomeWidgets/OrdersWidgets/orders_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ControllerApp controllerApp = Get.put(ControllerApp());
    return Scaffold(
      backgroundColor: AppColors.whiteColorTypeTwo,
      body: SafeArea(
          child: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height * 0.92,
                  child: SingleChildScrollView(
                    child: Column(children: [
                      TopHeaderHomeScreen(),
                      ContainerOffers(),
                      SizedBox(
                        height: 420.h,
                        child: viewTheMainTypesHomeScreen(),
                      ),
                    ]),
                  ),
                ),
                Container(
                    height: MediaQuery.of(context).size.height * 0.08,
                    child: MenuList())
              ],
            ),
          ),
          SubTypes(),
          SettingsMenu(),
          AboutLocation(),
          GetLocation(),
          InfoAcount(),
          aboutTheDetailsService(),
          OrdersList(),
          OrdersConfirmation(),
          OrdersDetails(),
          ShowTheLocation(),
          MessagesList(),
          NotHaveAccountMessage(),
          NotAddItems(),
          NotHaveLocation(),
          ChooseLanguage(),
          InvList(),
          orderConf(),
        ],
      )),
    );
  }
}
