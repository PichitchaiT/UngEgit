// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ShowFrom extends StatelessWidget {
  final String hint;
  final IconData iconData;
  final Function(String) changefung;
  const ShowFrom({
    Key? key,
    required this.hint,
    required this.iconData,
    required this.changefung,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(onChanged: changefung,
      decoration: InputDecoration(
        suffixIcon: Icon(iconData),
        hintText: hint,
        contentPadding: const EdgeInsets.only(
          top: 4,
          bottom: 4,
          left: 16,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
