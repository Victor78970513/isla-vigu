import 'package:flutter/material.dart';
import 'package:isla_vigu/core/theme/app_colors.dart';

class AuthInput extends StatelessWidget {
  final bool showSuffixcIcon;
  final IconData prefixIcon;
  final String title;
  final String hintText;
  const AuthInput({
    super.key,
    required this.prefixIcon,
    required this.title,
    this.showSuffixcIcon = false,
    required this.hintText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: AppColors.darkBlue,
              fontSize: 14,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 1),
                  blurRadius: 20,
                  color: Colors.black.withValues(alpha: 0.05),
                ),
              ],
            ),
            child: TextField(
              decoration: InputDecoration(
                hintText: hintText,
                hintStyle: TextStyle(
                  color: Color(0xffADAEBC),
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: Icon(
                  prefixIcon,
                  color: AppColors.skyBlue,
                ),
                suffixIcon: showSuffixcIcon
                    ? Icon(
                        Icons.remove_red_eye,
                        color: Color(0xff9CA3AF),
                      )
                    : null,
                //
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Color(0xffE5E7EB),
                    width: 2,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Color(0xffE5E7EB),
                    width: 2,
                  ),
                ),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                    color: Color(0xffE5E7EB),
                    width: 2,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
