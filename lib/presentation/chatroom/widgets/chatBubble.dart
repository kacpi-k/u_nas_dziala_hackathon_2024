import 'package:flutter/material.dart';
import 'package:u_nas_dziala_hackathon_2024/core/configs/theme/app_colors.dart';

class Chatbubble extends StatelessWidget {
  final String message;
  const Chatbubble({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.primary
        ),
        child: Text(message, style: const TextStyle(color: Colors.black54)),
    );
  }
}