import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:liverpool/Pages.dart/Sign_Up.dart';
import 'package:liverpool/Widgets/Slider.dart';

class Sign_In extends StatefulWidget {
  const Sign_In({super.key});

  @override
  State<Sign_In> createState() => _Sign_InState();
}

class _Sign_InState extends State<Sign_In> {
  GlobalKey<FormState> _SignInkey = GlobalKey();
  TextEditingController _Email = TextEditingController();
  TextEditingController _Password = TextEditingController();
  bool rememberpassword = true;
  FirebaseAuth auth = FirebaseAuth.instance;

  final RegExp EmailValid = RegExp(
      r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                height: height * .5,
                child: SliderScreen()),

            // Container(
            //     width: double.infinity,
            //     height: height * .5,
            //     decoration: BoxDecoration(
            //         image: DecorationImage(
            //             image: AssetImage("asset/pexels-thirdman-7659573.jpg"),
            //             fit: BoxFit.cover)),
            //     child: Container(
            //       decoration: BoxDecoration(
            //           gradient:
            //               LinearGradient(begin: Alignment.bottomRight, colors: [
            //         Colors.black.withOpacity(.9),
            //         Colors.black.withOpacity(.3),
            //       ])),
            //     )),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 220.0),
                  child: Container(
                    height: height * .72,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 20),
                      child: Form(
                        key: _SignInkey,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 10.0, bottom: 20),
                                child: Text(
                                  "Sign In",
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 25),
                                ),
                              ),
                              TextFormField(
                                controller: _Email,
                                keyboardType: TextInputType.emailAddress,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.person_outline,
                                    color: Colors.black,
                                  ),
                                  label: Text(
                                    "Email",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  hintText: 'Enter Email',
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return "Please enter your Emial";
                                  } else if (!EmailValid.hasMatch(value))
                                    return 'Pleas enter valid Email';

                                  return null;
                                },
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                controller: _Password,
                                decoration: const InputDecoration(
                                  suffixIcon: Icon(Icons.visibility),
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Colors.black,
                                  ),
                                  label: Text(
                                    "Password",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  hintText: 'Enter Password',
                                  hintStyle: TextStyle(
                                    color: Colors.black26,
                                  ),
                                  border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.black26),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty)
                                    return "Please enter your Password";
                                  else
                                    return null;
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Checkbox(
                                          activeColor: Colors.blue[400],
                                          value: rememberpassword,
                                          onChanged: (value) {
                                            setState(() {
                                              rememberpassword = value!;
                                            });
                                          }),
                                      Text(
                                        "Remember me",
                                        style: TextStyle(color: Colors.black45),
                                      ),
                                    ],
                                  ),
                                  GestureDetector(
                                    onTap: () {},
                                    child: Text(
                                      "Forget password?",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 200,
                                decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(30)),
                                child: TextButton(
                                  onPressed: () async {
                                    if (_SignInkey.currentState!.validate()) {
                                      try {
                                        await auth.signInWithEmailAndPassword(
                                            email: _Email.text,
                                            password: _Password.text);
                                      } catch (E) {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(SnackBar(
                                                content: Text(E.toString())));
                                      }
                                    }
                                  },
                                  child: Text("Sign In",
                                      style: TextStyle(
                                          color: Colors.grey[300],
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold)),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Expanded(
                                      child: Divider(
                                    thickness: 0.7,
                                    color: Colors.grey.withOpacity(0.5),
                                  )),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 10, vertical: 0),
                                    child: Text(
                                      "Sign In with",
                                      style: TextStyle(color: Colors.black45),
                                    ),
                                  ),
                                  Expanded(
                                      child: Divider(
                                    thickness: 0.7,
                                    color: Colors.grey.withOpacity(0.5),
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.twitter,
                                        color:
                                            Color.fromARGB(199, 33, 149, 243),
                                        size: 35),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const FaIcon(
                                        FontAwesomeIcons.facebook,
                                        color:
                                            Color.fromARGB(199, 33, 149, 243),
                                        size: 35),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    icon: const FaIcon(FontAwesomeIcons.apple,
                                        color: Color.fromARGB(255, 81, 75, 74),
                                        size: 35),
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Don\'t have an account?  ",
                                    style: TextStyle(
                                        color: Colors.black45, fontSize: 15),
                                  ),
                                  GestureDetector(
                                      onTap: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (contaxt) =>
                                                    Sign_Up()));
                                      },
                                      child: Text(
                                        "Sign Up",
                                        style: TextStyle(
                                            color: Colors.blue, fontSize: 16),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
