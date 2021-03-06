import 'package:flutter/material.dart';
import 'package:meals/screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget _buildListTile(
      {String titleText, IconData iconData, Function handler}) {
    return ListTile(
      leading: Icon(
        iconData,
        size: 26,
      ),
      title: Text(
        titleText,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: handler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          _buildListTile(
            titleText: 'Meals',
            iconData: Icons.restaurant,
            handler: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          _buildListTile(
            titleText: 'Filters',
            iconData: Icons.filter_list,
            handler: () {
              Navigator.of(context)
                  .pushReplacementNamed(FiltersScreen.routeName);
            },
          ),
        ],
      ),
    );
  }
}
