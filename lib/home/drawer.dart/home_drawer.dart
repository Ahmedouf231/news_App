import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  Function onSideMenuItemClick;
  HomeDrawer({super.key, required this.onSideMenuItemClick});
  static const categories = 1;
    static const settings = 2;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
                vertical: MediaQuery.of(context).size.height * 0.1),
            width: double.infinity,
            child: Text(
              "News App!",
              textAlign: TextAlign.center,
            ),
            color: Colors.green,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: InkWell(
              onTap: () {
                onSideMenuItemClick(categories);
              },
              child: Row(
                children: [
                  Icon(Icons.list),
                  Text(
                    "Categories",
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
