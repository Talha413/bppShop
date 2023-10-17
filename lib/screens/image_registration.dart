import 'dart:io';

import 'package:bpp_shop/Demo/ImageCropperHelper.dart';
import 'package:bpp_shop/screens/demo_seller.dart';
import 'package:bpp_shop/screens/home_demo.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:image/image.dart' as img;

import '../widgets/CustomClipper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:image_cropper/image_cropper.dart';

class ImageRegistration extends StatefulWidget {
  const ImageRegistration({super.key});

  @override
  State<ImageRegistration> createState() => _ImageRegistrationState();
}

class _ImageRegistrationState extends State<ImageRegistration> {
  bool? ischecked = false;
  File? imageFile;
  File? logoFile;

  String? _selectedFileName;
  String? _selectedLogoName;

  // File? _imagePath;
  // File? _logoPath;
  var _formkey = GlobalKey<FormState>();
  String password = "";
  String passwordError = "";
  String retypePassword = '';
  String retypePasswordError = "";
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  final picker = ImagePicker();

  //*** Image ***
  void showImagePicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.image,
                            size: 60.0,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.pop(context);
                      },
                    )),
                    Expanded(
                        child: InkWell(
                      child: SizedBox(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              size: 60.0,
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              "Camera",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        _imgFromCamera();
                        Navigator.pop(context);
                      },
                    ))
                  ],
                )),
          );
        });
  }

  _imgFromGallery() async {
    await picker.pickImage(source: ImageSource.gallery).then((value) {
      if (value != null) {
        _selectedFileName = value.name;
        _cropImage(File(value.path));
      }
    });
  }

  _imgFromCamera() async {
    await picker
        .pickImage(source: ImageSource.camera, imageQuality: 50)
        .then((value) {
      if (value != null) {
        _selectedFileName = value.name;
        _cropImage(File(value.path));
      }
    });
  }

  _cropImage(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatio: CropAspectRatio(ratioX: 1, ratioY: 1),
        // aspectRatioPresets: Platform.isAndroid
        //     ? [
        //   CropAspectRatioPreset.square,
        //   CropAspectRatioPreset.ratio3x2,
        //   CropAspectRatioPreset.original,
        //   CropAspectRatioPreset.ratio4x3,
        //   CropAspectRatioPreset.ratio16x9,
        //   //CropAspectRatioPreset.ratio6x1
        // ] : [
        //   CropAspectRatioPreset.original,
        //   CropAspectRatioPreset.square,
        //   CropAspectRatioPreset.ratio3x2,
        //   CropAspectRatioPreset.ratio4x3,
        //   CropAspectRatioPreset.ratio5x3,
        //   CropAspectRatioPreset.ratio5x4,
        //   CropAspectRatioPreset.ratio7x5,
        //   CropAspectRatioPreset.ratio16x9
        // ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: true),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        imageFile = File(croppedFile.path);
      });
      // reload();
    }
  }

  //***Logo***
  void showLogoPicker(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (builder) {
          return Card(
            child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 5.2,
                margin: const EdgeInsets.only(top: 8.0),
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                        child: InkWell(
                      child: Column(
                        children: const [
                          Icon(
                            Icons.image,
                            size: 60.0,
                          ),
                          SizedBox(height: 12.0),
                          Text(
                            "Gallery",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 16, color: Colors.black),
                          )
                        ],
                      ),
                      onTap: () {
                        //_imgFromGallery();
                        _pickLogo(6.0);
                        Navigator.pop(context);
                      },
                    )),
                    Expanded(
                        child: InkWell(
                      child: SizedBox(
                        child: Column(
                          children: const [
                            Icon(
                              Icons.camera_alt,
                              size: 60.0,
                            ),
                            SizedBox(height: 12.0),
                            Text(
                              "Camera",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(fontSize: 16, color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      onTap: () {
                        _logoFromCamera();
                        Navigator.pop(context);
                      },
                    ))
                  ],
                )),
          );
        });
  }

  Future<void> _pickLogo(double expectedAspectRatio) async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      final File imageFile = File(pickedFile.path);
      final img.Image? image = img.decodeImage(imageFile.readAsBytesSync());

      if (image != null) {
        final double aspectRatio =
            image.width.toDouble() / image.height.toDouble();
        if (aspectRatio == expectedAspectRatio) {
          setState(() {
            logoFile = imageFile;
            _selectedLogoName = pickedFile.name;
          });
        } else {
          _showAlertDialog('Invalid Aspect Ratio',
              'Please select an image with the  aspect ratio of "6:1".');
        }
      } else {
        _showAlertDialog(
            'Invalid Image', 'The selected file is not a valid image.');
      }
    }
  }

  void _showAlertDialog(String title, String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }

  _logoFromCamera() async {
    final pickedFile = await picker.pickImage(source: ImageSource.camera);
    // await picker.pickImage(
    //     source: ImageSource.camera, imageQuality: 50
    // ).then((value){
    //   if(value != null){
    //     _cropLogo(File(value.path));
    //   }
    // });
    if (pickedFile != null) {
      _selectedLogoName = pickedFile.name;
      _cropLogo(File(pickedFile.path));
    }
  }

  _cropLogo(File imgFile) async {
    final croppedFile = await ImageCropper().cropImage(
        sourcePath: imgFile.path,
        aspectRatio: CropAspectRatio(ratioX: 6, ratioY: 1),
        // aspectRatioPresets: Platform.isAndroid
        //     ? [
        //   CropAspectRatioPreset.square,
        //   CropAspectRatioPreset.ratio3x2,
        //   CropAspectRatioPreset.original,
        //   CropAspectRatioPreset.ratio4x3,
        //   CropAspectRatioPreset.ratio16x9,
        //   //CropAspectRatioPreset.ratio6x1
        // ] : [
        //   CropAspectRatioPreset.original,
        //   CropAspectRatioPreset.square,
        //   CropAspectRatioPreset.ratio3x2,
        //   CropAspectRatioPreset.ratio4x3,
        //   CropAspectRatioPreset.ratio5x3,
        //   CropAspectRatioPreset.ratio5x4,
        //   CropAspectRatioPreset.ratio7x5,
        //   CropAspectRatioPreset.ratio16x9
        // ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: "Image Cropper",
              toolbarColor: Colors.deepOrange,
              toolbarWidgetColor: Colors.white,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: true),
          IOSUiSettings(
            title: "Image Cropper",
          )
        ]);
    if (croppedFile != null) {
      imageCache.clear();
      setState(() {
        logoFile = File(croppedFile.path);
      });
      // reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    final _width = MediaQuery.of(context).size.width;
    final _height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Color(0xfff3f3f3),
      body: Stack(children: [
        //ClipPath(()),
        ClipPath(
          clipper: CustomClipperImage(),
          child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              color: Color(0xffffffff)),
        ),

        //physics:
        // ClampingScrollPhysics(parent: NeverScrollableScrollPhysics()),

        SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: MediaQuery.of(context).size.width,
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: IntrinsicHeight(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Text(
                  //   'BPPSHOP_Image',
                  //   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  // ),
                  SizedBox(
                    height: _height * (20 / 600),
                  ),
                  Image.asset(
                    'images/bpp shop logo 01.896abfc13589245ecc62.png',
                    height: _height * (30 / 600),
                    // width: 140,
                  ),
                  // SizedBox(
                  //   height: 3,
                  // ),
                  Container(
                    //alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                        horizontal: _width * (8 / 360),
                        vertical: _height * (2 / 600)),
                    padding: EdgeInsets.symmetric(
                        horizontal: _width * (6 / 360),
                        vertical: _height * (4 / 600)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                    ),
                    // color: Colors.white,
                    // height: MediaQuery.of(context).size.height * 0.82,
                    // width: MediaQuery.of(context).size.width,
                    child: Form(
                      key: _formkey,
                      child: Column(
                        children: [
                          Text("Become a Seller ",
                              style: TextStyle(
                                  fontSize: _width * 0.06,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            'Welcome to seller registration',
                            style: TextStyle(
                                fontSize: _width * 0.045,
                                fontWeight: FontWeight.bold),
                          ),
                          Divider(
                              color: Colors.red,
                              indent: _width * (10 / 360),
                              endIndent: _width * (10 / 360),
                              height: _height * 0.02),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                //padding: EdgeInsets.all(5),
                                // height: _height * 0.167,
                                // width: _width * 0.28,
                                height: _height * (95/ 600),
                                width: _width * (122 / 360),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.blue),
                                ),
                                child: imageFile != null
                                    ? ClipRRect(
                                        borderRadius: BorderRadius.circular(10),
                                        child: Image.file(
                                          imageFile!,
                                          //height: 400,
                                          //width: 400,
                                          fit: BoxFit.cover,
                                        ),
                                      )
                                    : CachedNetworkImage(
                                        //fit: BoxFit.cover,
                                        imageUrl:
                                            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFBr35nsGltX_wIDUpo4TCQCXGHsnU1P9qUQ&usqp=CAU",
                                        progressIndicatorBuilder:
                                            (context, url, downloadProgress) =>
                                                Center(
                                          child: CircularProgressIndicator(
                                              strokeWidth: 5,
                                              value: downloadProgress.progress),
                                        ),
                                        errorWidget: (context, url, error) =>
                                            Icon(Icons.error),
                                      ),

                                // Image.network(
                                //     "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFBr35nsGltX_wIDUpo4TCQCXGHsnU1P9qUQ&usqp=CAU"),
                              ),
                              Container(
                                height: _height * (95 / 600),
                                //color: Colors.orange,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.symmetric(
                                          vertical: _height * (8 / 600),
                                          horizontal: _width * (4 / 360)),
                                      //height: _height * (30 / 600),
                                      width: _width * (180/ 360),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(color: Colors.blue),
                                      ),
                                      child: _selectedFileName == null
                                          ? Icon(Icons.abc)
                                          : Text('${_selectedFileName}'),
                                      //  print('${_selectedFileName}');
                                    ),
                                    ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          fixedSize: Size(_width * (180 / 360),
                                              _height * (30 / 600)),
                                          backgroundColor: Colors.grey,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                        onPressed: () => {
                                              //showOptions(),
                                              showImagePicker(context),
                                            },
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Icon(Icons.file_upload),
                                            Text('Browse'),
                                          ],
                                        ))
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: _height*(5/360),
                          ),
                          // *******************************************************************************
                          Container(
                            // color: Colors.orange,

                            padding: EdgeInsets.all(1),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.blue),
                            ),
                            height: _height * (60 / 360),
                            width: _width * (360 / 360),
                            child: logoFile != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.file(
                                      logoFile!,
                                      //height: 400,
                                      //width: 400,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : CachedNetworkImage(
                                    imageUrl:
                                        "https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w=",
                                    progressIndicatorBuilder:
                                        (context, url, downloadProgress) =>
                                            Center(
                                      child: CircularProgressIndicator(
                                          value: downloadProgress.progress),
                                    ),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error),
                                  ),

                            // Image.network(
                            //         "https://media.istockphoto.com/id/1322277517/photo/wild-grass-in-the-mountains-at-sunset.jpg?s=612x612&w=0&k=20&c=6mItwwFFGqKNKEAzv0mv6TaxhLN3zSE43bWmFN--J5w=",
                            //         fit: BoxFit.cover,
                            //       ),
                          ),
                          SizedBox(
                            height: _height*(10/360),
                          ),
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                                horizontal: _width * (8 / 360),
                                vertical: _height * (4 / 600)),
                            width: _width * (360 / 360),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: Colors.blue),
                            ),
                            child: _selectedLogoName == null ?
                                Icon(Icons.abc)
                                : Text('${_selectedLogoName}'),
                          ),
                          SizedBox(
                            height: _height*(5/360),
                          ),
                          Align(
                            alignment: Alignment.centerRight,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  fixedSize:  Size(_width * (140 /360),
                                      _height * (30 /600)),
                                  backgroundColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                onPressed: () => {
                                      // getLogo(ImageSource.gallery),
                                      // showOptions(),
                                      showLogoPicker(context),
                                    },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Icon(Icons.file_upload),
                                    Text('Browse'),
                                  ],
                                )),
                          ),
                          Container(
                            margin: EdgeInsets.all(3),
                            //padding: EdgeInsets.all(10),
                            height: _height * (27 / 600),
                            width: _width * (350 / 360),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: passwordError.isEmpty
                                    ? Color(0xFF069DD8)
                                    : Colors.red,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: _height * (27 / 600),
                                    //width: 80,
                                    decoration: BoxDecoration(
                                      //color: Colors.red,
                                      border: Border(
                                          right: BorderSide(
                                        color: Color(0xFF069DD8),
                                        width: _width / 180,
                                      )),
                                    ),
                                    child: Text("Password"),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: _height * (27 / 600),
                                    //width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),

                                    child: TextFormField(
                                      autovalidateMode:
                                          AutovalidateMode.onUserInteraction,
                                      controller: passwordController,
                                      textInputAction: TextInputAction.next,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
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
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (passwordError.isNotEmpty)
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  passwordError,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: _width / 26,
                                      fontWeight: FontWeight.bold),
                                )),
                          Container(
                            margin: EdgeInsets.all(3),
                            //padding: EdgeInsets.all(10),
                            height: _height * (27 / 600),
                            width: _width * (350 / 360),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: retypePasswordError.isEmpty
                                    ? Color(0xFF069DD8)
                                    : Colors.red,
                              ),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: _height * (27 / 600),
                                    //width: 80,
                                    decoration: BoxDecoration(
                                      //color: Colors.red,
                                      border: Border(
                                          right: BorderSide(
                                        color: Color(0xFF069DD8),
                                        width: _width / 180,
                                      )),
                                    ),
                                    child: Text("Retype Password"),
                                  ),
                                ),
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    padding: EdgeInsets.all(10),
                                    height: _height * (27 / 600),
                                    //width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(10),
                                          bottomRight: Radius.circular(10)),
                                    ),

                                    child: TextFormField(
                                        controller: retypePasswordController,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        textInputAction: TextInputAction.done,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderSide: BorderSide.none,
                                          ),
                                        ),
                                        // validator: (value){
                                        //   if(value!=passwordController){
                                        //     return "Erroooooor!!!!";
                                        //   }else return null;
                                        // },
                                        onChanged: (value) {
                                          setState(() {
                                            retypePassword = value;
                                            retypePasswordError = '';
                                          });
                                          _validateRetypeFields();
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          if (retypePasswordError.isNotEmpty)
                            Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  retypePasswordError,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: _width / 26,
                                      fontWeight: FontWeight.bold),
                                )),
                          Row(
                            children: [
                              Checkbox(
                                  value: ischecked,
                                  onChanged: (value) {
                                    setState(() {
                                      ischecked = value;
                                    });
                                  }),
                              // Theme(
                              //   data: Theme.of(context).copyWith(
                              //     unselectedWidgetColor: Colors.white,
                              //   ),
                              //   child: Checkbox(
                              //       checkColor: Colors.red,
                              //       activeColor: Colors.blue,
                              //       value: value,
                              //       onChanged: (value) {}),
                              // ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    " I agree to your  ",
                                    style: TextStyle(
                                        fontSize:
                                            _width * 0.016 + _height * 0.010,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                  InkWell(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    DemoSeller()));
                                      },
                                      child: Text(
                                        'Terms and Condition',
                                        style: TextStyle(
                                            fontSize: _width * 0.018 +
                                                _height * 0.012,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.blue,
                                            decoration:
                                                TextDecoration.underline),
                                      )),
                                ],
                              ),
                              //Text('I agree to Your Terms and Condition'),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              MaterialButton(
                                color: Colors.grey,
                                minWidth: _width * (105 / 360),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DemoSeller()));
                                },
                                child: Text(
                                  "Back",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                height: _height * (17 / 360),
                              ),
                              MaterialButton(
                                color: Colors.blue,
                                minWidth: _width * (125 / 360),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                onPressed: () {
                                  //phoneController.clear();
                                  // passwordController.clear();
                                  _validatePasswordFields();
                                  _validateRetypeFields();
                                  if (passwordError.isEmpty &&
                                      retypePasswordError.isEmpty && imageFile!=null && logoFile!=null) {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => HomeDemo()));
                                  }
                                },
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                                height: _height * (17 / 360),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: _height * (5 / 360),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account ",
                                style: TextStyle(
                                    fontSize: _width * 0.020 + _height * 0.014,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                DemoSeller()));
                                  },
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                        fontSize:
                                            _width * 0.021 + _height * 0.015,
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
      ]),
    );
  }

  bool _isValidPassword(String password) {
    final RegExp passwordRegex =
        RegExp(r'^(?=.*[A-Za-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    return passwordRegex.hasMatch(password);
  }

  void _validatePasswordFields() {
    if (password.isEmpty) {
      setState(() {
        passwordError = 'Password Required';
      });
    } else if (!_isValidPassword(password)) {
      setState(() {
        passwordError = 'Atleast 1 U_Case,L_case,Special & Number must 8 digit';
      });
    } else if (retypePassword != passwordController.text) {
      setState(() {
        retypePasswordError = 'Password must be matched';
      });
    }
  }

  void _validateRetypeFields() {
    if (retypePassword.isEmpty) {
      setState(() {
        retypePasswordError = 'Password Required';
      });
    } else if (retypePassword != passwordController.text) {
      setState(() {
        retypePasswordError = 'Password Must Be Matched';
      });
    }
  }
}

// XFile? _pickedFile;
// CroppedFile? _croppedFile;
// bool? ischecked = false;
// bool value = false;
// File? _imagePath;
// File? _logoPath;
//
// String? _selectedFileName;
// String? _selectedLogoName;
//
// List<File?> selectedImages = [null, null];
//
// final picker = ImagePicker();

// Future<void> _pickImage(double expectedAspectRatio, var sources) async {
//   final pickedFile = await picker.pickImage(source: sources);
//   if (pickedFile != null) {
//     final File imageFile = File(pickedFile.path);
//     final img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
//
//     if (image != null) {
//       final double aspectRatio =
//           image.width.toDouble() / image.height.toDouble();
//       if (aspectRatio == expectedAspectRatio) {
//         setState(() {
//           _imagePath = imageFile;
//           _selectedFileName = pickedFile.name;
//         });
//       } else {
//         _showAlertDialog('Invalid Aspect Ratio',
//             'Please select an image with the  aspect ratio of "1".');
//       }
//     } else {
//       _showAlertDialog(
//           'Invalid Image', 'The selected file is not a valid image.');
//     }
//   }
// }

// Future<void> _uploadImage() async {
//   final pickedFile =
//       await ImagePicker().pickImage(source: ImageSource.gallery);
//   if (pickedFile != null) {
//     setState(() {
//       _pickedFile = pickedFile;
//     });
//   }
// }

// Future<void> _pickLogo() async {
//   final pickedFile = await picker.pickImage(source: ImageSource.camera);
//   // _cropImage(pickedFile!.path);
// }

// Future<void> _pickLogo(double expectedAspectRatio,var source) async {
//   final pickedFile = await picker.pickImage(source: source);
//   // if(pickedFile!= null){
//   //   setState(() {
//   //     _pickedFile = pickedFile;
//   //     _cropImage();
//   //   });
//   // }
//   if (pickedFile != null) {
//     final File imageFile = File(pickedFile.path);
//     final img.Image? image = img.decodeImage(imageFile.readAsBytesSync());
//
//     if (image != null) {
//       final double aspectRatio =
//           image.width.toDouble() / image.height.toDouble();
//       if (aspectRatio == expectedAspectRatio) {
//         setState(() {
//           _logoPath = imageFile;
//           _selectedLogoName = pickedFile.name;
//         });
//       } else {
//         _showAlertDialog('Invalid Aspect Ratio',
//             'Please select an image with the  aspect ratio of "6:1".');
//       }
//     } else {
//       _showAlertDialog(
//           'Invalid Image', 'The selected file is not a valid image.');
//     }
//   }
// }
// Future<void>_cropImage(filePath)async{
//   CroppedFile? cropedImage= await ImageCropper().cropImage(sourcePath: filePath,maxWidth: 1080,maxHeight: 1080);
//   if(cropedImage!= null){
//     setState(() {
//       imageFile =cropedImage as File;
//     });
//   }
//
// }
// Future<void> _cropImage() async {
//   if (_pickedFile != null) {
//     final croppedFile = await ImageCropper().cropImage(
//       sourcePath: _pickedFile!.path,
//       compressFormat: ImageCompressFormat.jpg,
//       compressQuality: 100,
//       uiSettings: [
//         AndroidUiSettings(
//             toolbarTitle: 'Cropper',
//             toolbarColor: Colors.deepOrange,
//             toolbarWidgetColor: Colors.white,
//             initAspectRatio: CropAspectRatioPreset.original,
//             lockAspectRatio: false),
//         IOSUiSettings(
//           title: 'Cropper',
//         ),
//         WebUiSettings(
//           context: context,
//           presentStyle: CropperPresentStyle.dialog,
//           boundary: const CroppieBoundary(
//             width: 520,
//             height: 520,
//           ),
//           viewPort:
//               const CroppieViewPort(width: 480, height: 480, type: 'circle'),
//           enableExif: true,
//           enableZoom: true,
//           showZoomer: true,
//         ),
//       ],
//     );
//     if (croppedFile != null) {
//       setState(() {
//         _croppedFile = croppedFile;
//       });
//     }
//   }
// }
//
// Future showOptions() async {
//   showCupertinoModalPopup(
//     context: context,
//     builder: (context) => CupertinoActionSheet(
//       actions: [
//         CupertinoActionSheetAction(
//           child: Text('Photo Gallery'),
//           onPressed: () {
//             // close the options modal
//             Navigator.of(context).pop();
//             // get image from gallery
//             //getImageFromGallery();
//             //_pickImage(1.0, ImageSource.gallery);
//           },
//         ),
//         CupertinoActionSheetAction(
//           child: Text('Camera'),
//           onPressed: () {
//             Navigator.of(context).pop();
//             // Navigator.of(context).push(MaterialPageRoute(
//             //     builder: (context) => ImageCropperHelper()));
//
//             // get image from camera
//             //getImageFromCamera();
//
//             // _pickLogo(6.0,ImageSource.camera);
//           },
//         ),
//       ],
//     ),
//   );
// }
//

// void _showAlertDialog(String title, String message) {
//   showDialog(
//     context: context,
//     builder: (context) {
//       return AlertDialog(
//         title: Text(title),
//         content: Text(message),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('OK'),
//           ),
//         ],
//       );
//     },
//   );
// }
