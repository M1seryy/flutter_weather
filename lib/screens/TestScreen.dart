import 'package:flutter/material.dart';

class ListOutPut extends StatelessWidget {
  ListOutPut({super.key});

  List<MenuItem> settingsItems = [
    MenuItem(title: "Settings", icon: Icons.settings),
    MenuItem(title: "Calls", icon: Icons.call_sharp),
    MenuItem(title: "Language", icon: Icons.language),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("List Setting"),
        backgroundColor: Colors.blueGrey,
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.blueGrey),
        width: double.infinity,
        child: SettingsMenu(settingsItems: settingsItems),

        // Container(
        //   width: 100,
        //   height: 100,
        //   decoration: const BoxDecoration(color: Colors.black),
        // ),
      ),
    );
  }
}

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({
    super.key,
    required this.settingsItems,
  });

  final List<MenuItem> settingsItems;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: settingsItems
            .map((element) => MenuItemWidget(data: element))
            .toList());
  }
}

class MenuItem {
  final String title;
  final IconData icon;

  MenuItem({required this.title, required this.icon});
}

class MenuItemWidget extends StatelessWidget {
  final MenuItem data;
  const MenuItemWidget({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          Icon(data.icon),
          SizedBox(
            width: 15,
          ),
          Expanded(child: Text(data.title)),
          Icon(Icons.chevron_right)
        ],
      ),
    );
  }
}
