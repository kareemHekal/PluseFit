import 'package:fit_zone/core/utils/string_manager.dart';
import 'package:flutter/material.dart';

class SmartCoachDrawer extends StatelessWidget {
  const SmartCoachDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Text(AppStrings.previousConversations),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: null,
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: null,
          ),
        ],
      ),
    );
  }
}
