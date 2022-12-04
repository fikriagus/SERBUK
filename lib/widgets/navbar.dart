import 'dart:math';
import 'package:blocauth/provider/books.dart';
import 'package:blocauth/screens/bookshelf_screen.dart';
import 'package:blocauth/screens/home_screen.dart';
import 'package:blocauth/screens/profile_screen.dart';
import 'package:blocauth/screens/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class NavBar extends StatefulWidget {
  final String currentRoute;

  NavBar(this.currentRoute);

  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  bool openNav = true;

  @override
  Widget build(BuildContext context) {
    final height = min(MediaQuery.of(context).size.height * 0.09, 60.0);
    final width = min(
        openNav
            ? MediaQuery.of(context).size.width * 0.7
            : MediaQuery.of(context).size.width * 0.2,
        250.0);
    return Container(
      height: height,
      width: width,
      child: Row(
        children: <Widget>[
          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(15),
              ),
            ),
            color: Colors.white,
            elevation: 4,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                if (openNav)
                  NavbarButton(Icons.person, ProfileScreen.routeName,
                      widget.currentRoute),
                if (openNav)
                  NavbarButton(Icons.bookmark, BookShelfScreen.routeName,
                      widget.currentRoute),
                if (openNav)
                  NavbarButton(
                      Icons.home, HomeScreen.routeName, widget.currentRoute),
                if (openNav)
                  NavbarButton(Icons.search, SearchScreen.routeName,
                      widget.currentRoute),
              ],
            ),
          ),
          Container(
            width: 42,
            child: FloatingActionButton(
              backgroundColor: Colors.white,
              child: Icon(
                openNav ? Icons.chevron_right : Icons.chevron_left,
                color: Colors.orangeAccent,
              ),
              onPressed: () {
                setState(() {
                  openNav = !openNav;
                });
              },
            ),
          )
        ],
      ),
    );
  }
}

class NavbarButton extends StatelessWidget {
  final IconData icon;
  final String route;
  final String currentRoute;

  NavbarButton(this.icon, this.route, this.currentRoute);

  @override
  Widget build(BuildContext context) {
    final books = Provider.of<Books>(context, listen: false);
    return IconButton(
      icon: Icon(icon),
      color: Colors.orangeAccent,
      onPressed: () {
        if (currentRoute == route) return;
        Navigator.of(context).pushReplacementNamed(route);
        books.setFirstLoad(true);
      },
    );
  }
}
