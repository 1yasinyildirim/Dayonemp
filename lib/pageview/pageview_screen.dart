import 'package:dayonemp/login/register.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:dayonemp/home.dart';
import 'slider.dart';

class Pageviewing extends StatefulWidget {
  @override
  _PageviewingState createState() => _PageviewingState();
}

class _PageviewingState extends State<Pageviewing> {
  int _currentPage = 0;
  PageController _controller = PageController();

  List<Widget> _pages = [
    SliderPage(
      title: "Dayonemp Nedir?\nNe Amaçla Kullanılmaktadır?",
      description:
            "Bu uygulama sadece geçici işler için kullanılabilir. Kalıcı işler için kullanılamaz.\nBu uygulama sayesinde kısa süreliğine bile olsa para kazanabileceksiniz ve bu kalkınmaya da yol açmaktadır",
        image: ""),
    SliderPage(
        title: "Uygulama Hakkında",
        description:
            "Bu uygulamada karışıklığın önlenmesi için 3 çeşit kullanıcı bulunmaktadır. Bunlar Admin, İşveren ve İşci dir.\nAdmin sadece İşveren in verdiği ilanları Onaylayabilecek veya Reddedebilecek. ve bunun dışında sohbet ve sesli arama özelliklerini de kullanabilecek.",
        image: ""),
    SliderPage(
        title: "Özellikleri",
        description:
            "Sesli arama\nMesajlaşma\nYakın Konum\n 3 çeşit Kullanıcı",
        image: ""),
  ];

  _onchanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          PageView.builder(
            scrollDirection: Axis.horizontal,
            onPageChanged: _onchanged,
            controller: _controller,
            itemCount: _pages.length,
            itemBuilder: (context, int index) {
              return _pages[index];
            },
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(_pages.length, (int index) {
                    return AnimatedContainer(
                        duration: Duration(milliseconds: 300),
                        height: 10,
                        width: (index == _currentPage) ? 30 : 10,
                        margin:
                            EdgeInsets.symmetric(horizontal: 5, vertical: 30),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: (index == _currentPage)
                                ? Colors.amber
                                : Colors.amber.withOpacity(0.5)));
                  })),
              InkWell(
                onTap: () {
                  _controller.nextPage(
                      duration: Duration(milliseconds: 800),
                      curve: Curves.easeInOutQuint);
                },
                child: AnimatedContainer(
                  alignment: Alignment.center,
                  duration: Duration(milliseconds: 300),
                  height: 70,
                  width: (_currentPage == (_pages.length - 1)) ? 200 : 75,
                  decoration: BoxDecoration(
                      color: Colors.amber[200],
                      borderRadius: BorderRadius.circular(35)),
                  child: (_currentPage == (_pages.length - 1))
                      ? FlatButton(
                          onPressed: () => Navigator.push(
                            context,
                            PageTransition(
                              type: PageTransitionType.rightToLeft,
                              duration: Duration(milliseconds: 500),
                              child: Register(),
                            ),
                          ),
                          child: Text(
                            "Ilerle",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        )
                      : Icon(
                          Icons.navigate_next,
                          size: 50,
                          color: Colors.white,
                        ),
                ),
              ),
              SizedBox(
                height: 50,
              )
            ],
          ),
        ],
      ),
    );
  }
}