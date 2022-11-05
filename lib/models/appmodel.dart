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
            "Dry cleaning", Icons.message, "images/E.JPG", '/comingSoon'),
        AppModel("Ironing", FontAwesomeIcons.car, "images/E3.jpg",
            '/irideHome'),
        AppModel("House Cleaning", FontAwesomeIcons.utensils, "images/E2.JPG",
            '/comingSoon'),
        AppModel("", FontAwesomeIcons.laptopMedical,
            "images/E4.JPG", '/comingSoon'),
        AppModel("iMart", FontAwesomeIcons.shoppingCart,
            "images/Laundry3.png", '/comingSoon'),
        AppModel("iFarm", FontAwesomeIcons.crop, "images/Laundry3.png",
            '/comingSoon'),
        AppModel("iLodge", FontAwesomeIcons.bed, "images/Laundry3.png",
            '/comingSoon'),
        AppModel("iFly", FontAwesomeIcons.plane, "images/Laundry3.png",
            '/comingSoon'),
         AppModel("iHirePipu", FontAwesomeIcons.hireAHelper,
            "images/Laundry3.png", '/comingSoon'),
        // AppModel("iRent", FontAwesomeIcons.houseUser, "assets/baseapp/rent.png",
        //     '/comingSoon'),
        // AppModel("iMobileWater", FontAwesomeIcons.tint,
        //     "assets/baseapp/water.png", '/comingSoon'),
        // AppModel("iWaybill", FontAwesomeIcons.wallet,
        //     "assets/baseapp/waybill.png", '/comingSoon'),
        // AppModel("iWash", FontAwesomeIcons.handsWash, "assets/baseapp/wash.png",
        //     '/comingSoon'),
        // AppModel("iSure", FontAwesomeIcons.car, "assets/baseapp/sure.png",
        //     '/comingSoon'),
        // AppModel("iPaylater", FontAwesomeIcons.moneyCheck,
        //     "assets/baseapp/paylater.png", '/comingSoon'),
        // AppModel("iMassage", FontAwesomeIcons.spa, "assets/baseapp/massage.png",
        //     '/comingSoon'),
        // AppModel("iNavigate", FontAwesomeIcons.directions,
        //     "assets/basea  FontAwesomeIcons.userShield,
        //     "assets/baseapp/mentor.png", '/comingSoon'),
        // AppModel("iMingle", FontAwesomeIcons.users, "assets/baseapp/mingle.png",
        //     '/comingSoon'),
        // AppModel("iDress", FontAwesomeIcons.tshirt, "assets/baseapp/dress.png",
        //     '/comingSoon'),
        // AppModel("iDrink", FontAwesomeIcons.cocktail,
        //     "assets/baseapp/drink.png", '/comingSoon'),
        // AppModel("iKeepFit", FontAwesomeIcons.heartbeat,
        //     "assets/baseapp/fit.png", '/comingSoon'),
        // AppModel("iAutos", FontAwesomeIcons.carCrash,
        //     "assets/baseapp/autos.png", '/comingSoon'),
      ];
}
