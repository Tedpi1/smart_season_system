import 'package:flutter/material.dart';

import '../../../core/utils/color.dart';

class LoginFields extends StatelessWidget {
  final String hintText;
  final TextEditingController? controller;
  final bool obscureText;
  final TextInputType keyboardType;
  final String? Function(String?)? validator;
  final IconData? prefixIcon;

  const LoginFields({
    super.key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.keyboardType = TextInputType.text,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 1000),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        style: TextStyle(
          color: theme.colorScheme.onSurface,
        ),
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.all(20),

          hintText: hintText,
          hintStyle: TextStyle(
            color: theme.colorScheme.onSurface.withOpacity(0.6),
          ),

          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon,
              color: theme.colorScheme.onSurface.withOpacity(0.7))
              : null,

          filled: true,
          fillColor: theme.colorScheme.surface,

          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Pallete.borderColor,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Pallete.gradient2,
              width: 2,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}