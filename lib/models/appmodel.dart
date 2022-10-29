import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AppModel {
  String title;
  IconData icon;
  String image;
  String navigation;

  AppModel(this.title, this.icon, this.image, this.navigation);

  static List<AppModel> getApps() => [
        AppModel(
            "iChat", Icons.message, "assets/baseapp/chat.png", '/comingSoon'),
        AppModel("iRide", FontAwesomeIcons.car, "assets/baseapp/ride.png",
            '/irideHome'),
        AppModel("iEat", FontAwesomeIcons.utensils, "assets/baseapp/eat.png",
            '/comingSoon'),
        AppModel("iPharm", FontAwesomeIcons.laptopMedical,
            "assets/baseapp/pharm.png", '/comingSoon'),
        AppModel("iMart", FontAwesomeIcons.shoppingCart,
            "assets/baseapp/mart.png", '/comingSoon'),
        AppModel("iFarm", FontAwesomeIcons.crop, "assets/baseapp/farm.png",
            '/comingSoon'),
        AppModel("iLodge", FontAwesomeIcons.bed, "assets/baseapp/lodge.png",
            '/comingSoon'),
        AppModel("iFly", FontAwesomeIcons.plane, "assets/baseapp/fly.png",
            '/comingSoon'),
        AppModel("iHirePipu", FontAwesomeIcons.hireAHelper,
            "assets/baseapp/hire.png", '/comingSoon'),
        AppModel("iRent", FontAwesomeIcons.houseUser, "assets/baseapp/rent.png",
            '/comingSoon'),
        AppModel("iMobileWater", FontAwesomeIcons.tint,
            "assets/baseapp/water.png", '/comingSoon'),
        AppModel("iWaybill", FontAwesomeIcons.wallet,
            "assets/baseapp/waybill.png", '/comingSoon'),
        AppModel("iWash", FontAwesomeIcons.handsWash, "assets/baseapp/wash.png",
            '/comingSoon'),
        AppModel("iSure", FontAwesomeIcons.car, "assets/baseapp/sure.png",
            '/comingSoon'),
        AppModel("iPaylater", FontAwesomeIcons.moneyCheck,
            "assets/baseapp/paylater.png", '/comingSoon'),
        AppModel("iMassage", FontAwesomeIcons.spa, "assets/baseapp/massage.png",
            '/comingSoon'),
        AppModel("iNavigate", FontAwesomeIcons.directions,
            "assets/baseapp/navigate.png", '/comingSoon'),
        AppModel("iLearn", FontAwesomeIcons.school, "assets/baseapp/learn.png",
            '/comingSoon'),
        AppModel("iMentor", FontAwesomeIcons.userShield,
            "assets/baseapp/mentor.png", '/comingSoon'),
        AppModel("iMingle", FontAwesomeIcons.users, "assets/baseapp/mingle.png",
            '/comingSoon'),
        AppModel("iDress", FontAwesomeIcons.tshirt, "assets/baseapp/dress.png",
            '/comingSoon'),
        AppModel("iDrink", FontAwesomeIcons.cocktail,
            "assets/baseapp/drink.png", '/comingSoon'),
        AppModel("iKeepFit", FontAwesomeIcons.heartbeat,
            "assets/baseapp/fit.png", '/comingSoon'),
        AppModel("iAutos", FontAwesomeIcons.carCrash,
            "assets/baseapp/autos.png", '/comingSoon'),
      ];
}
