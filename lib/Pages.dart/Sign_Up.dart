import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:liverpool/Pages.dart/SIgn_In.dart';
import 'package:liverpool/Widgets/Slider.dart';

class Sign_Up extends StatefulWidget {
  const Sign_Up({super.key});

  @override
  State<Sign_Up> createState() => _Sign_UpState();
}

class _Sign_UpState extends State<Sign_Up> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    GlobalKey<FormState> _SignInkey = GlobalKey();
    TextEditingController Email = TextEditingController();
    TextEditingController _Phone = TextEditingController();
    TextEditingController _ConsfirmPassword = TextEditingController();
    TextEditingController _Password = TextEditingController();
    FirebaseAuth auth = FirebaseAuth.instance;
    final RegExp EmailValid = RegExp(
        r"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$");

    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Container(
                width: double.infinity,
                height: height * .5,
                child: SliderScreen()),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 150.0),
                  child: Container(
                    height: height * .80,
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
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.black54, fontSize: 25),
                                  ),
                                ),
                                TextFormField(
                                  controller: Email,
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
                                    if (value == null || value.isEmpty)
                                      return "Please enter your Emial";
                                    else if (!EmailValid.hasMatch(value))
                                      return 'Pleas enter valid Email';

                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: _Phone,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.phone,
                                      color: Colors.black,
                                    ),
                                    label: Text(
                                      'Phone',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    hintText: 'Enter Number',
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
                                      return "Please enter your Number";
                                    else
                                      return null;
                                  },
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: _Password,
                                  decoration: const InputDecoration(
                                    prefixIcon: Icon(
                                      Icons.key,
                                      color: Colors.black,
                                    ),
                                    suffixIcon: Icon(Icons.visibility_off),
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
                                  height: 15,
                                ),
                                TextFormField(
                                  controller: _ConsfirmPassword,
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    suffixIcon: Icon(Icons.visibility),
                                    prefixIcon: Icon(
                                      Icons.keyboard,
                                      color: Colors.black,
                                    ),
                                    label: Text(
                                      "Consfirm Password",
                                      style: TextStyle(color: Colors.black),
                                    ),
                                    hintText: 'Enter Password Again',
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
                                      return "Please enter your Password Again";
                                    else
                                      return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
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
                                          await auth
                                              .createUserWithEmailAndPassword(
                                                  email: Email.text,
                                                  password: _Password.text);
                                        } catch (E) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: Text(E.toString())));
                                        }
                                      }
                                    },
                                    child: Text("Sign Up",
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    IconButton(
                                      icon: const FaIcon(
                                          FontAwesomeIcons.twitter,
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
                                          color:
                                              Color.fromARGB(255, 81, 75, 74),
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
                                      "Already have an account?  ",
                                      style: TextStyle(
                                          color: Colors.black45, fontSize: 15),
                                    ),
                                    GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (contaxt) =>
                                                      Sign_In()));
                                        },
                                        child: Text(
                                          "Sign In",
                                          style: TextStyle(
                                              color: Colors.blue, fontSize: 16),
                                        )),
                                  ],
                                ),
                              ]),
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
