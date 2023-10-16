import 'package:bpp_shop/screens/demo_seller.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_colorpicker/flutter_colorpicker.dart';

import '../widgets/CustomClipper.dart';

class HomeDemo extends StatefulWidget {
  const HomeDemo({super.key});

  @override
  State<HomeDemo> createState() => _HomeDemoState();
}

class _HomeDemoState extends State<HomeDemo> {
  _focusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  final FocusNode _phoneFocus = FocusNode();
  final FocusNode _passWordFocus = FocusNode();

  String phone = '';
  String phoneError = '';
  String password = '';
  String passwordError = '';

  bool _isValidPhone(String phone) {
    // Define a regex pattern for phone number validation (U.S. format).
    final phonePattern = RegExp(r'^(01\d{9}|(?:\+880|880)\d{10})$');

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
        phoneError = 'Must be Starts with 01 or +880 ';
      });
    }
  }

  bool _isValidPassword(String password) {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  void _validatePasswordFields() {
    if (password!.isEmpty) {
      setState(() {
        passwordError = 'Password Required';
      });
    } else if (!_isValidPassword(password!)) {
      setState(() {
        passwordError = 'Uppercase,lowercase,number & special char must';
      });
    }
  }

  String? validateAge(String? age) {
    if (age == null || age.isEmpty) {
      return "*required";
    } else if (age.length > 3) {
      return "Invalid age";
    }
    return null;
  }

  String? validateA(String? age) {
    if (age == null || age.isEmpty) {
      setState(() {
        phoneError = 'Please enter your phone number';
      });
    } else if (age.length > 3) {
      setState(() {
        phoneError = 'Please enter your phone number';
      });
    }
    return null;
  }

  bool? ischecked = false;
  var _formKey = GlobalKey<FormState>();
  bool value = false;
  bool isObseure = false;
  String? number;
  bool isValidet = false;

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xfff3f3f3),
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            ClipPath(
              clipper: CustomClipperImage(),
              child: Container(
                  height: _height, width: _width, color: Color(0xffffffff)),
              //
            ),

            SingleChildScrollView(
              physics:
              ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minWidth: MediaQuery.of(context).size.width,
                  minHeight: MediaQuery.of(context).size.height,
                ),
                child: IntrinsicHeight(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: _height * (70 / 600),
                      ),
                      // Text(
                      //   'BPPPSHOP',
                      //   style: TextStyle(
                      //       fontSize: _width * 0.1, fontWeight: FontWeight.bold),
                      // ),
                      Image.asset(
                        'images/bpp shop logo 01.896abfc13589245ecc62.png',
                        height: _height * (30 / 600),
                        // width: 140,
                      ),
                      SizedBox(height: _height / 120),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        //margin: EdgeInsets.symmetric(vertical: _hight*0.05, horizontal: _width*0.05),
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: _width * 0.03, vertical: _height * 0.03),
                          child: Column(
                            children: [
                              Text('Sign In ',
                                  style: TextStyle(
                                      fontSize: _width * 0.07,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xff334257))),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 120,
                              ),
                              Text(
                                'Wellcome to seller login',
                                style: TextStyle(
                                    fontSize: _width * 0.05,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xff334257)),
                              ),

                              Divider(
                                color: Color(0xff565656),
                                //thickness: 3,
                                indent: 10,
                                endIndent: 10,
                                height: 20,
                              ),
                              Form(
                                  key: _formKey,
                                  child: Column(
                                    children: [
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Mobile',
                                          style: TextStyle(
                                              fontSize: _width * 0.04,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff334257)),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height / 120,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: _width * (2 / 360),
                                            vertical: _height * (2 / 600)),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: phoneError.isEmpty
                                                    ? Color(0xFF069DD8)
                                                    : Colors.red,
                                                width: 2)),
                                        height: _height * (35 / 600),
                                        child: TextFormField(
                                          // controller: _phoneController,
                                          focusNode: _phoneFocus,
                                          keyboardType: TextInputType.phone,
                                          textInputAction: TextInputAction.next,
                                          onEditingComplete: () {
                                            _focusChange(
                                                context, _phoneFocus, _passWordFocus);
                                          },
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xffe0e0e0),
                                            hintText: " Enter Mobile  ",
                                            hintStyle: TextStyle(
                                              fontSize: _width * 0.015 +_height*0.010,
                                              fontWeight: FontWeight.bold,
                                            ),
                                            //border: BorderRadius.circular(10),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              phone = value;
                                              phoneError = '';
                                            });
                                            _validatePhoneFields();
                                          },
                                        ),
                                      ),
                                      if (phoneError.isNotEmpty)
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              phoneError!,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: _width / 26,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      // TextFormField(
                                      //   //maxLength: (_width*0.9).toInt(),
                                      //   autovalidateMode:
                                      //       AutovalidateMode.onUserInteraction,
                                      //   controller: phoneController,
                                      //
                                      //   decoration: InputDecoration(
                                      //       contentPadding: EdgeInsets.symmetric(
                                      //           horizontal: _width * 0.02,
                                      //           vertical: _height * 0.01),
                                      //       filled: true,
                                      //       fillColor: Color(0xffe0e0e0),
                                      //       hintText: " Enter Mobile Number ",
                                      //       enabledBorder: OutlineInputBorder(
                                      //           borderRadius:
                                      //               BorderRadius.circular(10),
                                      //           borderSide: BorderSide(
                                      //             color: Color(0xff059dd8),
                                      //           )),
                                      //       focusedBorder: OutlineInputBorder(
                                      //           borderRadius:
                                      //               BorderRadius.circular(10),
                                      //           borderSide: BorderSide(
                                      //             color: Colors.blue,
                                      //           )),
                                      //       errorBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.circular(10),
                                      //         borderSide: BorderSide(
                                      //           color: Colors.red,
                                      //         ),
                                      //       ),
                                      //       focusedErrorBorder: OutlineInputBorder(
                                      //           borderRadius:
                                      //               BorderRadius.circular(10),
                                      //           borderSide: BorderSide(
                                      //             color: Colors.red,
                                      //           )),
                                      //     errorStyle: TextStyle(
                                      //       color: Colors.red,
                                      //       fontSize: _width * 0.035,
                                      //       fontWeight: FontWeight
                                      //           .w400, // Customize the error text color
                                      //     ),
                                      //   ),
                                      //
                                      //   keyboardType: TextInputType.number,
                                      //   textInputAction: TextInputAction.next,
                                      //   validator: (value){
                                      //     final phonePattern = RegExp(r'^(01\d{9}|(?:\+880|880)\d{10})$');
                                      //     if (value!.isEmpty) {
                                      //       // setState(() {
                                      //       //   phoneError = 'Please enter your phone number';
                                      //       // });
                                      //       return "Please enter your phone number";
                                      //     }
                                      //     else if (phonePattern.hasMatch(value)) {
                                      //       // setState(() {
                                      //       //   phoneError = 'Please enter a valid phone number';
                                      //       // });
                                      //       return "Please enter a valid phone number";
                                      //
                                      //     }
                                      //     return null;
                                      //   },
                                      //   onEditingComplete: () {
                                      //     if (_formKey.currentState!.validate()) {
                                      //       //print("Successfull");
                                      //     } else {}
                                      //    },
                                      //   onChanged: (value) {
                                      //       setState(() {
                                      //         phone = value;
                                      //         phoneError = '';
                                      //       });
                                      //      //_validatePhoneFields(phone);
                                      //   },
                                      //   // validator: validateA,

                                      // ),
                                      // Padding(
                                      //   padding: EdgeInsets.symmetric(
                                      //     horizontal: _width * (9 / 360),
                                      //     vertical: _height * (3 / 600),
                                      //   ),
                                      //   child: Align(
                                      //       alignment: Alignment.centerLeft,
                                      //       child: Text(phoneError,
                                      //           style: TextStyle(color: Colors.red))),
                                      // ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height / 80,
                                      ),
                                      Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          'Password',
                                          style: TextStyle(
                                              fontSize: _width * 0.04,
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xff334257)),
                                        ),
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height / 100,
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                            horizontal: _width * (2 / 360),
                                            vertical: _height * (2 / 600)),
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            border: Border.all(
                                                color: passwordError.isEmpty
                                                    ? Color(0xFF069DD8)
                                                    : Colors.red,
                                                width: 2)),
                                        height: _height * (35 / 600),
                                        child: TextFormField(
                                          // controller: _phoneController,
                                          focusNode: _passWordFocus,
                                          autovalidateMode:
                                              AutovalidateMode.onUserInteraction,
                                          keyboardType: TextInputType.visiblePassword,
                                          textInputAction: TextInputAction.done,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Color(0xffe0e0e0),
                                            hintText: " Enter Password",
                                            hintStyle: TextStyle(
                                              fontSize: _width * 0.015 +_height*0.010,
                                              fontWeight: FontWeight.bold,

                                            ),
                                            border: OutlineInputBorder(
                                              borderRadius: BorderRadius.circular(10),
                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                          onChanged: (value) {
                                            setState(() {
                                              password = value;
                                              passwordError = '';
                                            });
                                            _validatePasswordFields();
                                          },
                                          onEditingComplete: () {
                                            _passWordFocus.unfocus();
                                          },
                                        ),
                                      ),
                                      if (passwordError.isNotEmpty)
                                        Align(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              passwordError!,
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontSize: _width / 26,
                                                  fontWeight: FontWeight.bold),
                                            )),
                                      // TextFormField(
                                      //   controller: passwordController,
                                      //   decoration: InputDecoration(
                                      //     filled: true
                                      //     fillColor: Color(0xffe0e0e0),
                                      //     contentPadding: EdgeInsets.symmetric(
                                      //         horizontal: _width * 0.02,
                                      //         vertical: _height * 0.01),
                                      //     hintText: " Enter Password ",
                                      //     enabledBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.circular(10),
                                      //         borderSide: BorderSide(
                                      //           color: Color(0xff059dd8),
                                      //         )),
                                      //     focusedBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.circular(10),
                                      //         borderSide: BorderSide(
                                      //           color: Colors.blue,
                                      //         )),
                                      //     errorBorder: OutlineInputBorder(
                                      //       borderRadius: BorderRadius.circular(10),
                                      //       borderSide: BorderSide(
                                      //         color: Colors.red,
                                      //       ),
                                      //     ),
                                      //     focusedErrorBorder: OutlineInputBorder(
                                      //         borderRadius: BorderRadius.circular(10),
                                      //         borderSide: BorderSide(
                                      //           color: Colors.red,
                                      //         )),
                                      //     errorStyle: TextStyle(
                                      //       color: Colors.red,
                                      //       fontSize: _width * 0.035,
                                      //       fontWeight: FontWeight
                                      //           .w400, // Customize the error text color
                                      //     ),
                                      //   ),
                                      //   keyboardType: TextInputType.visiblePassword,
                                      //   //validator: validateA,
                                      //   validator: (value) {
                                      //     if (value == null || value.isEmpty) {
                                      //        return "This filed must not be empty";
                                      //     }
                                      //     if (value.length < 8) {
                                      //       return " Password must be minimum 8 digit";
                                      //     }
                                      //     return null;
                                      //   },
                                      //   textInputAction: TextInputAction.done,
                                      //   onFieldSubmitted: (value) {
                                      //     _passWordFocus.unfocus();
                                      //   },
                                      //   onEditingComplete: () {
                                      //     if (_formKey.currentState!.validate()) {
                                      //       //print("Successfull");
                                      //     } else {}
                                      //   },
                                      // ),
                                    ],
                                  )),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 120,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          value: ischecked,
                                          onChanged: (value) {
                                            setState(() {
                                              ischecked = value;
                                            });
                                          }),
                                      Text(
                                        'Remember Me',
                                        style: TextStyle(
                                            fontSize: _width * 0.04,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xffb2b2b2)),
                                      ),
                                    ],
                                  ),
                                  TextButton(
                                      onPressed: () {},
                                      child: Text(
                                        'Forgot Password?',
                                        style: TextStyle(
                                            fontSize: _width * 0.04,
                                            fontWeight: FontWeight.bold,
                                            color: Color(0xff4199d9)),
                                      ))
                                ],
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height / 20,
                              ),

                              MaterialButton(
                                  color: Color(0xff0477cd),
                                  minWidth: _width * 1,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10)),
                                  onPressed: () {
                                    _validatePhoneFields();
                                    _validatePasswordFields();
                                    // if (_formKey.currentState!.validate()) {
                                    //   Navigator.of(context).push(MaterialPageRoute(
                                    //       builder: (context) => DemoSeller()));
                                    // }
                                    if (phoneError.isEmpty && passwordError.isEmpty) {
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => DemoSeller()));
                                    } else {}
                                  },
                                  child: Text(
                                    "Sign in",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                  height: _height * 0.05),

                              SizedBox(
                                height: MediaQuery.of(context).size.height / 80,
                              ),
                              // RichText(
                              //   text: const TextSpan(
                              //     text: "Become a seller ",
                              //     style:
                              //         TextStyle(fontSize: 14, color: Colors.black54),
                              //     children: <TextSpan>[
                              //       TextSpan(
                              //           text: 'Sign Up',
                              //           style: TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.blue,
                              //               fontSize: 16)),
                              //     ],
                              //   ),
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Become a seller",
                                    style: TextStyle(
                                        fontSize: _width * 0.045,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width / 120,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(MaterialPageRoute(
                                            builder: (context) => DemoSeller()));
                                      },
                                      child: Text(
                                        'Sign Up',
                                        style: TextStyle(
                                            fontSize: _width * 0.055,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            decoration: TextDecoration.underline),
                                      ))
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Copy Main Design
//Container(
//               height: 500,
//               width: MediaQuery.of(context).size.width,
//               child: Padding(
//                 padding: const EdgeInsets.all(10),
//                 child: Card(
//                   color: Colors.grey,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(20),
//                   ),
//                   elevation: 5,
//                   child: Center(
//                     child: Container(
//                       //height:
//                       width: double.infinity,
//
//                       color: Colors.grey,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         //crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           Text(
//                             'BPPSHOPAC',
//                             style: TextStyle(
//                                 fontSize: 30,
//                                 fontWeight: FontWeight.bold,
//                                 color: Colors.black),
//                           ),
//                           SizedBox(
//                             height: 10,
//                           ),
//                           Container(
//                             height: 530,
//                             width: 450,
//                             //color: Colors.white,
//                             decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(10),
//                               color: Colors.white,
//                             ),
//                             alignment: Alignment.center,
//                             margin: EdgeInsets.all(5),
//                             child: Padding(
//                               padding: EdgeInsets.all(15),
//                               child: Column(
//                                 children: [
//                                   Text('Sign In ',
//                                       style: TextStyle(
//                                           fontSize: 23,
//                                           fontWeight: FontWeight.bold,
//                                           color: Colors.black)),
//                                   SizedBox(
//                                     height: 5,
//                                   ),
//                                   Text(
//                                     'Wellcome to seller login',
//                                     style:
//                                     TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
//                                   ),
//                                   // SizedBox(
//                                   //   height: 5,
//                                   // ),
//                                   Divider(
//                                     color: Colors.black,
//                                     //thickness: 3,
//                                     indent: 10,
//                                     endIndent: 10,
//                                     height: 30,
//                                   ),
//                                   Form(
//                                       key: _formKey,
//                                       child: Column(
//                                         children: [
//                                           Align(
//                                             alignment: Alignment.topLeft,
//                                             child: Text('Mobile'),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           TextFormField(
//                                             controller: phoneController,
//                                             textInputAction: TextInputAction.next,
//                                             decoration: InputDecoration(
//                                                 contentPadding:
//                                                 EdgeInsets.symmetric(horizontal: 7),
//                                                 filled: true,
//                                                 fillColor: Colors.white70,
//                                                 hintText: " Enter Mobile Number ",
//                                                 //labelText: 'Mobile Number',
//                                                 enabledBorder: OutlineInputBorder(
//                                                     borderRadius: BorderRadius.circular(10),
//                                                     borderSide: BorderSide(
//                                                       color: Colors.blue,
//                                                     )),
//                                                 focusedBorder: OutlineInputBorder(
//                                                     borderRadius: BorderRadius.circular(10),
//                                                     borderSide: BorderSide(
//                                                       color: Colors.blue,
//                                                     )),
//                                                 errorBorder: OutlineInputBorder(
//                                                   borderRadius: BorderRadius.circular(10),
//                                                   borderSide: BorderSide(
//                                                     color: Colors.red,
//                                                   ),
//                                                 ),
//                                                 focusedErrorBorder: OutlineInputBorder(
//                                                     borderRadius: BorderRadius.circular(10),
//                                                     borderSide: BorderSide(
//                                                       color: Colors.red,
//                                                     ))),
//                                             keyboardType: TextInputType.number,
//                                             obscureText: isObseure,
//                                             // onFieldSubmitted: (value) {
//                                             //   setState(() {
//                                             //     mobileNumber = value;
//                                             //   });
//                                             // },
//
//                                             validator: (value) {
//                                               if (value!.isEmpty) {
//                                                 return "Number can't be empty";
//                                               }
//                                               if (value.length < 11) {
//                                                 return "Invalid Mobile Number ";
//                                               }
//                                             },
//                                             onEditingComplete: () {
//                                               if (_formKey.currentState!.validate()) {
//                                                 print("Successfull");
//                                               } else {}
//                                             },
//
//                                           ),
//                                           SizedBox(
//                                             height: 30,
//                                           ),
//                                           Align(
//                                             alignment: Alignment.topLeft,
//                                             child: Text('Password'),
//                                           ),
//                                           SizedBox(
//                                             height: 5,
//                                           ),
//                                           TextFormField(
//                                             controller: passwordController,
//                                             decoration: InputDecoration(
//                                                 filled: true,
//                                                 fillColor: Colors.white70,
//                                                 contentPadding:
//                                                 EdgeInsets.symmetric(horizontal: 7),
//                                                 hintText: " Enter Password ",
//                                                 //labelText: 'Password',
//                                                 enabledBorder: OutlineInputBorder(
//                                                     borderRadius: BorderRadius.circular(10),
//                                                     borderSide: BorderSide(
//                                                       color: Colors.blue,
//                                                     )),
//                                                 focusedBorder: OutlineInputBorder(
//                                                     borderRadius: BorderRadius.circular(10),
//                                                     borderSide: BorderSide(
//                                                       color: Colors.blue,
//                                                     )),
//                                                 errorBorder: OutlineInputBorder(
//                                                   borderRadius: BorderRadius.circular(10),
//                                                   borderSide: BorderSide(
//                                                     color: Colors.red,
//                                                   ),
//                                                 ),
//                                                 focusedErrorBorder: OutlineInputBorder(
//                                                     borderRadius: BorderRadius.circular(10),
//                                                     borderSide: BorderSide(
//                                                       color: Colors.red,
//                                                     ))),
//                                             keyboardType: TextInputType.visiblePassword,
//                                             // onFieldSubmitted: (value) {},
//
//                                             validator: (value) {
//                                               if (value == null || value.isEmpty) {
//                                                 return "This filed must not be empty";
//                                               }
//                                               return null;
//                                             },
//                                             onEditingComplete: () {
//                                               if (_formKey.currentState!.validate()) {
//                                                 print("Successfull");
//                                               } else {}
//                                             },
//                                           ),
//                                         ],
//                                       )),
//                                   SizedBox(
//                                     height: 15,
//                                   ),
//                                   Row(
//                                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           Theme(
//                                             data: Theme.of(context).copyWith(
//                                               unselectedWidgetColor: Colors.white,
//                                             ),
//                                             child: Checkbox(
//                                                 checkColor: Colors.red,
//                                                 activeColor: Colors.blue,
//                                                 value: value,
//                                                 onChanged: (value) {}),
//                                           ),
//                                           Text('Remember Me'),
//                                         ],
//                                       ),
//                                       TextButton(
//                                           onPressed: () {}, child: Text('Forgot Password?'))
//                                     ],
//                                   ),
//                                   SizedBox(
//                                     height: 35,
//                                   ),
//
//                                   MaterialButton(
//                                     color: Colors.blue,
//                                     minWidth: double.infinity,
//                                     shape: RoundedRectangleBorder(
//                                         borderRadius: BorderRadius.circular(10)),
//                                     onPressed: () {
//                                       // if (_formKey.currentState!.validate()) {
//                                       //   Navigator.of(context).push(MaterialPageRoute(
//                                       //       builder: (context) => SignUpPage()));
//                                       // } else {}
//                                     },
//                                     child: Text(
//                                       "Sign in",
//                                       style: TextStyle(
//                                           color: Colors.white, fontWeight: FontWeight.w700),
//                                     ),
//                                     height: 45,
//                                   ),
//
//                                   SizedBox(
//                                     height: 10,
//                                   ),
//                                   RichText(
//                                     text: TextSpan(
//                                       text: "Become a seller ",
//                                       style: TextStyle(fontSize: 18, color: Colors.black54),
//                                       children: <TextSpan>[
//                                         TextSpan(
//                                             text: 'Sign Up',
//                                             style: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.blue,
//                                                 fontSize: 20)),
//                                       ],
//                                     ),
//                                   )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   ),
//                 ),
//               ),
//             ),
//           ***Custom Clipper Class***co
