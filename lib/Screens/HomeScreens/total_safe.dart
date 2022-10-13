import 'package:flutter/material.dart';
import 'package:teknia/Screens/HomeScreens/home_screen.dart';
import 'package:teknia/Data/Shared/Components/reusable_components.dart';
import 'package:teknia/Data/Shared/Styles/icon_broken.dart';

class TotalSafe extends StatelessWidget {
  const TotalSafe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'اجمالى خزينه'
        ),
        leading: IconButton(
            onPressed: () {
              navigateTo(context,  HomeScreen());
            },
            icon: const Icon(IconBroken.Arrow___Left_2)),
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
