import 'package:flutter/material.dart';
import 'package:laundry/widgets/appcard.dart';

import 'models/appmodel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:  SafeArea(
        child: Column(children:  [
                  // StaggeredGridView.countBuilder(
                  //   // physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
                  //   physics: ClampingScrollPhysics(),
                  //   shrinkWrap: true,
                  //   padding: EdgeInsets.all(0),
                  //   crossAxisCount: 2,
                  //   itemCount: 4,
                  //   crossAxisSpacing: 10,
                  //   mainAxisSpacing: 10,
                  //   itemBuilder: (context, index) {
                  //     // return Text("done");
                  //     return AppCard(AppModel.getApps()[index]);
                  //   },
                  //   staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                  // )
        ],),
      ),
    ); 
  }
}
