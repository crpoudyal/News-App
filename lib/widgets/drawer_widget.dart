import 'package:News_API/services/dio_service.dart';
import 'package:flutter/material.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  DioService dioService = DioService();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: const [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.blue),
            accountName: Text(
              "crpoudyal",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            accountEmail: Text(
              "crpoudyal@gmail.com",
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            currentAccountPicture: FlutterLogo(),
          ),
        ],
      ),
    );
  }
}
