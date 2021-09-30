import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:line_icons/line_icons.dart';
import 'package:dayonemp/home.dart';
import 'package:dayonemp/login/login.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

User? user = FirebaseAuth.instance.currentUser;

final nameController = TextEditingController();
final surnameController = TextEditingController();
final emailController = TextEditingController();
final reppasController = TextEditingController();
final passwordController = TextEditingController();

bool _isObscure = true;
bool _isobscure = true;

class _RegisterState extends State<Register> {
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

  String errorMessage = '';
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.amber, /*brightness: Brightness.dark*/
      ),
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Center(
                    child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.pink.shade900,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  alignment: Alignment.center,
                  width: 250,
                  height: 70,
                  child: Text(
                    "Dayonemp",
                    style: GoogleFonts.fugazOne(
                      color: Colors.pink.shade900,
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
              ),
              Container(
                height: 575,
                margin: EdgeInsets.all(20),
                child: Card(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 3, color: Colors.pink.shade900),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        topRight: Radius.circular(25)),
                  ),
                  child: Form(
                    key: _key,
                    child: Column(
                      children: [
                        Padding(
                          //padding:  EdgeInsets.only(left:15.0,right: 15.0,top:0,bottom: 0),
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 25, 10, 10),
                            child: Padding(
                              padding: EdgeInsets.only(
                                  left: 0, right: 0, top: 0, bottom: 0),
                              child: TextFormField(
                                controller: nameController,
                                keyboardType: TextInputType.name,
                                cursorColor: Colors.amber,
                                decoration: InputDecoration(
                                  suffixIcon: Icon(LineIcons.userCircle),
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Colors.amber,
                                      width: 30,
                                    ),
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        bottomLeft: Radius.circular(25)),
                                  ),
                                  //labelStyle: TextStyle(color: Colors.amber),
                                  labelText: 'Adınız',
                                  hintText: 'Adınızı Yazınız...',
                                  hintStyle: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 0, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              controller: surnameController,
                              keyboardType: TextInputType.name,
                              cursorColor: Colors.amber,
                              decoration: InputDecoration(
                                suffixIcon: Icon(LineIcons.userCircle),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(25),
                                      bottomLeft: Radius.circular(25)),
                                ),
                                //labelStyle: TextStyle(color: Colors.amber),
                                labelText: 'Soyadınız',
                                hintText: 'Soyadınızı Giriniz...',
                                hintStyle: TextStyle(
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 0, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: emailController,
                                  keyboardType: TextInputType.emailAddress,
                                  cursorColor: Colors.amber,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.mail_outlined),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(25)),
                                    ),
                                    //labelStyle: TextStyle(color: Colors.amber),
                                    labelText: 'Email',
                                    hintText: 'Emalinizi Girin',
                                    hintStyle: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(10),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 0, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: Column(
                              children: [
                                TextFormField(
                                  controller: passwordController,
                                  cursorColor: Colors.amber,
                                  obscureText: _isObscure,
                                  decoration: InputDecoration(
                                    suffixIcon: IconButton(
                                        icon: Icon(_isObscure
                                            ? Icons.visibility_off_outlined
                                            : Icons.visibility_outlined),
                                        onPressed: () {
                                          setState(() {
                                            _isObscure = !_isObscure;
                                          });
                                        }),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(25),
                                          bottomLeft: Radius.circular(25)),
                                    ),
                                    //labelStyle: TextStyle(color: Colors.amber),
                                    labelText: 'Şifre',
                                    hintText: 'Şifrenizi Girin...',
                                    hintStyle: TextStyle(
                                      color: Colors.amber,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 10, 10, 25),
                          child: Padding(
                            padding: EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 0, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                                controller: reppasController,
                                cursorColor: Colors.amber,
                                obscureText: _isobscure,
                                decoration: InputDecoration(
                                  suffixIcon: IconButton(
                                      icon: Icon(_isobscure
                                          ? Icons.visibility_off_outlined
                                          : Icons.visibility_outlined),
                                      onPressed: () {
                                        setState(() {
                                          _isobscure = !_isobscure;
                                        });
                                      }),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.only(
                                        topRight: Radius.circular(25),
                                        bottomLeft: Radius.circular(25)),
                                  ),
                                  //labelStyle: TextStyle(color: Colors.amber),
                                  labelText: 'Şifre Tekrar',
                                  hintText: 'Şifrenizi Tekrar Girin',
                                  hintStyle: TextStyle(
                                    color: Colors.amber,
                                  ),
                                ),
                                validator: (val) {
                                  if (val != passwordController.text)
                                    return 'şifre aynı değil.';
                                  return null;
                                }),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Center(
                            child: Text(errorMessage,
                                style: TextStyle(color: Colors.red)),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 150,
                          decoration: BoxDecoration(
                            color: Colors.pink.shade900,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(25),
                                topRight: Radius.circular(25)),
                          ),
                          child: FlatButton(
                              shape: RoundedRectangleBorder(
                                side:
                                    BorderSide(width: 2.5, color: Colors.amber),
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(25),
                                    topRight: Radius.circular(25)),
                              ),
                              child: isLoading
                                  ? CircularProgressIndicator(
                                      color: Colors.amber,
                                      strokeWidth: 2,
                                    )
                                  : Text(
                                      'Kayit Ol',
                                      style: GoogleFonts.fugazOne(
                                        color: Colors.amber,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                              onPressed: () async {
                                setState(() {
                                  isLoading = true;
                                  errorMessage = '';
                                });
                                if (_key.currentState!.validate()) {
                                  try {
                                    await FirebaseAuth.instance
                                        .createUserWithEmailAndPassword(
                                          email: emailController.text,
                                          password: passwordController.text,
                                        )
                                        .then((_) => {
                                              Navigator.of(context)
                                                  .pushReplacement(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              HostHome()))
                                            });
                                    await FirebaseFirestore.instance
                                        .collection("users")
                                        .doc(user!.uid)
                                        .set({
                                      'name': nameController.text,
                                      'surname': surnameController.text,
                                      'email': emailController.text,
                                      'pasword': passwordController.text,
                                      'userid': user!.uid
                                    });
                                  } on FirebaseAuthException catch (error) {
                                    errorMessage = error.message!;
                                  }
                                  setState(() => isLoading = false);
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              FlatButton(
                onPressed: () => Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.leftToRight,
                    duration: Duration(milliseconds: 500),
                    child: Login(),
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.fromLTRB(0, 15, 0, 15),
                  child: Text(
                    'Zaten üye misiniz?',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: Colors.pink.shade900,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void onPressed() {}
String? validateEmail(String? formEmail) {
  if (formEmail == null || formEmail.isEmpty)
    return 'E-mail address is required.';

  String pattern = r'\w+@\w+\.\w+';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formEmail)) return 'Invalid E-mail Address format.';

  return null;
}

String? validatePassword(String? formPassword) {
  if (formPassword == null || formPassword.isEmpty)
    return 'Password is required.';

  String pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
  RegExp regex = RegExp(pattern);
  if (!regex.hasMatch(formPassword))
    return '''
      Password must be at least 8 characters,
      include an uppercase letter, number and symbol.
      ''';

  return null;
}

_dialogalert(context) {
  Alert(
      onWillPopActive: true,
      closeIcon: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 3, color: Colors.red),
          ),
          padding: EdgeInsets.all(2),
          child: Icon(Icons.close_outlined, size: 25, color: Colors.red)),
      style: AlertStyle(
        alertPadding: EdgeInsets.all(20),
        overlayColor: Colors.white,
        animationType: AnimationType.shrink,
        animationDuration: Duration(milliseconds: 600),
        alertBorder: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25), topRight: Radius.circular(25)),
          side: BorderSide(
            color: Colors.amber,
            width: 3,
          ),
        ),
      ),
      context: context,
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            children: [
              Icon(Icons.remove_circle_outline_outlined,
                  size: 60, color: Colors.red),
              Text(
                " Bazı bilgilerinizi eksik\ngirdiginizden dolayı kayıt\nişleminiz başarılı olmadı...",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ),
      buttons: [
        DialogButton(
          width: MediaQuery.of(context).size.height * 0.15,
          border: Border.all(width: 3, color: Colors.amber),
          color: Colors.pink.shade900,
          radius: BorderRadius.only(
              bottomLeft: Radius.circular(15), topRight: Radius.circular(15)),
          onPressed: () => Navigator.pop(context),
          child: Text(
            "Gonder",
            style: GoogleFonts.fugazOne(
              color: Colors.amber,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ]).show();
}
