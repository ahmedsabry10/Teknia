import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teknia/Screens/HomeScreens/alamlaa_screen.dart';
import 'package:teknia/Screens/HomeScreens/home_screen.dart';
import 'package:teknia/Data/Shared/Components/reusable_components.dart';
import 'package:teknia/Data/Shared/Styles/icon_broken.dart';

class DateScreen extends StatelessWidget {
  DateScreen({Key? key}) : super(key: key);

  var formKey = GlobalKey<FormState>();


  var dateBeginController = TextEditingController();
  var dateLastController = TextEditingController();
  var nameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navigateAndFinish(context,  HomeScreen());
            },
            icon: const Icon(IconBroken.Arrow___Left_2)),

      ),
      body: Form(
        key: formKey,
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [


                  Container(
                    height: 200.0,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://icones.pro/wp-content/uploads/2021/04/logo-spotify-icone-png-violet.png')),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    enabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "برجاء ادخل اسم العميل ";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(
                          18.0, 10.0, 18.0, 10.0),
                      labelText: 'اسم العميل ',
                      labelStyle:
                      const TextStyle(fontStyle: FontStyle.italic),
                      prefixIcon: const Icon(
                        IconBroken.Search,
                        color: Colors.deepPurple,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: .5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),

                  TextFormField(
                    controller: dateBeginController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Should enter date';
                      }
                      return null;
                    },

                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(
                          18.0, 10.0, 18.0, 10.0),
                      labelText: 'من تاريخ ',
                      labelStyle:
                      const TextStyle(fontStyle: FontStyle.italic),
                      prefixIcon: const Icon(
                        IconBroken.Calendar,
                        color: Colors.deepPurple,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: .5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: .5,
                        ),
                      ),
                    ),

                    onTap: () {
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
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  TextFormField(
                    controller: dateLastController,
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Should enter date';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.fromLTRB(
                          18.0, 10.0, 18.0, 10.0),
                      labelText: 'الى تاريخ ',
                      labelStyle:
                      const TextStyle(fontStyle: FontStyle.italic),
                      prefixIcon: const Icon(
                        IconBroken.Calendar,
                        color: Colors.deepPurple,
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: .5,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15.0),
                        borderSide: const BorderSide(
                          color: Colors.deepPurple,
                          width: .5,
                        ),
                      ),
                    ),
                    onTap: () {
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
                  ),

                  SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            navigateAndFinish(
                                context,  CustomerDebts());
                          } else {
                            // ignore: avoid_print
                            print('NUll');
                          }
                        },
                        child: Text(
                          'معاينه',
                          style: TextStyle(
                            fontSize: 20.0
                          ),
                        )
                    ),
                  )

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
