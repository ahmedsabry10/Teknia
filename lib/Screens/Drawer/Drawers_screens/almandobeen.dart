import 'package:flutter/material.dart';
import 'package:teknia/Data/Shared/Components/reusable_components.dart';
import 'package:teknia/Data/Shared/Styles/icon_broken.dart';
import 'package:teknia/Screens/HomeScreens/home_screen.dart';


class RepresentativeScreen extends StatefulWidget {
  const RepresentativeScreen({Key? key}) : super(key: key);

  @override
  State<RepresentativeScreen> createState() => _RepresentativeScreenState();
}

class _RepresentativeScreenState extends State<RepresentativeScreen> {
  String? type;
  List<String> listType = [
    'نقدى',
    'تجارى',
  ];

  String? effect;
  List<String> listEffect = [
    'نعم ',
    'لا',
  ];

  String? tasnif;
  List<String> listTasnif = ['بيع', 'شراء', 'بيع و شراء'];

  String? activity;
  List<String> listActivity = [
    'نشط',
    'غير نشط',
  ];

  String? typeS;
  List<String> listTypeS = [
    'داخلى',
    'خارجى',
  ];

  String? store;
  List<String> listStore = [
    'المخزن الرئيسي',
    'مخزن اخر',
  ];

  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController(); //الاسم
  var cityController = TextEditingController(); // مدينه
  var governorateController = TextEditingController(); // محافظه
  var debtorController = TextEditingController(); //مدين
  var creditorController = TextEditingController(); //دائن
  var placeController = TextEditingController(); //منطقه
  var phoneController = TextEditingController();
  var supplierController = TextEditingController(); //هاتف

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              navigateAndFinish(context,  HomeScreen());
            },
            icon: const Icon(IconBroken.Arrow___Left_2)),
        centerTitle: true,
        title: const Text('ادخل مندوب جديد'),
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
                //اسم المندوب
                const Text(
                  'اسم المندوب',
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.name,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك ادخل اسم المندوب";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                    hintText: 'اسم المندوب',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    prefixIcon: const Icon(
                      IconBroken.Profile,
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

                const Text(
                  'الفرع',
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
                const SizedBox(
                  height: 10.0,
                ),

                //نوع المندوب
                const Text(
                  'نوع المندوب',
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
                        ' نوع المندوب',
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
                      value: typeS,
                      onChanged: (newValue) {
                        setState(() {
                          typeS = newValue;
                        });
                      },
                      items: listTypeS.map((valueItem) {
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

                //تصنيف المندوب
                const Text(
                  'تصنيف المندوب',
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
                        ' تصنيف المندوب',
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
                      value: tasnif,
                      onChanged: (newValue) {
                        setState(() {
                          tasnif = newValue;
                        });
                      },
                      items: listTasnif.map((valueItem) {
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

                // المشرف
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'المشرف ',
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: cityController,
                  keyboardType: TextInputType.name,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك ادخل اسم المشرف";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                    hintText: ' المشرف',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    prefixIcon: const Icon(
                      Icons.man,
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

                //المنطقه

                const Text(
                  'المنطقه',
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: placeController,
                  keyboardType: TextInputType.name,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك ادخل اسم المنطقه";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                    hintText: ' المنطقه',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    prefixIcon: const Icon(
                      Icons.place_outlined,
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

                // رقم الهاتف
                const Text(
                  'رقم الهاتف',
                  style: TextStyle(fontSize: 15.0),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "من فضلك ادخل رقم الهاتف";
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    contentPadding:
                        const EdgeInsets.fromLTRB(18.0, 10.0, 18.0, 10.0),
                    hintText: ' 0123456789',
                    hintStyle: const TextStyle(
                      fontStyle: FontStyle.italic,
                    ),
                    prefixIcon: const Icon(
                      IconBroken.Call,
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

                //حاله المندوب
                const Text(
                  'حاله المندوب',
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
                        'حاله المندوب',
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
                          'ادخال مندوب جديد',
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
