import 'package:application/core/constants/constants.dart';
import 'package:flutter/material.dart';

class PasswordTextFormField extends StatefulWidget {
  final TextEditingController textController;

  const PasswordTextFormField({
    Key? key,
    required this.textController,
  }) : super(key: key);

  @override
  _PasswordTextFormFieldState createState() => _PasswordTextFormFieldState();
}

class _PasswordTextFormFieldState extends State<PasswordTextFormField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.textController,
      cursorColor: Colors.grey,
      obscureText: true,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please, enter password.';
        }

        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          top: 15.0,
        ),
        prefixIcon: const Icon(
          Icons.lock,
          color: Colors.black,
          size: 21.0,
        ),
        hintText: 'Password',
        hintStyle: const TextStyle(
          fontFamily: 'CircularStd',
          fontSize: 16.0,
          fontWeight: FontWeight.normal,
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade300,
            width: 2.0,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: kGreen,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
