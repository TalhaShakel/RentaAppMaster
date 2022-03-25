import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sherd extends StatefulWidget {
  const sherd({Key? key}) : super(key: key);

  @override
  State<sherd> createState() => _sherdState();
}

TextEditingController kaddu = TextEditingController();

class _sherdState extends State<sherd> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextFormField(
              controller: kaddu,
            ),
            ElevatedButton(
                onPressed: () async {
                  print(kaddu.text);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setString('action', kaddu.text.toString());
                },
                child: Text("data")),
            ElevatedButton(
                onPressed: () async {
                  final prefs = await SharedPreferences.getInstance();
                  final String? action = prefs.getString('action');
                  print("poka" + action.toString());
                },
                child: Text("data")),
          ],
        ),
      ),
    );
  }
}
