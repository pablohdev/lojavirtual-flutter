import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:lojavirtual/models/page_manager.dart';

class DrawerTile extends StatelessWidget {
  DrawerTile({
    required this.iconData,
    required this.title,
    required this.page,
  });

  final IconData iconData;
  final String title;
  final int page;

  @override
  Widget build(BuildContext context) {
    final int currentPage = context.watch<PageManager>().page;

    return InkWell(
      onTap: () {
        context.read<PageManager>().setPage(page);
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Icon(
                iconData,
                size: 32,
                color: currentPage == page ? Colors.red : Colors.grey[700],
              ),
            ),
            Text(title,
                style: TextStyle(
                  fontSize: 16,
                  color: currentPage == page ? Colors.red : Colors.grey[700],
                ))
          ],
        ),
      ),
    );
  }
}