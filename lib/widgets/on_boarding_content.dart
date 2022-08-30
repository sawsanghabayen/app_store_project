import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OnBoardingContent extends StatelessWidget {
  const OnBoardingContent({
    Key? key,
    required this.image,
    required this.title,
    required this.subTitle,
  }) : super(key: key);

  final String image;
  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/$image.png',
          height: 317,
        ),
        const SizedBox(height: 19),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 53),
          child: Column(
            children: [
              Text(
                title,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                  color: const Color(0xFF3E3E3E),
                ),
              ),
              const SizedBox(height: 24.9),
              Text(
                subTitle,
                textAlign: TextAlign.center,
                style: GoogleFonts.nunito(
                  fontWeight: FontWeight.w400,
                  fontSize: 16,
                  color: const Color(0xFF3E3E3E).withOpacity(0.6),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
