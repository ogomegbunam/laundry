import 'package:flutter/material.dart';
import 'package:laundry/widgets/appcard.dart';

import 'models/appmodel.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
              ),
              Expanded(flex: 1,child: Text('aga')),
              Expanded(flex: 5,child: GridView.builder(
                itemCount:AppModel.getApps().length ,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          Orientation == Orientation.portrait ? 2 : 3),
                  itemBuilder: (context, index) {
                    // return Text("done");
                    return AppCard(AppModel.getApps()[index]);
                  }))
            ],
          ),
        ),
      ),
    );
  }
}
