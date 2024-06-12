import 'package:flutter/material.dart';

class CustomeTextFiled extends StatelessWidget {
  const CustomeTextFiled({
    super.key,
    required TextEditingController firstNumberController,
    required this.hintText,
    required this.labelText,
  }) : _firstNumberController = firstNumberController;
  final String hintText;
  final String labelText;
  final TextEditingController _firstNumberController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              20,
            ),
          ),
        ),
        filled: true,
        hintText: hintText,
        label: Text(
          labelText,
          style: const TextStyle(fontFamily: 'Inter'),
        ),
      ),
      controller: _firstNumberController,
    );
  }
}
