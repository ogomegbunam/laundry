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
            "Dry cleaning", Icons.message, "images/E.JPG", '/request'),
        AppModel("Ironing", FontAwesomeIcons.car, "images/E3.jpg",
            '/request'),
        AppModel("House Cleaning", FontAwesomeIcons.utensils, "images/E2.JPG",
            '/requestService'),
        AppModel("", FontAwesomeIcons.laptopMedical,
            "images/E4.JPG", '/request'),
        AppModel("iMart", FontAwesomeIcons.shoppingCart,
            "images/Laundry3.png", '/request'),
        AppModel("iFarm", FontAwesomeIcons.crop, "images/Laundry3.png",
            '/request'),
        AppModel("iLodge", FontAwesomeIcons.bed, "images/Laundry3.png",
            '/request'),
        AppModel("iFly", FontAwesomeIcons.plane, "images/Laundry3.png",
            '/request'),
         AppModel("iHirePipu", FontAwesomeIcons.hireAHelper,
            "images/Laundry3.png", '/request'),
        
      ];
}
