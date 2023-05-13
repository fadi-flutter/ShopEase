import 'package:flutter/material.dart';
import 'package:shopease/utilities/app_colors.dart';

class OperationButton extends StatelessWidget {
  const OperationButton({
    super.key,
    required this.icon, required this.onPressed,
  });
  final IconData icon;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Material(
        shadowColor: AppColors.grey,
        color: AppColors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20))),
        elevation: 4,
        child: Container(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 19,
            color: AppColors.grey,
          ),
        ),
      ),
    );
  }
}
