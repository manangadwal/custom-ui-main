// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last, avoid_unnecessary_containers, unnecessary_new, camel_case_types, sized_box_for_whitespace, non_constant_identifier_names, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svgProvider;
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  PageController _pageController = PageController();

  int idx = 0;

  List<CustomWidgetData> firstColumn = [
    CustomWidgetData(
        title: 'Drei einfache Schritte \nzu deinem neuen Job',
        number: '1.',
        description: '\n\n\n Erstellen dein Lebenslauf',
        image: 'assets/2.svg'),
    CustomWidgetData(
        title: 'Drei einfache Schritte \nzu deinem neuen Mitarbeiter',
        number: '1.',
        description: '\n\n\n Erstellen dein \nunternehmensprofil',
        image: 'assets/2.svg'),
    CustomWidgetData(
        title: 'Drei einfache Schritte zur \n Vermittlung neuer Mitarbeiter',
        number: '1.',
        description: '\n\n\n Erstellen dein Lebenslauf',
        image: 'assets/2.svg'),
  ];
  List<CustomWidgetData> secondColumn = [
    CustomWidgetData(
        number: '2.',
        description: '\n\n\n Erstellen dein Lebenslauf',
        image: 'assets/2/1.svg'),
    CustomWidgetData(
        number: '2.',
        description: '\n\n\n Erstellen ein Jobinserat',
        image: 'assets/2/2.svg'),
    CustomWidgetData(
        number: '2.',
        description: '\n\n\n Erhalte Vermittlungs- \nangebot von Arbeitgeber',
        image: 'assets/2/3.svg'),
  ];
  List<CustomWidgetData> thirdColumn = [
    CustomWidgetData(
        number: '3.',
        description: '\n\n\n Mit nur einem Klick \n bewerben',
        image: 'assets/3/1.svg'),
    CustomWidgetData(
        number: '3.',
        description: '\n\n\n Wähle deinen \n neuen Mitarbeiter aus',
        image: 'assets/3/2.svg'),
    CustomWidgetData(
        number: '3.',
        description: '\n\n\n Vermittlung nach \n Provision oder \n Stundenlohn',
        image: 'assets/3/3.svg'),
  ];

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
      viewportFraction: 0.55,
    )..addListener(() {
        setState(() {
          idx = _pageController.page!.round();
        });
      });

    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 6,
            titleSpacing: 0,
            backgroundColor: Colors.white,
            title: Container(
              decoration: BoxDecoration(
                // color: Colors.transparent,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(16),
                  bottomRight: Radius.circular(16),
                ),
              ),
              height: 70,
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        Color(0xff319795),
                        Color(0xff3182CE),
                      ]),
                    ),
                    height: 12,
                    width: MediaQuery.of(context).size.width,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Spacer(),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "  Login    ",
                          style: TextStyle(
                              color: Color(0xff319795),
                              fontSize: 13,
                              fontWeight: FontWeight.w300),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(16),
              bottomRight: Radius.circular(16),
            )),
          ),
          bottomNavigationBar: MediaQuery.of(context).size.width < 689
              ? customBottomNavigationBar()
              : null,
          body: Container(
            child: Column(
              children: [
                Expanded(
                    child: MediaQuery.of(context).size.width < 689
                        ? HomeBody(context)
                        : HomeBodyWeb(context)),
              ],
            ),
          )),
    );
  }

  Widget HomeBodyWeb(context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        ClipPath(
          clipper: WaveClipperTwo(),
          child: Container(
            alignment: Alignment.topCenter,
            width: MediaQuery.of(context).size.width,
            color: Color(0xffE6FFFA),
            height: MediaQuery.of(context).size.height / 1.8,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Deine Job \nwebsite',
                      style:
                          TextStyle(fontSize: 42, fontWeight: FontWeight.w500),
                      textAlign: TextAlign.left,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      alignment: Alignment.center,
                      child: Text(
                        "Kostenlos Registrieren",
                        style: TextStyle(color: Colors.white),
                      ),
                      height: 40,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            Color(0xff319795),
                            Color(0xff3182CE),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(13),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 70,
                ),
                FittedBox(
                  child: LimitedBox(
                    maxHeight: 320,
                    maxWidth: 320,
                    child: Container(
                      height: 320,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          image: svgProvider.Svg('assets/1.svg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 45,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                    ),
                    hoverColor: Color(0xff81E6D9).withOpacity(0.5),
                    splashColor: Color(0xff81E6D9),
                    onTap: () {
                      setState(() {
                        idx = 0;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Arbeitnehmer",
                        style: TextStyle(
                            fontSize: 17,
                            color: idx == 0 ? Colors.white : Color(0xff319795)),
                      ),
                      width: 215,
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                            idx == 0 ? Color(0xff81E6D9) : Colors.transparent,
                        border: Border.all(
                          color: Color(0xffCBD5E0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    hoverColor: Color(0xff81E6D9).withOpacity(0.5),
                    splashColor: Color(0xff81E6D9),
                    onTap: () {
                      setState(() {
                        idx = 1;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Arbeitgeber",
                        style: TextStyle(
                            fontSize: 17,
                            color: idx == 1 ? Colors.white : Color(0xff319795)),
                      ),
                      width: 215,
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                            idx == 1 ? Color(0xff81E6D9) : Colors.transparent,
                        border: Border.all(
                          color: Color(0xffCBD5E0),
                          width: 1,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                    hoverColor: Color(0xff81E6D9).withOpacity(0.5),
                    splashColor: Color(0xff81E6D9),
                    onTap: () {
                      setState(() {
                        idx = 2;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        "Temporärbüro",
                        style: TextStyle(
                            fontSize: 17,
                            color: idx == 2 ? Colors.white : Color(0xff319795)),
                      ),
                      width: 215,
                      height: 40,
                      decoration: BoxDecoration(
                        color:
                            idx == 2 ? Color(0xff81E6D9) : Colors.transparent,
                        border: Border.all(
                          color: Color(0xffCBD5E0),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(15),
                          bottomRight: Radius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      firstColumn[idx].title as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff4A5568),
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Container(
                              height: 220,
                              width: 220,
                              child: SvgPicture.asset(
                                "assets/2.svg",
                                fit: BoxFit.contain,
                              )),
                        ),
                        Align(
                          alignment: AlignmentDirectional.bottomCenter,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 180.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("1.",
                                    style: GoogleFonts.lato(
                                      fontSize: 150,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff718096),
                                    )),
                                Text(firstColumn[idx].description,
                                    style: TextStyle(
                                      fontSize: 19,
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff718096),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              ClipPath(
                clipper: customClipperContainerTwo(),
                child: Container(
                  padding: EdgeInsets.only(top: 45),
                  color: Color(0xffE6FFFA),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: LimitedBox(
                            maxHeight: 200,
                            maxWidth: 200,
                            child: SvgPicture.asset(secondColumn[idx].image)),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("2.",
                              style: GoogleFonts.lato(
                                fontSize: 120,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff718096),
                              )),
                          Text(secondColumn[idx].description,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff718096),
                              )),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              ClipPath(
                clipper: customClipperContainer(),
                child: Container(
                  height: 120,
                  color: Color(0xffE6FFFA),
                ),
              ),
              Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      right: 190.0,
                    ),
                    child: Container(
                      height: 190,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.1),
                          shape: BoxShape.circle),
                    ),
                  ),
                  Container(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("3.",
                              style: GoogleFonts.lato(
                                fontSize: 150,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff718096),
                              )),
                          Text(thirdColumn[idx].description,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff718096),
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 50),
                        child: LimitedBox(
                            maxHeight: 200,
                            maxWidth: 200,
                            child: SvgPicture.asset(thirdColumn[idx].image)),
                      ),
                      SizedBox(
                        height: 50,
                      )
                    ],
                  )),
                ],
              )
            ],
          ),
        )
      ]),
    );
  }

  Widget HomeBody(context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(children: [
        ClipPath(
          clipper: customClipperContainer(),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(
              top: 20,
            ),
            color: Color(0xffE6FFFA),
            height: MediaQuery.of(context).size.height - 60,
            child: Column(
              children: [
                Text(
                  'Deine Job \nwebsite',
                  style: TextStyle(fontSize: 42, fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  child: LimitedBox(
                    maxWidth: 850,
                    maxHeight: 850,
                    child: SvgPicture.asset(
                      "assets/1.svg",
                      allowDrawingOutsideViewBox: true,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 5),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 45,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                child: PageView(
                    padEnds: true,
                    controller: _pageController,
                    scrollDirection: Axis.horizontal,
                    children: [
                      InkWell(
                        hoverColor: Color(0xff81E6D9).withOpacity(0.5),
                        splashColor: Color(0xff81E6D9),
                        onTap: () {
                          _pageController.animateToPage(
                            0,
                            curve: Curves.easeIn,
                            duration: Duration(milliseconds: 500),
                          );
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Arbeitnehmer",
                            style: TextStyle(
                                fontSize: 17,
                                color: idx == 0
                                    ? Colors.white
                                    : Color(0xff319795)),
                          ),
                          width: double.maxFinite,
                          height: 40,
                          decoration: BoxDecoration(
                            color: idx == 0
                                ? Color(0xff81E6D9)
                                : Colors.transparent,
                            border: Border.all(
                              color: Color(0xffCBD5E0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        hoverColor: Color(0xff81E6D9).withOpacity(0.5),
                        splashColor: Color(0xff81E6D9),
                        onTap: () {
                          _pageController.animateToPage(1,
                              curve: Curves.easeIn,
                              duration: Duration(milliseconds: 500));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Arbeitgeber",
                            style: TextStyle(
                                fontSize: 17,
                                color: idx == 1
                                    ? Colors.white
                                    : Color(0xff319795)),
                          ),
                          width: double.maxFinite,
                          height: 40,
                          decoration: BoxDecoration(
                            color: idx == 1
                                ? Color(0xff81E6D9)
                                : Colors.transparent,
                            border: Border.all(
                              color: Color(0xffCBD5E0),
                              width: 1,
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        hoverColor: Color(0xff81E6D9).withOpacity(0.5),
                        splashColor: Color(0xff81E6D9),
                        onTap: () {
                          _pageController.animateToPage(2,
                              curve: Curves.easeIn,
                              duration: Duration(milliseconds: 500));
                        },
                        child: Container(
                          alignment: Alignment.center,
                          child: Text(
                            "Temporärbüro",
                            style: TextStyle(
                                fontSize: 17,
                                color: idx == 2
                                    ? Colors.white
                                    : Color(0xff319795)),
                          ),
                          width: double.maxFinite,
                          height: 40,
                          decoration: BoxDecoration(
                            color: idx == 2
                                ? Color(0xff81E6D9)
                                : Colors.transparent,
                            border: Border.all(
                              color: Color(0xffCBD5E0),
                              width: 1,
                            ),
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15),
                            ),
                          ),
                        ),
                      ),
                    ]),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                child: Column(
                  children: [
                    Text(
                      firstColumn[idx].title as String,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff4A5568),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 25.0),
                      child: LimitedBox(
                          maxHeight: 200,
                          maxWidth: 200,
                          child: SvgPicture.asset("assets/2.svg")),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("1.",
                            style: GoogleFonts.lato(
                              fontSize: 150,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff718096),
                            )),
                        Text(firstColumn[idx].description,
                            style: TextStyle(
                              fontSize: 19,
                              fontWeight: FontWeight.w400,
                              color: Color(0xff718096),
                            )),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ClipPath(
                clipper: customClipperContainerTwo(),
                child: Container(
                  color: Color(0xffE6FFFA),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("2.",
                              style: GoogleFonts.lato(
                                fontSize: 150,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff718096),
                              )),
                          Text(secondColumn[idx].description,
                              style: TextStyle(
                                fontSize: 19,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff718096),
                              )),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: LimitedBox(
                            maxHeight: 200,
                            maxWidth: 200,
                            child: SvgPicture.asset(secondColumn[idx].image)),
                      ),
                    ],
                  ),
                ),
              ),
              ClipPath(
                clipper: customClipperContainer(),
                child: Container(
                  height: 120,
                  color: Color(0xffE6FFFA),
                ),
              ),
              Container(
                  child: Column(
                children: [
                  Row(
                    // crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("3.",
                          style: GoogleFonts.lato(
                            fontSize: 150,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff718096),
                          )),
                      Text(thirdColumn[idx].description,
                          style: TextStyle(
                            fontSize: 19,
                            fontWeight: FontWeight.w400,
                            color: Color(0xff718096),
                          )),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: LimitedBox(
                        maxHeight: 200,
                        maxWidth: 200,
                        child: SvgPicture.asset(thirdColumn[idx].image)),
                  ),
                  SizedBox(
                    height: 50,
                  )
                ],
              ))
            ],
          ),
        )
      ]),
    );
  }

  Widget customBottomNavigationBar() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 3,
          ),
        ],
      ),
      child: InkWell(
        child: Card(
          margin: EdgeInsets.all(0),
          borderOnForeground: false,
          elevation: 6,
          shadowColor: Colors.black,
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            topLeft: Radius.circular(15),
          )),
          child: Container(
              margin: EdgeInsets.only(top: 22, bottom: 22, left: 20, right: 20),
              color: Colors.white,
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "Kostenlos Registrieren",
                  style: TextStyle(color: Colors.white),
                ),
                height: 40,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xff319795),
                      Color(0xff3182CE),
                    ],
                  ),
                  borderRadius: BorderRadius.circular(13),
                ),
              )),
        ),
      ),
    );
  }
}

class customClipperContainer extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // ignore: todo
    // TODO: implement getClip
    var path = new Path();
    path.lineTo(0.0, size.height - 20);

    var firstControlPoint = Offset(size.width / 6, size.height - 15);
    var firstEndPoint = Offset(size.width / 2.9, size.height - 45.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 105);
    var secondEndPoint = Offset(size.width, size.height - 85);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class customClipperContainerTwo extends CustomClipper<Path> {
  @override
  getClip(Size size) {
    // ignore: todo
    // TODO: implement getClip

    Offset firstEndPoint = Offset(size.width * .5, 40);
    Offset firstControlPoint = Offset(size.width * .25, 38);
    Offset secondEndPoint = Offset(size.width, 3);
    Offset secondControlPoint = Offset(size.width * .75, 38);

    final path = Path()
      ..quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
          firstEndPoint.dx, firstEndPoint.dy)
      ..quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
          secondEndPoint.dx, secondEndPoint.dy)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}

class CustomWidgetData {
  String? title;
  final String number;
  final String description;
  final String image;

  CustomWidgetData(
      {required this.number,
      this.title,
      required this.description,
      required this.image});
}
