import 'package:flutter/material.dart';

String name = "Villa";
String ozellik = "2+18";
String ayrinti = "1M € Muğla";
bool isActive = true;
String loc = "assets/villa.jpg";

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this, initialIndex: 0);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.teal[100],
            child: TabBar(
              labelStyle: TextStyle(fontSize: 6),
              controller: _tabController,
              tabs: [
                
                Tab(
                  text: "RESERVATIONS",
                ),
                Tab(
                  text: "ADD RESERVATION",
                ),
                Tab(
                  text: "MY PROFILE",
                ),
                Tab(
                  text: "CUSTOMER CONTACT",
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          Reservation(),
          _addReservation(Colors.black),
          _addReservation(Colors.pink),
          _addReservation(Colors.yellow)
        ],
      ),
    );
  }

  _addReservation(Color colors) {
    return Container(
      color: colors,
    );
  }
}

class Reservation extends StatefulWidget {
  @override
  _ReservationState createState() => _ReservationState();
}

class _ReservationState extends State<Reservation> with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(100),
        child: SafeArea(
          child: Container(
            padding: EdgeInsets.all(15),
            color: Colors.teal[100],
            child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: "RESERVATION",
                ),
                Tab(
                  text: "DETAILS",
                ),
                Tab(
                  text: "DISABLED",
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          isActive ? _reservation() : Text(" "),
          _longReservation(),
          isActive ? Text(" ") : _reservation(),
        ],
      ),
    );
  }

  _reservation() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(name + " " + ozellik),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Image.asset(loc),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "DETAILS",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                                    showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text("DETAILS"),
                        content: new Text(
                          "Ultra lüx toplam 20 odalı bu ev Marmaris bölgesinde bulunmaktadır",
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Kapat"),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    },
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  "CLOSE RESERVATION",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.pink,
                onPressed: () {
                  setState(() {
                    isActive = !isActive;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  _longReservation() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                name,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                ozellik,
                style: TextStyle(fontSize: 20),
              ),
              Text(
                ayrinti,
                style: TextStyle(fontSize: 20),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            child: Image.asset(loc),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  "LONG DETAILS",
                  style: TextStyle(color: Colors.white),
                ),
                color: Colors.blue,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: new Text("LONG DETAILS"),
                        content: new Text(
                          "Muğla ilimizin Marmaris ilçesinde bulunan bu villa tam 18 kişisel odaya ve 2 adet oturma odasına sahiptir. Denize 700 metre bulunan evinizde havuza girerek bile serinleyebilirsiniz! Bu mükemmel özelliklere sadece ve sadece 1 milyon Euro karşılığında ulaşabilirsiniz!",
                        ),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Kapat"),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

