import 'package:flutter/material.dart';



import '../models/appmodel.dart';

class AppCard extends StatelessWidget {

  AppModel appModel;


  AppCard(this.appModel);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, appModel.navigation);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: const EdgeInsets.all(00),
          width: double.infinity,
          height: 120,
          decoration: BoxDecoration(
           // color: imageOpacity,
            borderRadius: BorderRadius.circular(16),
            image: DecorationImage(
              image: AssetImage(appModel.image),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
            ),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // Icon(
              //   appModel.icon, color: Colors.white,
              // ),
              // SizedBox(width: 10,),
              Text(
                '${appModel.title} ',
                style:  TextStyle(
                  color: Colors.white70.withOpacity(0.9),
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  // color: kwhite.withOpacity(.5),
                 // color: kwhite,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
