import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:teknia/Screens/HomeScreens/Drawer/drawer_widget.dart';
import 'package:teknia/Shared/Components/reusable_components.dart';
import 'package:teknia/Shared/HomeCubit/home_cubit.dart';
import 'package:teknia/Shared/HomeCubit/home_states.dart';
import 'package:teknia/Shared/Styles/icon_broken.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  static final DateTime now = DateTime.now();
  static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  final String formatted = formatter.format(now);

  var dateLastController = TextEditingController();
  var dateBeginController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit ,AppStates>(
        listener: (context ,state){},
        builder: (context ,state){

          return Scaffold(
            appBar: AppBar(
              leading: Builder(
              builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                IconBroken.More_Square,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },),


            ),
            body: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        OutlinedButton(

                          onPressed: (){
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.parse('2000-10-10'),
                                lastDate:
                                DateTime.parse('2100-10-10'))
                                .then((value) {
                              dateLastController.text =
                                  DateFormat.yMMMd().format(value!);
                            });
                          },
                          child: Text('${dateLastController.text}',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.deepPurple
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'الى',
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        OutlinedButton(

                          onPressed: (){
                            showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.parse('2000-10-10'),
                                lastDate:
                                DateTime.parse('2100-10-10'))
                                .then((value) {
                              dateBeginController.text =
                                  DateFormat.yMMMd().format(value!);
                            });
                          },
                          child: Text(
                            '${dateBeginController.text}',
                            style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.deepPurple
                            ),
                          ),
                        ),                 SizedBox(
                          width: 5.0,
                        ),
                        Text('من',
                          style: TextStyle(
                              fontSize: 15.0
                          ),
                        ),
                      ],
                    ),
                    Container(
                      color: Colors.white60,
                      child: GridView.count(

                        crossAxisCount: 2,
                        shrinkWrap: true ,
                        physics: const NeverScrollableScrollPhysics(),
                        mainAxisSpacing: 1.0,
                        crossAxisSpacing: 1.0,
                        childAspectRatio: 1 / 1.50,
                        children: List.generate(AppCubit.get(context).icons.length, (index) => buildGridProduct(context,
                        title: AppCubit.get(context).titlePages[index],
                          icons: AppCubit.get(context).icons[index],
                          screens: AppCubit.get(context).screens[index],

                        )),
                      ),
                    ),


                  ],
                ),
              ),
            ),
            drawer: NavigationDrawerWidget(),
          );
        },
      ),
    );
  }

  Widget buildGridProduct(context, {
    String? title,
    IconData? icons,
    Widget? screens,

  }
  )=>InkWell(
    onTap: ({
      int index=0,
    }){
      navigateTo(context, screens);

      AppCubit.get(context).changeIndex(index);
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: 5.0,
          vertical: 10.0
      ),
      child: Card(

        clipBehavior: Clip.antiAliasWithSaveLayer,
        elevation: 5.0,
        color: Colors.grey[200],
        margin: const EdgeInsets.symmetric(
          horizontal: 2.0,

        ),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child:Center(
                child: Icon(icons,
                  color: Colors.deepPurple,
                  size: 120,

                ),
              )
            ),

            const SizedBox(
              height: 10.0,
            ),

            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      '${title}',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14.0,
                        height: 1.3,
                      ),

                    ),
                  ),

                  const SizedBox(
                    height: 10.0,
                  ),
                  Center(
                    child: const Text(
                      '1000',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:  TextStyle(
                        fontSize: 14.0,
                        height: 1.3,
                      ),

                    ),
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
