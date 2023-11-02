
import 'package:bpp_shop/screens/sign_up_page_2.dart';
import 'package:flutter/material.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../widgets/CustomClipper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: ResizeTest());
  }
}

class ResizeTest extends StatefulWidget {
  const ResizeTest({super.key});

  @override
  State<ResizeTest> createState() => _ResizeTestState();
}

class _ResizeTestState extends State<ResizeTest> {
  final List<String> items = [
    'Dhaka',
    'Shylet',
    'Ctg',
    'Khulna',
  ];
  final List<String> upozila = [
    'a',
    'e',
    'i',
    'o',
    'u',
  ];
  final List<String> area = [
    'aftabnagar',
    'bonosree',
    'khilgaon',
    'rampura',
    'nakhalpara',
  ];

  String? selectedValue;
  String? selectedUpozila;
  String? selectedArea;

  //Validation:
  var _formKey = GlobalKey<FormState>();
  bool? isValidate = false;
  String? invalidFirstNName;

  //final namePattern = RegExp(r'^[a-zA-Z\s]*$');
  String? number;
  TextEditingController numberController = TextEditingController();

  //Live:
  TextEditingController _firstNameController = TextEditingController();
  String firstName = '';
  String lastName = '';
  String email = '';
  String phone = '';
  String shopName = '';
  String cityDistrict = '';
  String upoZila = '';
  String areaWord = '';

  String firstNameError = '';
  String lastNameError = '';
  String emailError = '';
  String phoneError = '';
  String shopNameError = '';
  String cityDistrictError = '';
  String upoZilaError = '';
  String areaWordError = '';

  // double keyboardHeight = 0;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   // Listen for keyboard changes
  //   WidgetsBinding.instance!.addPostFrameCallback((_) {
  //     MediaQuery.of(context).viewInsets.addListener(() {
  //       setState(() {
  //         keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
  //       });
  //     });
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return Scaffold(
      //resizeToAvoidBottomInset:true,
      backgroundColor: Color(0xfff3f3f3),
      body: Stack(children: [
        ClipPath(
          clipper: CustomClipperImage(),
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffffffff)),
        ),
        // physics:  ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
        Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                height: _height * (20 / 600),
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                'BPPSHOP',
                style: TextStyle(
                    fontSize: _height * (16 / 600) + _width * (12 / 360),
                    fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 20,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(
                    horizontal: _width * (8 / 360),
                    vertical: _height * (2 / 600)),
                padding: EdgeInsets.symmetric(
                    horizontal: _width / 36, vertical: _height / 60),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.blueGrey,
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Become a Seller ",
                          style: TextStyle(
                              fontSize: _width * 0.06,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Text(
                          'Welcome to seller registration',
                          style: TextStyle(
                              fontSize: _width * 0.045,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Divider(
                            color: Colors.black,
                            //thickness: 3,
                            indent: _width * (10 / 360),
                            endIndent: _width * (10 / 360),
                            height: _height * 0.02),
                      ),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: EdgeInsets.all(_width / 120),
                            child: Text(
                              'Seller Info',
                              style: TextStyle(
                                  fontSize: _width * 0.04,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),

                      Expanded(
                        flex:2,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * (2 / 360),
                              vertical: _height * (2 / 600)),
                          decoration: BoxDecoration(
                              //color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Color(0xFF069DD8), width: 2)),
                          height: _height * (26 / 600),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    //color: Colors.red,
                                    border: Border(
                                        right: BorderSide(
                                      color: Color(0xFF069DD8),
                                      width: _width / 180,
                                    )),
                                  ),
                                  child: Text("First Name"),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  // BoxDecoration(
                                  //   borderRadius: BorderRadius.only(
                                  //     topRight: Radius.circular(10),
                                  //     bottomRight: Radius.circular(10),
                                  //   ),
                                  //   border: Border.all(color: Colors.blue),
                                  // ),

                                  child: TextFormField(
                                    // scrollPadding: EdgeInsets.symmetric(
                                    //     vertical: MediaQuery.of(context).viewInsets.bottom),

                                    textInputAction: TextInputAction.next,
                                    //focusNode: _firstNameFocus,
                                    style: TextStyle(),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: _width * 0.02,
                                          vertical: _height * 0.01),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        firstName = value;
                                        firstNameError = '';
                                      });

                                      _validateFirstName();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // if (firstNameError.isNotEmpty) SizedBox(height:_height*0.01 ),
                      if (firstNameError.isNotEmpty)
                        Expanded(
                          flex:1,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                firstNameError!,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: _width / 26,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),

                      Expanded(
                        flex:2,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * (2 / 360),
                              vertical: _height * (2 / 600)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Color(0xFF069DD8), width: 2)),
                          height: _height * (26 / 600),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                      color: Color(0xFF069DD8),
                                      width: 2,
                                    )),
                                  ),
                                  child: Text("Last Name"),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  child: TextFormField(
                                    // scrollPadding: EdgeInsets.symmetric(
                                    //     vertical: MediaQuery.of(context).viewInsets.bottom),
                                    textInputAction: TextInputAction.next,
                                    //focusNode: _lastNameFocus,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: _width * 0.02,
                                          vertical: _height * 0.01),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        lastName = value;
                                        lastNameError = '';
                                      });

                                      _validateLastName();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // if (lastNameError.isNotEmpty) SizedBox(height:_height*0.01 ),
                      if (lastNameError.isNotEmpty)
                        Expanded(
                          flex:1,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                lastNameError!,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: _width / 26,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),

                      Expanded(
                        flex:2,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * (2 / 360),
                              vertical: _height * (2 / 600)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Color(0xFF069DD8), width: 2)),
                          height: _height * (26 / 600),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                      color: Color(0xFF069DD8),
                                      width: 2,
                                    )),
                                  ),
                                  child: Text("Email address"),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  child: TextFormField(
                                    // scrollPadding: EdgeInsets.symmetric(
                                    //     vertical: MediaQuery.of(context).viewInsets.bottom),
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: _width * 0.02,
                                          vertical: _height * 0.01),
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        email = value;
                                        emailError = '';
                                      });
                                      _validateEmailFields();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // if (emailError.isNotEmpty) SizedBox(height:_height*0.01 ),
                      if (emailError.isNotEmpty)
                        Expanded(
                          flex:1,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                emailError!,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: _width / 26,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      // Text(emailError, style: TextStyle(color: Colors.red)),
                      Expanded(
                        flex:2,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * (2 / 360),
                              vertical: _height * (2 / 600)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border:
                                  Border.all(color: Color(0xFF069DD8), width: 2)),
                          height: _height * (26 / 600),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                      color: Color(0xFF069DD8),
                                      width: 2,
                                    )),
                                  ),
                                  child: Text("Phone Number"),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  child: TextFormField(
                                    // scrollPadding: EdgeInsets.symmetric(
                                    //     vertical: MediaQuery.of(context).viewInsets.bottom),
                                    textInputAction: TextInputAction.next,
                                    controller: numberController,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    onChanged: (value) {
                                      setState(() {
                                        phone = value;
                                        phoneError = '';
                                      });
                                      _validatePhoneFields();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // if (phoneError.isNotEmpty) SizedBox(height:_height*0.01 ),
                      if (phoneError.isNotEmpty)
                        Expanded(
                          flex:1,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                phoneError!,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: _width / 26,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),
                      // Text(phoneError, style: TextStyle(color: Colors.red)),

                      Expanded(
                        flex:1,
                        child: Divider(
                          color: Colors.black,
                          thickness: 3,
                          indent: 8,
                          endIndent: 8,
                          height: _height * 0.01,
                        ),
                      ),

                      Expanded(
                        flex:2,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * (2 / 360),
                              vertical: _height * (2 / 600)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xFF069DD8), width: 2)),
                          height: _height * (26 / 600),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                      color: Color(0xFF069DD8),
                                      width: 2,
                                    )),
                                  ),
                                  child: Text("Shop name "),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  child: TextFormField(
                                    // scrollPadding: EdgeInsets.symmetric(
                                    //     vertical: MediaQuery.of(context).viewInsets.bottom),
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                      ),
                                    ),
                                    onChanged: (value) {
                                      setState(() {
                                        shopName = value;
                                        shopNameError = '';
                                      });
                                      _validateShopName();
                                    },
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // if (shopNameError.isNotEmpty) SizedBox(height:_height*0.01 ),
                      if (shopNameError.isNotEmpty)
                        Expanded(
                          flex:1,
                          child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                shopNameError,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize: _width / 26,
                                    fontWeight: FontWeight.bold),
                              )),
                        ),

                      Expanded(
                        flex:2,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * (2 / 360),
                              vertical: _height * (2 / 600)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xFF069DD8), width: 2)),
                          height: _height * (26 / 600),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                      color: Color(0xFF069DD8),
                                      width: 2,
                                    )),
                                  ),
                                  child: Text("District/City"),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        '',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: items
                                          .map((String item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedValue,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedValue = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        flex:2,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * (2 / 360),
                              vertical: _height * (2 / 600)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xFF069DD8), width: 2)),
                          height: _height * (26 / 600),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                      color: Color(0xFF069DD8),
                                      width: 2,
                                    )),
                                  ),
                                  child: Text("Upozilla/Thana"),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        '',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: upozila
                                          .map((String item) =>
                                              DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(
                                                  item,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedUpozila,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedUpozila = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      Expanded(
                        flex:2,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * (2 / 360),
                              vertical: _height * (2 / 600)),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  color: Color(0xFF069DD8), width: 2)),
                          height: _height * (26 / 600),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    border: Border(
                                        right: BorderSide(
                                      color: Color(0xFF069DD8),
                                      width: 2,
                                    )),
                                  ),
                                  child: Text("Area/Word/Union"),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: _width * (10 / 360),
                                      vertical: _height * (5 / 600)),
                                  height: _height * (26 / 600),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(10),
                                        bottomRight: Radius.circular(10)),
                                  ),
                                  child: DropdownButtonHideUnderline(
                                    child: DropdownButton2<String>(
                                      isExpanded: true,
                                      hint: Text(
                                        '',
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Theme.of(context).hintColor,
                                        ),
                                      ),
                                      items: area
                                          .map((String area) =>
                                              DropdownMenuItem<String>(
                                                value: area,
                                                child: Text(
                                                  area,
                                                  style: const TextStyle(
                                                    fontSize: 14,
                                                  ),
                                                ),
                                              ))
                                          .toList(),
                                      value: selectedArea,
                                      onChanged: (String? value) {
                                        setState(() {
                                          selectedArea = value;
                                        });
                                      },
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      //**********Shop Adress ***********
                      Expanded(
                        flex:2,
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: _width * (2 / 360),
                              vertical: _height * (2 / 600)),
                          // padding: EdgeInsets.symmetric(
                          //     horizontal: _width * (10 / 360),
                          //     vertical: _height * (5/600)),

                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Color(0xFF069DD8),
                              )),

                          child: TextFormField(
                            // scrollPadding: EdgeInsets.symmetric(
                            //     vertical: MediaQuery.of(context).viewInsets.bottom),

                            maxLines: 3,
                            decoration: InputDecoration(
                                hintMaxLines: 3,
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: _width * (10 / 360),
                                    vertical: _height * (5 / 600)),
                                hintText: "Shop address",
                                //labelText: 'Password',
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.blue,
                                    )),
                                errorBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.red,
                                    ))),
                          ),
                        ),
                      ),

                      Expanded(
                        flex:1,
                        child: SizedBox(
                          height: _height * 0.02,
                        ),
                      ),
                      //****************************************
                      Expanded(
                        flex:2,
                        child: MaterialButton(
                          color: Colors.blue,
                          minWidth: double.infinity,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          onPressed: () {
                            _validateFirstName();
                            _validateLastName();
                            _validateEmailFields();
                            _validatePhoneFields();
                            _validateShopName();

                            if (_formKey.currentState!.validate()) {}
                          },
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.w700),
                          ),
                          height: _height * 0.045,
                        ),
                      ),

                      Expanded(
                        flex:1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Already have an account ",
                              style: TextStyle(
                                  fontSize: _height * 0.02,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                            InkWell(
                                onTap: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => SignUpPage2()));
                                },
                                child: Text(
                                  'Login',
                                  style: TextStyle(
                                      fontSize: _height * 0.02,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.blue,
                                      decoration: TextDecoration.underline),
                                ))
                          ],
                        ),
                      ),
                      // SizedBox(
                      //     height: MediaQuery.of(context).viewInsets.bottom),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ]),
    );
  }

  //######## Method Section ########

  bool _isValidFirstName(String firstName) {
    final namePattern = RegExp(r'^[A-Za-z\s]{1,50}$');

    return namePattern.hasMatch(firstName);
  }

  void _validateFirstName() {
    if (firstName.isEmpty) {
      setState(() {
        firstNameError = 'Please enter your name';
      });
    } else if (!_isValidFirstName(firstName)) {
      setState(() {
        firstNameError = 'Please enter valid name';
      });
    }
  }

  bool _isValidLastName(String lastName) {
    final namePattern = RegExp(r'^[A-Za-z\s]{1,50}$');

    return namePattern.hasMatch(lastName);
  }

  void _validateLastName() {
    if (lastName.isEmpty) {
      setState(() {
        lastNameError = 'Please enter your name';
      });
    } else if (!_isValidLastName(lastName)) {
      setState(() {
        lastNameError = 'Please enter a valid name';
      });
    }
  }

  bool _isValidEmail(String email) {
    final RegExp emailRegex =
        RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return emailRegex.hasMatch(email);
  }

  void _validateEmailFields() {
    if (email.isEmpty) {
      setState(() {
        emailError = 'Please enter your email address';
      });
    } else if (!_isValidEmail(email)) {
      setState(() {
        emailError = 'Please enter a valid email address';
      });
    }
  }

  bool _isValidPhone(String phone) {
    // Define a regex pattern for phone number validation (U.S. format).
    final phonePattern = RegExp(r'^\d{11}$');

    // Use the hasMatch method to check if the phone number matches the pattern.
    return phonePattern.hasMatch(phone);
  }

  void _validatePhoneFields() {
    if (phone.isEmpty) {
      setState(() {
        phoneError = 'Please enter your phone number';
      });
    } else if (!_isValidPhone(phone)) {
      setState(() {
        phoneError = 'Please enter a valid email address';
      });
    }
  }

  bool _isValidShopName(String shopName) {
    final namePattern = RegExp(r'^[A-Za-z\s]{3,50}$');

    return namePattern.hasMatch(shopName);
  }

  void _validateShopName() {
    if (shopName.isEmpty) {
      setState(() {
        shopNameError = 'Please enter your name';
      });
    } else if (!_isValidFirstName(firstName)) {
      setState(() {
        shopNameError = 'Please enter your name';
      });
    }
  }
}
