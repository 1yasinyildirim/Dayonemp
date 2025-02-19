import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dayonemp/login/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dayonemp/pages/homepage.dart';
import 'package:dayonemp/pages/ilanver.dart';
import 'package:dayonemp/ilan/ilanlar.dart';
import 'package:dayonemp/chat/message.dart';
import 'package:dayonemp/konum/location.dart';
import 'login/login.dart';
import 'package:line_icons/line_icons.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:page_transition/page_transition.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class HostHome extends StatefulWidget {
  HostHome({Key? key}) : super(key: key);

  @override
  _HostHomeState createState() => _HostHomeState();
}

void displayBottomSheet(BuildContext context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25), topRight: Radius.circular(25)),
      ),
      context: context,
      builder: (ctx) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              Container(
                  child: Center(
                      child: Container(
                color: Colors.grey,
                width: 50,
                height: 3,
                margin: EdgeInsets.fromLTRB(0, 8, 0, 0),
              ))),
              SizedBox(height: 10),
              SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: InkWell(
                  onTap: () {},
                  child: Card(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                            width: 2,
                            color: Colors.pink.shade900,
                            style: BorderStyle.solid),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(25),
                            topRight: Radius.circular(25)),
                      ),
                      margin: EdgeInsets.all(8),
                      child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            ListTile(
                              leading: IconButton(
                                  icon: Icon(Icons.notifications_outlined,
                                      color: Colors.amber),
                                  onPressed: onPressed),
                              title: Text(
                                'Cihan Kuzudişli',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600),
                              ),
                              subtitle: Text(
                                'iş ilanınızı kabul etti tıklayıp görüşebilirsiniz...',
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ])),
                ),
              ),
            ],
          ),
        );
      });
}

class _HostHomeState extends State<HostHome> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    Anasayfa(),
    Konum(),
    Ilanver(),
    Message(),
    Ilani(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    var ad = "";
    var soyad = "";
    var mail = "";

    var currentUser = FirebaseAuth.instance.currentUser;

    if (currentUser != null) {
      print(currentUser.uid);
    }

    getter() {
      FirebaseFirestore.instance.collection("users").doc().get().then((gelen) {
        setState(() {});
      });
    }

    //GoogleSignInAccount? user = _googleSignIn.currentUser;

    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        //brightness: Brightness.dark,
      ),
      home: Scaffold(
        endDrawer: Container(
          width: MediaQuery.of(context).size.height * 0.3,
          height: double.maxFinite,
          child: Drawer(
            child: FutureBuilder<DocumentSnapshot>(
                future: users.doc(user!.uid).get(),
                builder: (BuildContext context,
                    AsyncSnapshot<DocumentSnapshot> snapshot) {
                    if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          return ListView(
                    padding: EdgeInsets.zero,
                    children: <Widget>[
                      UserAccountsDrawerHeader(
                        accountName: Text("${data['name']} ${data['surname']}"),
                        accountEmail: Text("${data['email']}"),
                        currentAccountPicture: CircleAvatar(
                          backgroundColor: Colors.pink.shade900,
                          child: Text(
                            "YY",
                            style: TextStyle(fontSize: 40.0),
                          ),
                        ),
                      ),
                      RaisedButton(
                        child: Text("Sign Out"),
                        onPressed: () {
                          auth.signOut();
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(builder: (context) => Login()),
                              (Route<dynamic> route) => false);
                        },
                      )
                    ],
                  );
        }
        return Text("loading");
                }),
          ),
        ),
        appBar: AppBar(
          actions: [
            Builder(
              builder: (context) => IconButton(
                icon: Icon(Icons.person_outline),
                onPressed: () => Scaffold.of(context).openEndDrawer(),
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
              ),
            ),
          ],
          iconTheme: IconThemeData(color: Colors.pink.shade900),
          //backgroundColor: Colors.amber,
          title: Center(
            child: Text(
              "Dayonemp",
              style: GoogleFonts.fugazOne(
                  color: Colors.pink.shade900,
                  fontSize: 35,
                  fontWeight: FontWeight.w600),
            ),
          ),
          leading: IconButton(
            onPressed: () => displayBottomSheet(context),
            icon: Icon(Icons.notifications_active_outlined),
            //color: Colors.pink.shade900,
          ),
        ),
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          height: 50,
          child: SafeArea(
            child: GNav(
              curve: Curves.easeInCubic,
              backgroundColor: Colors.amber,
              textStyle: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.pink.shade900),
              rippleColor: Colors.pink.shade800,
              hoverColor: Colors.amber, //pink.shade900,
              gap: 8,
              activeColor: Colors.pink.shade900,
              iconSize: 24,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              duration: Duration(milliseconds: 600),
              tabBackgroundColor: Colors.grey.shade300,
              color: Colors.pink.shade900,
              tabs: [
                GButton(
                  icon: LineIcons.home,
                  text: 'Anasayfa',
                ),
                GButton(
                  icon: LineIcons.alternateMapMarked,
                  text: 'Konum',
                ),
                GButton(
                  icon: Icons.post_add,
                  text: 'İlan Ver',
                ),
                GButton(
                  icon: LineIcons.weixinWechat,
                  text: 'Sohbet',
                ),
                GButton(
                  icon: LineIcons.alternateFile,
                  text: 'Başvurularım',
                ),
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
            ),
          ),
        ),
      ),
    );
  }
}

void onPressed() {}
