import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teknia/Screens/HomeScreens/DetailsScreens/al3mla2_debts_details.dart';
import 'package:teknia/Screens/HomeScreens/DetailsScreens/sales_details.dart';
import 'package:teknia/Screens/HomeScreens/home_screen.dart';
import 'package:teknia/Shared/Components/reusable_components.dart';
import 'package:teknia/Shared/HomeCubit/home_cubit.dart';
import 'package:teknia/Shared/HomeCubit/home_states.dart';
import 'package:teknia/Shared/Styles/icon_broken.dart';

class CustomerDebts extends StatelessWidget {
  CustomerDebts({Key? key}) : super(key: key);

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
                ' مديونيات العملاء'
            ),
            leading: IconButton(
                onPressed: () {
                  navigateAndFinish(context,  HomeScreen());
                },
                icon: const Icon(IconBroken.Arrow___Left_2)),
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
      navigateTo(context, CustomerDebtsDetails());
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
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [


              Row(
                children: [
                  Text(
                    '15/10/2018'
                  ),
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
              buildAlasnafItems(),
              Row(
                children: [

                  // المتبقى
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
                        'المتبقى '
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  //المدفوع
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
                      'المدفوع '
                  ),





                ],
              ),

            ],
          ),
        ),
      ),
    ),
  );
}



Widget buildAlasnafItems()=>Card(
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
                'اسم العميل '
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
);

