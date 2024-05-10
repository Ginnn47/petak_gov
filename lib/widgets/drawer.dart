import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cupertino_icons/cupertino_icons.dart';
import 'package:flutter/widgets.dart';
import 'package:pmob_petakgov/pages/navpages/bookmarks_page.dart';
import 'package:pmob_petakgov/pages/navpages/home_page.dart';
import 'package:pmob_petakgov/pages/navpages/my_page.dart';
import 'package:pmob_petakgov/pages/navpages/search_page.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          _drawerHeader(),
          _drawerItem(
            icon: Icons.folder,
            text: 'Project Gallery',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SearchPage()),
            ),
          ),
          _drawerItem(
            icon: CupertinoIcons.person,
            text: 'Profil Page',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => mypage()),
            ),
          ),
          _drawerItem(
            icon: Icons.access_time,
            text: 'Favorite Page',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BookmarksPage()),
            ),
          ),
          _drawerItem(
            icon: CupertinoIcons.house_alt,
            text: 'Home Page',
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            ),
          ),
          Divider(height: 25, thickness: 1),
          Padding(
            padding: const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
            child: Text("Miscleanous",
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black54,
                )),
          ),
          _drawerItem(
              icon: CupertinoIcons.gear,
              text: 'Setting',
              onTap: () => print('Menu Pemrograman Moble')),
        ],
      ),
    );
  }
}

Widget _drawerHeader() {
  return UserAccountsDrawerHeader(
    currentAccountPicture: ClipOval(
      child: Image(image: AssetImage('img/adel.jpg'), fit: BoxFit.cover),
    ),
    accountName: Text('Reva Fidela'),
    accountEmail: Text('RevaAdel-JKT48@gmail.com'),
    decoration: BoxDecoration(
      image: DecorationImage(
        image: AssetImage(
            'img/see.png'), // Ganti dengan path gambar latar belakang
        fit: BoxFit.cover,
      ),
    ),
  );
}

Widget _drawerItem({IconData? icon, String? text, GestureTapCallback? onTap}) {
  return ListTile(
    title: Row(
      children: <Widget>[
        Icon(icon),
        Padding(
          padding: EdgeInsets.only(left: 25.0),
          child: Text(
            text ?? '',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
    onTap: onTap,
  );
}
