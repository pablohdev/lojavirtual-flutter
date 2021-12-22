import 'package:flutter/material.dart';
import 'package:lojavirtual/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text('Drawer Header'),
          ),
          DrawerTile(iconData: Icons.home, title: 'Início', page: 0),
          DrawerTile(iconData: Icons.list, title: 'Produto', page: 1),
          DrawerTile(
              iconData: Icons.playlist_add_check,
              title: 'Meus pedidos',
              page: 2),
          DrawerTile(iconData: Icons.location_on, title: 'Lojas', page: 3),
        ],
      ),
    );
  }
}
