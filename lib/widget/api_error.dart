import 'package:flutter/material.dart';

class ApiError extends StatelessWidget {
  const ApiError({
    Key? key,
    required this.errorMessage,
  }) : super(key: key);

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorMessage,
        textAlign: TextAlign.center,
        style: const TextStyle(
          color: Colors.red,
          fontSize: 18.0,
        ),
      ),
    );
  }
}