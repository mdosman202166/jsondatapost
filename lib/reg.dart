import 'dart:convert';
import 'dart:io';

import 'package:dhurrr/datetime.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  String pickedDate = "Choose date";
  File? captureImage;
  String Gender = "";
  bool checkval = false;
  bool valll = false;
  var district ;
 String districtC = "ChooseeDistrict";
  var items=["Madaripur", "Dhaka", "Foridpur", "Barisal", "khulna,Madaripur", "Dhaka", "Foridpur", "Barisal", "khulna,Madaripur", "Dhaka", "Foridpur", "Barisal", "khulna,Madaripur", "Dhaka", "Foridpur", "Barisal", "khulna,Madaripur", "Dhaka", "Foridpur", "Barisal", "khulna,Madaripur", "Dhaka", "Foridpur", "Barisal", "khulna,Madaripur", "Dhaka", "Foridpur", "Barisal", "khulna,Madaripur", "Dhaka", "Foridpur", "Barisal", "khulna,"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration Page"),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Stack(
                    alignment: AlignmentDirectional.bottomEnd,
                    children: [
                      Center(
                        child: CircleAvatar(
                          maxRadius: 100,
                          child: captureImage == null
                              ? CircleAvatar(
                            maxRadius: 100,
                            backgroundImage: AssetImage("images/download.png"),
                          )
                              : CircleAvatar(
                            maxRadius: 100,
                            backgroundImage: FileImage(
                              captureImage!,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        right: 80,
                        bottom:5,
                        child: TextButton.icon(
                            onPressed: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      height: MediaQuery.of(context).size.height/6,
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        children: [
                                          FlatButton.icon(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                imagecamera();
                                              },

                                              icon: Icon(Icons.camera),
                                              label:
                                              Text("Camera")),

                                          FlatButton.icon(
                                              onPressed: () {
                                                Navigator.pop(context);
                                                ImageFile();
                                              },
                                              icon: Icon(Icons.memory),
                                              label:
                                              Text("Memory"))
                                        ],
                                      ),

                                    );
                                  });
                              //  Navigator.pop(context);

                            },
                            icon: Icon(
                              Icons.camera_alt_outlined,
                              color: Colors.black,
                            ),
                            label: Text("")),
                      ),
                    ],

                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), labelText: 'Enter Your Name')
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(), hintText: 'Enter Your Email'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(districtC),
                    DropdownButton(
                        menuMaxHeight:250 ,
                      dropdownColor: Colors.pink,
                      alignment: AlignmentDirectional.bottomStart,
                      iconDisabledColor: Colors.cyan,
                      itemHeight: 50,
                      iconEnabledColor: Colors.cyanAccent,
                      icon: Icon(Icons.arrow_drop_down),
                      onTap: (){

                      },
                      autofocus: false,
                      focusColor: Colors.pink,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                        isDense: true,
                        isExpanded: false,
                     focusNode: FocusNode(canRequestFocus:false ),
                      iconSize: 30,
                        elevation: 100,
                        enableFeedback: true,
                        items: items.map((e) {
                          return DropdownMenuItem(value: e, child: Text(e));
                        }).toList(),
                        value: district,
                        onChanged: (val) {
                          setState(() {
                            districtC =val.toString();
                          });

                        }),
                  ],
                ),
              ),
              TextButton(
                  onPressed: () {
                    _pickDateDialog();
                  },
                  child: Text(pickedDate)),
               Padding(
                 padding: const EdgeInsets.only(right: 300),
                 child: Text("Gender :"),
               ),
              Row(
                children: [
                  Radio(
                      value: "Male",
                      groupValue: Gender,
                      onChanged: (respons) {
                        Gender = respons.toString();
                        setState(() {
                        });
                      }),
                  Text("Male"),
                  Radio(
                      value: "Female",
                      groupValue: Gender,
                      onChanged: (respons) {
                        Gender = respons.toString();
                        setState(() {

                        });
                      }),
                  Text("Female"),
                  Radio(
                      value: "Others",
                      groupValue: Gender,
                      onChanged: (respons) {
                        Gender = respons.toString();
                        setState(() {

                        });
                      }),
                  Text("Others")
                ],
              ),
              Row(
                children: [
                  Checkbox(
                      value: checkval,
                      onChanged: (respons) {

                        setState(() {
                          checkval = respons!;

                        });
                      }),
                  Text("Tearm's and condtions"),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Save Login"),
                  Switch(
                    value: valll,
                    onChanged: (val) {
                      setState(() {
                        valll = val;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton
                (
                  onPressed: () {
                    registration();
                  },
                  child: Text("Sign Up")),
            ],
          ),
        ),
      ),
    );
  }
  imagecamera() async {
    var image = await ImagePicker().pickImage(source: ImageSource.camera);

    if (image != null) {
      captureImage = File(image.path);
      setState(() {});
    }
  }
  ImageFile() async {
    var image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image != null) {
      captureImage = File(image.path);
      setState(() {});
    }
  }
  _pickDateDialog() {

    showDatePicker(
        context: context,
        firstDate: DateTime(1950),
        lastDate: DateTime(2100),
        initialEntryMode: DatePickerEntryMode.input, initialDate: DateTime.now())
        .then((ChooseeDate) {
      if (ChooseeDate == null) {
        return;
      }

      setState(() {
        print(ChooseeDate);
        pickedDate = ChooseeDate.toString();
      });
    });
  }
  registration() {
    String name = nameController.text.toString();
    String email = emailController.text.toString().trim();


    var data = {
      "Images": captureImage,
      "name": name,
      "email": email,
      "District": district,
      "pickedDate": pickedDate,
      "Gender": Gender,
      "Trems": checkval,
      "save": valll,
    };
    print(jsonEncode(data));

  }
}