import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class PasswordUpdate extends StatefulWidget {
  const PasswordUpdate({super.key});

  @override
  State<PasswordUpdate> createState() => _PasswordUpdateState();
}

class _PasswordUpdateState extends State<PasswordUpdate> {
  bool _isHidden = true;
  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      appBar: AppBar(title: Text("deneme"),),
      body: Column(
        children: [
          ElevatedButton(
    onPressed: () {
          setState(() {
            _isHidden = !_isHidden;
          });
    },
    child: Container(
          child: _isHidden ? Container() : Text("This is some text"),
    ),
  ),
        ],
      ),
    );
  }
}