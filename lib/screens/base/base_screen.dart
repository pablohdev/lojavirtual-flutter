import 'package:flutter/material.dart';
import 'package:lojavirtual/models/page_manager.dart';
import 'package:lojavirtual/screens/login/login_screen.dart';
import 'package:provider/provider.dart';
import 'package:lojavirtual/common/custom_drawer/custom_drawer.dart';

class BaseScreen extends StatelessWidget {
  BaseScreen({Key? key}) : super(key: key);

  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManager(pageController),
      child: PageView(
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: <Widget>[
            LoginScreen(),
            Scaffold(
              drawer: const CustomDrawer(),
              appBar: AppBar(
                title: const Text('Produtos'),
              ),
            ),
            Scaffold(
              drawer: const CustomDrawer(),
              appBar: AppBar(
                title: const Text('Meus pedidos'),
              ),
            ),
            Scaffold(
              drawer: const CustomDrawer(),
              appBar: AppBar(
                title: const Text('Lojas'),
              ),
            ),
          ]),
    );
  }
}
