import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:teknia/Screens/HomeScreens/home_screen.dart';
import 'package:teknia/Shared/Components/reusable_components.dart';
import 'package:teknia/Shared/Styles/icon_broken.dart';

class TypesScreen extends StatefulWidget {
  const TypesScreen({Key? key}) : super(key: key);

  @override
  State<TypesScreen> createState() => _TypesScreenState();
}

class _TypesScreenState extends State<TypesScreen> {
  String? valueChoose;
  List<String> listItem = [
    'مخزنى',
    'خدمى - بنود اعمال',
    'مجمع',
    'منتج تام',
    'متعدد'
  ];

  String? effect;
  List<String> listEffect = [
    'نعم ',
    'لا',
  ];

  String? firstUnit;
  List<String> listFirstUnit = ['قطعه', 'كرتونه', 'متر', 'متر طولى', 'م تكعيب'];

  String? secondUnit;
  List<String> listSecondUnit = [
    'قطعه',
    'كرتونه',
    'متر',
    'متر طولى',
    'م تكعيب'
  ];

  String? sellUnit;
  List<String> listSellUnit = ['قطعه', 'كرتونه', 'متر', 'متر طولى', 'م تكعيب'];
  String? buyUnit;
  List<String> listBuyUnitUnit = [
    'قطعه',
    'كرتونه',
    'متر',
    'متر طولى',
    'م تكعيب'
  ];

  String? storeUnit;
  List<String> listSToreUnit = ['قطعه', 'كرتونه', 'متر', 'متر طولى', 'م تكعيب'];

  String? store;
  List<String> listStore = [
    'المخزن الرئيسي',
    'مخزن اخر',
  ];

  String? activity;
  List<String> listActivity = [
    'نشط',
    'غير نشط',
  ];

  var formKey = GlobalKey<FormState>();

  var typeNameController = TextEditingController();
  var dateController = TextEditingController();
  var costController = TextEditingController();
  var costStoreController = TextEditingController();
  var requestController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navigateAndFinish(context, HomeScreen());
            },
            icon: const Icon(IconBroken.Arrow___Left_2)),
        centerTitle: true,
        title: const Text('ادخل صنف'),
        actions: [
          IconButton(
            icon: const Icon(
              IconBroken.Edit,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //اسم الصنف
                const Text(
                  'اسم الصنف',
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: typeNameController,
                  keyboardType: TextInputType.name,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك ادخل اسم الصنف";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                    hintText: 'اسم الصنف',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    prefixIcon: const Icon(
                      IconBroken.Category,
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
                const SizedBox(
                  height: 10.0,
                ),

                //نوع الصنف

                const Text(
                  'نوع الصنف',
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepPurple, width: 0.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: DropdownButton<String>(
                      hint: const Text(
                        'اختر نوع الصنف',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        IconBroken.Arrow___Down_2,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 20,
                      isExpanded: true,
                      underline: const SizedBox(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      value: valueChoose,
                      onChanged: (newValue) {
                        setState(() {
                          valueChoose = newValue;
                        });
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(
                            valueItem,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                //نوع الوحده الصغرى
                const Text(
                  'اختر الوحده الصغرى',
                  style: TextStyle(fontSize: 15.0),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepPurple, width: 0.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: DropdownButton<String>(
                      hint: const Text(
                        'اختر وحده الصغرى',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        IconBroken.Arrow___Down_2,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 20,
                      isExpanded: true,
                      underline: const SizedBox(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      value: firstUnit,
                      onChanged: (newValue) {
                        setState(() {
                          firstUnit = newValue;
                        });
                      },
                      items: listFirstUnit.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(
                            valueItem,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                //نوع الوحده الكبرى

                const Text(
                  'اختر الوحده الكبرى',
                  style: TextStyle(fontSize: 15.0),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepPurple, width: 0.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: DropdownButton<String>(
                      hint: const Text(
                        'اختر وحده الكبرى',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        IconBroken.Arrow___Down_2,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 20,
                      isExpanded: true,
                      underline: const SizedBox(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      value: secondUnit,
                      onChanged: (newValue) {
                        setState(() {
                          secondUnit = newValue;
                        });
                      },
                      items: listSecondUnit.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(
                            valueItem,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                //تاريخ انتهاء صلاحيه
                const Text(
                  'تاريخ انتهاء صلاحيه المنتج',
                  style: TextStyle(fontSize: 15.0),
                ),

                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: dateController,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Should enter date';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: const BorderSide(
                        color: Colors.deepPurple,
                        width: .5,
                      ),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Task Date',
                    labelStyle: const TextStyle(color: Colors.deepPurple),
                    prefixIcon: const Icon(Icons.calendar_today,
                        size: 20.0, color: Colors.deepPurple),
                  ),
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime.parse('2100-10-10'))
                        .then((value) {
                      dateController.text = DateFormat.yMMMd().format(value!);
                    });
                  },
                ),

                //تكلفه افتتاحى
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'تكلفه افتتاحى',
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: costController,
                  keyboardType: TextInputType.number,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك ادخل تكلفه ";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                    hintText: '1000',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    prefixIcon: const Icon(
                      IconBroken.Discount,
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
                const SizedBox(
                  height: 10.0,
                ),

                //المخازن

                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'المخزن',
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepPurple, width: 0.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: DropdownButton<String>(
                      hint: const Text(
                        'اختر المخزن',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        IconBroken.Arrow___Down_2,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 20,
                      isExpanded: true,
                      underline: const SizedBox(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      value: store,
                      onChanged: (newValue) {
                        setState(() {
                          store = newValue;
                        });
                      },
                      items: listStore.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(
                            valueItem,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                //افتتاحى مخزون

                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'تكلفه افتتاحى المخزون',
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: costStoreController,
                  keyboardType: TextInputType.number,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك ادخل تكلفه افتتاحى مخزون ";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                    hintText: '2000',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    prefixIcon: const Icon(
                      IconBroken.Discount,
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
                const SizedBox(
                  height: 10.0,
                ),

                //حد الطلب
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'حد الطلب',
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: requestController,
                  keyboardType: TextInputType.number,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك ادخل حد الطلب ";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                    hintText: '5',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    prefixIcon: const Icon(
                      IconBroken.Info_Circle,
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

                //وحده البيع الافتراضيه

                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'وحده البيع الافتراضيه',
                  style: TextStyle(fontSize: 15.0),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepPurple, width: 0.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: DropdownButton<String>(
                      hint: const Text(
                        'اختر وحده البيع',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        IconBroken.Arrow___Down_2,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 20,
                      isExpanded: true,
                      underline: const SizedBox(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      value: sellUnit,
                      onChanged: (newValue) {
                        setState(() {
                          sellUnit = newValue;
                        });
                      },
                      items: listSellUnit.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(
                            valueItem,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                // وحده الشراء الافتراضيه

                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'وحده الشراء الافتراضيه',
                  style: TextStyle(fontSize: 15.0),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepPurple, width: 0.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: DropdownButton<String>(
                      hint: const Text(
                        'وحده الشراء الافتراضيه',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        IconBroken.Arrow___Down_2,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 20,
                      isExpanded: true,
                      underline: const SizedBox(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      value: buyUnit,
                      onChanged: (newValue) {
                        setState(() {
                          buyUnit = newValue;
                        });
                      },
                      items: listBuyUnitUnit.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(
                            valueItem,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                // وحده قياس المخزون
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'وحده قياس المخزون',
                  style: TextStyle(fontSize: 15.0),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepPurple, width: 0.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: DropdownButton<String>(
                      hint: const Text(
                        'وحده قياس المخزون',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        IconBroken.Arrow___Down_2,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 20,
                      isExpanded: true,
                      underline: const SizedBox(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      value: storeUnit,
                      onChanged: (newValue) {
                        setState(() {
                          storeUnit = newValue;
                        });
                      },
                      items: listSToreUnit.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(
                            valueItem,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),

                //حاله الصنف
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'حاله الصنف',
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepPurple, width: 0.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: DropdownButton<String>(
                      hint: const Text(
                        'حاله الصنف',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        IconBroken.Arrow___Down_2,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 20,
                      isExpanded: true,
                      underline: const SizedBox(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      value: activity,
                      onChanged: (newValue) {
                        setState(() {
                          activity = newValue;
                        });
                      },
                      items: listActivity.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(
                            valueItem,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10.0,
                ),

                //التاثير على الحسابات العامه
                const Text(
                  ' التاثير على الحسابات العامه',
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Center(
                  child: Container(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Colors.deepPurple, width: 0.5),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: DropdownButton<String>(
                      hint: const Text(
                        'التاثير',
                        style: TextStyle(fontSize: 15.0),
                      ),
                      dropdownColor: Colors.white,
                      icon: const Icon(
                        IconBroken.Arrow___Down_2,
                        color: Colors.deepPurple,
                      ),
                      iconSize: 20,
                      isExpanded: true,
                      underline: const SizedBox(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                      ),
                      value: effect,
                      onChanged: (newValue) {
                        setState(() {
                          effect = newValue;
                        });
                      },
                      items: listEffect.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(
                            valueItem,
                            style: const TextStyle(fontSize: 15.0),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        child: const Text(
                          'ادخال صنف جديد',
                        ),
                        onPressed: () {
                          if (formKey.currentState!.validate()) {}
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 10.0,
                    ),
                    OutlinedButton(
                      child: const Text(
                        'حفظ',
                      ),
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
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
}
