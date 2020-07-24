import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:image_picker/image_picker.dart';
import 'package:madesoftlogic/screens/HomePage.dart';
import 'package:madesoftlogic/widgets/custom_container.dart';
import 'package:madesoftlogic/widgets/custom_fielld.dart';

import '../constants.dart';

class AddStaff extends StatefulWidget {
  @override
  _AddStaffState createState() => _AddStaffState();
}

class _AddStaffState extends State<AddStaff> {
  final _formKey = GlobalKey<FormState>();
  bool status = false;

  void onItemMenuPress(Choice choice) {
    if (choice.title == 'Home') {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage()));
    }
  }

  List<Choice> choices = const <Choice>[
    const Choice(title: 'Profile', icon: Icons.person),
    const Choice(title: 'Home', icon: Icons.exit_to_app)
  ];

  Widget showImage(){
    return FutureBuilder<File>(
      future: imageFile,
        builder: (BuildContext context, AsyncSnapshot<File> snapshot){
        if(snapshot.connectionState == ConnectionState.done && snapshot.data != null){
          return Image.file(
            snapshot.data,
            width: 300,
            height: 300,
          );
        } else if(snapshot.error != null){
          return const Text('Error Picking Image', textAlign: TextAlign.center,);
        } else {
          return Container();
        }
        }
    );
  }

  Future<File> imageFile;
  pickImageFromGallery(ImageSource source){
    setState(() {
      imageFile = ImagePicker.pickImage(source: source);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 5,
        iconTheme: IconThemeData(
          color: primaryColor, //change your color here
        ),
        backgroundColor: Colors.white,
        actions: <Widget>[
          PopupMenuButton(
            onSelected: onItemMenuPress,
            itemBuilder: (BuildContext context) {
              return choices.map((Choice choice) {
                return PopupMenuItem<Choice>(
                    value: choice,
                    child: Row(
                      children: <Widget>[
                        Icon(choice.icon, color: primaryColor,),
                        SizedBox(width: 10,),
                        Text(choice.title, style: TextStyle(color: primaryColor),)
                      ],
                    )
                );
              }).toList();
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 18),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                SizedBox(height: 20,),
                CustomField(
                  validator: (val) => val.isEmpty() ? 'This field is required' : null,
                  labelColor: Colors.grey,
                  cursorColor: Colors.black,
                  color: Colors.black,
                    labelText: 'Name of Staff'
                ),
                SizedBox(height: 10,),
                CustomField(
                  keyboardType: TextInputType.emailAddress,
                    validator: (val) => val.isEmpty() ? 'This field is required' : null,
                    labelColor: Colors.grey,
                    cursorColor: Colors.black,
                    color: Colors.black,
                    labelText: 'Email'
                ),
                SizedBox(height: 10,),
                CustomField(
                    validator: (val) => val.isEmpty() ? 'This field is required' : null,
                    labelColor: Colors.grey,
                    cursorColor: Colors.black,
                    color: Colors.black,
                    labelText: 'Address'
                ),
                SizedBox(height: 10,),
                CustomField(
                    keyboardType: TextInputType.phone,
                    validator: (val) => val.isEmpty() ? 'This field is required' : null,
                    labelColor: Colors.grey,
                    cursorColor: Colors.black,
                    color: Colors.black,
                    labelText: 'Phone No.'
                ),
                SizedBox(height: 10,),
                CustomField(
                  obscure: true,
                    validator: (val) => val.isEmpty() ? 'This field is required' : null,
                    labelColor: Colors.grey,
                    cursorColor: Colors.black,
                    color: Colors.black,
                    labelText: 'Password'
                ),
                SizedBox(height: 40,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Staff Image', textAlign: TextAlign.start, style: TextStyle(color: Colors.grey, fontSize: 15),),
                  SizedBox(height: 20,),
                  showImage(),
                  ButtonTheme(
                    minWidth: 120.0,
                    height: 40.0,
                    child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(9.0),
                            side: BorderSide(color: primaryColor)
                        ),
                        color: Colors.white,
                        child: Text('Select File', style: TextStyle(color: Color(0xFF6619EA)),),
                        onPressed: (){
                          pickImageFromGallery(ImageSource.gallery);
                        }),
                  )
                ],
              ),
                SizedBox(height: 10,),
                CustomField(
                    validator: (val) => val.isEmpty() ? 'This field is required' : null,
                    labelColor: Colors.grey,
                    cursorColor: Colors.black,
                    color: Colors.black,
                    labelText: 'Select Staff Location'
                ),
                SizedBox(height: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Text('Select Staff Access Rights', style: TextStyle(color: Colors.grey, fontSize: 15),),
                    SizedBox(height: 20,),
                    Text('Access to Sales Register', style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),),
                  ],
                ),
                SizedBox(height: 20,),
                CustomContainer(
                  text: 'Online Pos',
                  onOrOff: true,
                ),
                SizedBox(height: 10,),
                CustomContainer(
                  text: 'All Sales Reports',
                  onOrOff: false,
                ),
                SizedBox(height: 20,),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Access to Customers',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),)),
                SizedBox(height: 20,),
                CustomContainer(
                  text: 'View Customers',
                  onOrOff: true,
                ),
                SizedBox(height: 10,),
                CustomContainer(
                  text: 'Add/Edit Customers',
                  onOrOff: true,
                ),
                SizedBox(height: 20,),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Access to Suppliers',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),)),
                SizedBox(height: 20,),
                CustomContainer(
                  text: 'View Suppliers',
                  onOrOff: true,
                ),
                SizedBox(height: 10,),
                CustomContainer(
                  text: 'Add/Edit Suppliers',
                  onOrOff: true,
                ),

                SizedBox(height: 20,),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Access to Products and Services',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),)),
                SizedBox(height: 20,),
                CustomContainer(
                  text: 'Access to Product List',
                  onOrOff: true,
                ),
                SizedBox(height: 10,),
                CustomContainer(
                  text: 'Add Products',
                  onOrOff: false,
                ),
                SizedBox(height: 10,),
                CustomContainer(
                  text: 'View Cost Price',
                  onOrOff: false,
                ),
                SizedBox(height: 10,),
                CustomContainer(
                  text: 'Edit Product/Service',
                  onOrOff: false,
                ),
                SizedBox(height: 10,),
                CustomContainer(
                  text: 'Restock Product',
                  onOrOff: false,
                ),
                SizedBox(height: 10,),
                CustomContainer(
                  text: 'Delete Product/Service',
                  onOrOff: false,
                ),

                SizedBox(height: 20,),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Access to Staff',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),)),
                SizedBox(height: 20,),
                CustomContainer(
                  text: 'Add/Edit Staff',
                  onOrOff: false,
                ),
                SizedBox(height: 10,),
                CustomContainer(
                  text: 'View Staff',
                  onOrOff: false,
                ),

                SizedBox(height: 20,),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Access to Reporting',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),)),
                SizedBox(height: 20,),
                CustomContainer(
                  text: 'Sales Report',
                  onOrOff: false,
                ),
                SizedBox(height: 10,),
                CustomContainer(
                  text: 'Inventory Report',
                  onOrOff: false,
                ),
                SizedBox(height: 10,),
                CustomContainer(
                  text: 'Expense Report',
                  onOrOff: false,
                ),

                SizedBox(height: 20,),
                Align(
                    alignment: Alignment.topLeft,
                    child: RichText(
                      text: TextSpan(
                        style: TextStyle(color: Colors.black,  fontWeight: FontWeight.w500),
                        children: [
                          TextSpan(text: 'Access to Profile ', style: TextStyle(fontSize: 20,)),
                          TextSpan(text: '(Allow Staff to Edit his/her Details)', style: TextStyle(fontSize: 9,))
                        ]
                      ),
                    ),
                   ),
                SizedBox(height: 20,),
                CustomContainer(
                  text: 'Update Profile Settings',
                  onOrOff: true,
                ),

                SizedBox(height: 20,),
                Align(
                    alignment: Alignment.topLeft,
                    child: Text('Access to Expense',
                      textAlign: TextAlign.left,
                      style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),)),
                SizedBox(height: 20,),
                CustomContainer(
                  text: 'Add/Editing Expenses',
                  onOrOff: true,
                ),
                SizedBox(height: 10,),
                CustomContainer(
                  text: 'View Expenses',
                  onOrOff: true,
                ),
                SizedBox(height: 40,),
                ButtonTheme(
                  minWidth: 180.0,
                  height: 50.0,
                  child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(9.0),
                      ),
                      color: primaryColor,
                      child: Text('Save', style: TextStyle(color: Colors.white, fontSize: 18),),
                      onPressed: (){
                        final FormState form = _formKey.currentState;
                        if (_formKey.currentState.validate()) {
                          form.save();
                        }
                      }),
                ),
                SizedBox(height: 40,),

              ],
            ),
          ),
        ),
      ),
    );
  }
}


class Choice {
  const Choice({this.title, this.icon});

  final String title;
  final IconData icon;
}
