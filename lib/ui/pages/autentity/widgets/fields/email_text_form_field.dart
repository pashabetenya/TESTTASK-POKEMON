import 'package:application/core/constants/constants.dart';
import 'package:flutter/material.dart';

class EmailTextFormField extends StatelessWidget {
  final TextEditingController textController;

  const EmailTextFormField({
    Key? key,
    required this.textController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please, enter e-mail.';
        } else if (!value.contains('@')) {
          return 'Please, enter valid e-mail.';
        }

        return null;
      },
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          bottom: 15.0,
          top: 15.0,
        ),
        prefixIcon: const Icon(
          Icons.email,
          color: Colors.black,
          size: 21.0,
        ),
        hintText: 'E-mail',
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
