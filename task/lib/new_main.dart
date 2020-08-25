import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'MainPage.dart';

class New_main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: true,
      home: _Mew_main(),
    );
  }
}

class _Mew_main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Stack(
          children: <Widget>[
            _ust_bg(context),
            _alt_bg(context),
            _rezervs_and_buttons(context),
            _header(context),
          ],
        ),
      ),
    );
  }
}

_header(context) {
  return Positioned(
    top: MediaQuery.of(context).size.height * 0.05,
    left: MediaQuery.of(context).size.width * 0.045,
    right: MediaQuery.of(context).size.width * 0.045,
    child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.width * 0.03,
      ),
      child: _topmenu(context),
    ),
  );
}

_rezervs_and_buttons(context) {
  return Positioned(
    child: Padding(
      padding: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.18,
          left: MediaQuery.of(context).size.width * 0.075,
          right: MediaQuery.of(context).size.width * 0.075,
          bottom: MediaQuery.of(context).size.height * 0.0005),
      child: _middlemenu(MediaQuery.of(context).size.height,
          MediaQuery.of(context).size.width, context),
    ),
  );
}

_alt_bg(context) {
  return Positioned(
    bottom: -3,
    child: Container(
      color: Color(0xFF3f749e),
      child: ClipPath(
        clipper: CustomHalfCircleClipper(),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.30,
          width: MediaQuery.of(context).size.width,
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.white),
            color: Colors.white,
          ),
        ),
      ),
    ),
  );
}

_ust_bg(context) {
  return Positioned(
    child: Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xFF3f749e),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(40),
          bottomRight: Radius.circular(40),
        ),
      ),
    ),
  );
}

_middlemenu(double screenHeight, double screenWidth, context) {
  return Column(
    children: <Widget>[
      Container(
        height: screenHeight * 0.58,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              spreadRadius: 3,
              color: Colors.grey,
              offset: Offset(3.0, 3.0),
            )
          ],
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.127, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Icon(
                    Icons.watch_later,
                    size: 30,
                    color: Color(0xFF3f749e),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      "Son Rezervler",
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF3f749e),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal:  MediaQuery.of(context).size.width * 0.096),
              child: Container(
                height: screenHeight * 0.48,
                child: ListView.builder(
                    itemCount: 20,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(Icons.check_circle_outline),
                        title: Text("Batuhan Erkan"),
                        subtitle: Text("07.12.1999-24.08.2020"),
                      );
                    }),
              ),
            )
          ],
        ),
      ),
      Container(
        padding: EdgeInsets.only(bottom: screenHeight * 0.0015),
        child: FlatButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => MainPage()),
            );
          },
          child: Text(
            "Devamını Görüntüle",
            style: TextStyle(color: Colors.grey),
          ),
        ),
      ),
      Padding(
        padding: EdgeInsets.only(top: 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            button_home(),
            button_menu(),
            button_add(),
            button_group(),
            button_hotel(),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(
            left: screenWidth * 0.275,
            right: screenWidth * 0.275,
            top: screenHeight * 0.03),
        child: Container(
          height: 5,
          color: Colors.white,
        ),
      ),
    ],
  );
}

_topmenu(context) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.10,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
      color: Color(0xFF2d506e),
      borderRadius: BorderRadius.circular(15),
    ),
    child: Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 7),
            child: Text(
              "Rezerva | Rezervasyon Sistemi",
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9),
              color: Color(0xFF3f749e),
            ),
            child: IconButton(
              icon: Icon(Icons.menu),
              color: Colors.white,
              onPressed: () {},
            ),
          )
        ],
      ),
    ),
  );
}

button_home() {
  return CircleAvatar(
      radius: 20,
      backgroundColor: Colors.teal.shade900,
      child: CircleAvatar(
        radius: 19,
        backgroundColor: Colors.white.withOpacity(0.9),
        child: IconButton(
          icon: Icon(Icons.home),
          onPressed: () {},
        ),
      ));
}

button_menu() {
  return CircleAvatar(
    radius: 25,
    backgroundColor: Colors.white.withOpacity(0.9),
    child: IconButton(
      icon: Icon(Icons.menu),
      onPressed: () {},
    ),
  );
}

button_add() {
  return CircleAvatar(
    radius: 30,
    backgroundColor: Colors.white.withOpacity(0.9),
    child: IconButton(
      icon: Icon(Icons.add),
      onPressed: () {},
    ),
  );
}

button_group() {
  return CircleAvatar(
    radius: 25,
    backgroundColor: Colors.white.withOpacity(0.9),
    child: IconButton(
      icon: Icon(Icons.group),
      onPressed: () {},
    ),
  );
}

button_hotel() {
  return CircleAvatar(
    radius: 20,
    backgroundColor: Colors.white.withOpacity(0.9),
    child: IconButton(
      icon: Icon(Icons.hotel),
      onPressed: () {},
    ),
  );
}

class CustomHalfCircleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final Path path = new Path();
    path.lineTo(0, size.height * 0.60);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
