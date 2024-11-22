import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BannerWidget extends StatelessWidget {
  final String title;
  final String image;
  final String textButton;
  final VoidCallback buttonLink;

  const BannerWidget({
    Key? key,
    required this.title,
    required this.image,
    required this.textButton,
    required this.buttonLink,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.16,
        decoration: BoxDecoration(
          color: const Color.fromARGB(153, 236, 232, 232),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 10),
                  GestureDetector(
                    onTap: buttonLink, // Utilisation de `onTap` pour un clic simple
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.026,
                      width: MediaQuery.of(context).size.width * 0.24,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 4, 138, 109),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Center(
                        child: Text(
                          textButton,
                          style: GoogleFonts.poppins(
                            fontSize: 12.sp,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.14, // Ajustement de la taille
              width: MediaQuery.of(context).size.width * 0.3,
              alignment: Alignment.bottomCenter,
              child: Image.asset(image, fit: BoxFit.contain),
            ),
          ],
        ),
      ),
    );
  }
}