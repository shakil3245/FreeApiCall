import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


import 'loginScreen.dart';

class RegistrationScreen extends StatefulWidget {



  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _signUpFormKey = GlobalKey<FormState>();
  File? imageFile;
  bool _isLoading = false;
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  String? imageUrl;

  TextEditingController _nameController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _addressNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();





  // this fucntion helps to sent data to firebase
  // _submitFormFroSignUp() async {
  //   final isValid = _signUpFormKey.currentState!.validate();
  //   if(isValid){
  //     try {
  //       // create user with createUserWithEmailAndPassword
  //       final credential = await _auth.createUserWithEmailAndPassword(
  //         email: _emailController.text.trim().toLowerCase(),
  //         password: _passwordController.text.trim(),
  //       );
  //       // upload user image to cloude storgae
  //       final User? user = _auth.currentUser;
  //       final _uid = user!.uid;
  //
  //       //this portion store data to firebase Storage
  //       final storageRef = FirebaseStorage.instance.ref().child("buyerImage").child(_uid + ".jpg");
  //       await storageRef.putFile(imageFile!);
  //       imageUrl = await storageRef.getDownloadURL();
  //
  //       // upload data to cloude firestore
  //       FirebaseFirestore.instance.collection('buyers').doc(_uid).set(
  //           {
  //             'id': _uid,
  //             'name': _nameController.text, // John Doe// Stokes and Sons
  //             'email': _emailController.text,
  //             'userImage': imageUrl,
  //             'password': _passwordController.text,
  //             'phoneNumber': _phoneController.text,
  //             'location': _addressNameController.text,
  //             'createdAt': Timestamp.now(),
  //           }
  //
  //       );
  //       Navigator.canPop(context)? Navigator.pop(context):null;
  //       _nameController.clear();
  //       _emailController.clear();
  //       _passwordController.clear();
  //       _phoneController.clear();
  //       _addressNameController.clear();
  //
  //
  //     } catch (e) {
  //       print(e);
  //       setState(() {
  //         _isLoading = false;
  //       });
  //     }
  //     setState(() {
  //       _signUpFormKey.currentState!.reset();
  //     });
  //     return ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green,content: Text("Successfully Created!")));
  //   }else{
  //     return ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,content: Text("Please fill all the Requirments!")));
  //   }
  // }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _signUpFormKey,
              child: Column(
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  const Center(
                      child: Text(
                        "Create Customer's Account",
                        style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20),
                      )),
                  const SizedBox(
                    height: 14,
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please Enter Name";
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Full Name',
                      labelText: ' Enter Full Name ',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _phoneController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please Enter Phone Number";
                      }else{
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Phone Number',
                      labelText: 'Enter Phone Number',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _addressNameController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please Enter Address";
                      }else{
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: 'Enter Address',
                      labelText: 'Enter Address',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please Enter Email";
                      }else{
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: 'Enter Email',
                      labelText: 'Enter Email',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value){
                      if(value!.isEmpty){
                        return "Please Enter Password";
                      }else{
                        return null;
                      }
                    },
                    obscureText: true,
                    decoration: const InputDecoration(
                      hintText: 'Enter Password',
                      labelText: 'EnterPassword',

                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    child: _isLoading?Center(child: CircularProgressIndicator(),): SizedBox(
                        height: 50,
                        width: double.infinity,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange),
                            onPressed: () {
                              // _submitFormFroSignUp();
                              },
                            child: const Text(
                              "Register",
                              style: TextStyle(fontSize: 20, color: Colors.black),
                            ))),
                  ),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already Have An Account? "),
                      TextButton(onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
                      }, child: const Text("Login"))
                    ],)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}