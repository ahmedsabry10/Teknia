import 'package:flutter/material.dart';
import 'package:teknia/Data/Shared/Components/reusable_components.dart';
import 'package:teknia/Data/Shared/Styles/icon_broken.dart';
import 'package:teknia/Data/Cubits/HomeCubit/home_cubit.dart';
import 'package:teknia/Data/Cubits/HomeCubit/home_states.dart';
import 'package:teknia/Screens/DetailsScreens/purchase_details.dart';
import 'package:teknia/Screens/HomeScreens/home_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


// ignore: camel_case_types
class purchasesScreen extends StatelessWidget {
  const purchasesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit ,AppStates>(
      listener: (context ,state){},
      builder: (context ,state){

        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  navigateAndFinish(context,  HomeScreen());
                },
                icon: const Icon(IconBroken.Arrow___Left_2)),
            centerTitle: true,
            title: Text(
              ' المشتريات'
            ),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder:(context,index)=> buildFatoraItems(context),
                    separatorBuilder: (context,index) => defaultLine(),
                    itemCount: 10
                ),
              )





            ],
          ),

        );
      },

    );
  }

  Widget buildFatoraItems(context)=>InkWell(
    onTap: (){
      navigateTo(context, PurchaseDetails());
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 10.0
      ),
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        color: Colors.grey[100],
        elevation: 7.0,
        margin: const EdgeInsets.symmetric(
          horizontal: 2.0,
        ),
        child: Column(
          children: [


            Row(
              children: [
                Spacer(),
                Text(
                    '1'
                ),
                SizedBox(
                  width: 20.0,
                ),
                Text(
                    'رقم الفاتوره'
                ),


              ],
            ),
            buildAlasnafItems()
          ],
        ),
      ),
    ),
  );
}



Widget buildAlasnafItems()=>Padding(
  padding: const EdgeInsets.all(8.0),
  child: Card(
    clipBehavior: Clip.antiAliasWithSaveLayer,
    elevation: 2.0,
    margin: const EdgeInsets.symmetric(
      horizontal: 2.0,
    ),
    color: Colors.grey[300],
    child: Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          // اسم الصنف
          Row(
            children: [
              Spacer(),
              Text(
                'احمد صبرى ',style: TextStyle(
                  color: Colors.deepPurple
              ),
              ),
              Text(
                  'اسم المورد '
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [

              //صافى سعر
              Text(
                '2500',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(
                width: 10.0,
              ),
              Expanded(
                child: Text(
                    'صافى سعر '
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              //كميه
              Text(
                '50',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                  'الخصم '
              ),





            ],
          ),
        ],
      ),
    ),
  ),
);