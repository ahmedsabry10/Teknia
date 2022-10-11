import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknia/Screens/HomeScreens/mabiaat_screen.dart';
import 'package:teknia/Shared/Components/reusable_components.dart';
import 'package:teknia/Shared/HomeCubit/home_cubit.dart';
import 'package:teknia/Shared/HomeCubit/home_states.dart';
import 'package:teknia/Shared/Styles/icon_broken.dart';

class SalesDetails extends StatelessWidget {
  SalesDetails({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();




  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit ,AppStates>(
      listener: (context ,state){},
      builder: (context ,state){

        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
                'تفاصيل المبيعات'
            ),
            leading: IconButton(
                onPressed: () {
                  navigateAndFinish(context,  SalesScreen());
                },
                icon: const Icon(IconBroken.Arrow___Left_2)),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Expanded(
                child: ListView.separated(
                    physics: BouncingScrollPhysics(),
                    itemBuilder:(context,index)=> buildAlasnafItems(),
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
                'شيبسى ',style: TextStyle(
                  color: Colors.deepPurple
              ),
              ),
              Text(
                  'اسم الصنف '
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
              //خصم
              Text(
                '50',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Expanded(
                child: Text(
                    'الخصم '
                ),
              ),


              //كميه
              Text(
                '2',
                style: TextStyle(
                  color: Colors.deepPurple,
                ),
              ),
              SizedBox(
                width: 20.0,
              ),
              Text(
                  'الكميه '
              ),





            ],
          ),
        ],
      ),
    ),
  ),
);