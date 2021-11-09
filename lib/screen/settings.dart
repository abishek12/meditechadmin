import 'package:flutter/material.dart';
import 'package:medi_tect_admin/widgets/custom_appbar.dart';
import 'package:medi_tect_admin/widgets/settings.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar("Settings"),
      body: ListView(
        children: [
          SettingsContent(
            title: "Wifi",
            value: false,
          ),
          SettingsContent(
            title: "Dark Mode",
            value: false,
          ),
          SettingsContent(
            title: "Notification",
            value: true,
          ),
        ],
      ),
    );
  }
}
