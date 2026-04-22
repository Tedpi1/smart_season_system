import 'package:flutter/material.dart';

import '../../../core/utils/color.dart';



class GradientButton extends StatelessWidget {
  final VoidCallback onclick;

  const GradientButton({
    super.key,
    required this.onclick,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2E7D32),
            Color(0xFF66BB6A),
            Color(0xFFFFC107),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(7),
      ),
      child: ElevatedButton(
        onPressed: onclick,
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(395, 50),
          backgroundColor: Colors.transparent,
          shadowColor: Colors.transparent,
        ),
        child: const Text(
          "Sign In",
          style: TextStyle(
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

