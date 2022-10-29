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
      child: Container(
        padding: EdgeInsets.all(20),
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
         // color: imageOpacity,
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: AssetImage(appModel.image),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.7), BlendMode.dstATop),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              appModel.icon, color: Colors.white,
            ),
            SizedBox(width: 10,),
            Text(
              '${appModel.title} ',
              style: const TextStyle(
                // color: kwhite.withOpacity(.5),
               // color: kwhite,
              ),
            )
          ],
        ),
      ),
    );
  }
}
