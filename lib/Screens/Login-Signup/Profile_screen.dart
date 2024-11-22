import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Widgets/profile_list.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile_screen extends StatelessWidget {
  const Profile_screen({super.key});

  // Fonction pour lancer l'appel
  Future<void> _callNumber(String phoneNumber) async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phoneNumber);
    if (await canLaunchUrl(phoneUri)) {
      await launchUrl(phoneUri);
    } else {
      // Affiche un message d'erreur si l'appel ne peut pas être lancé
      throw 'Impossible d\'ouvrir l\'application téléphonique';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 3, 226, 215),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Center(
              child: Stack(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                        border: Border.all(width: 4, color: Colors.white),
                        boxShadow: [
                          BoxShadow(
                              spreadRadius: 2,
                              blurRadius: 10,
                              color: Colors.black.withOpacity(0.1))
                        ],
                        shape: BoxShape.circle,
                        image: const DecorationImage(
                          image: AssetImage("lib/icons/avatar.png"),
                          fit: BoxFit.cover,
                        )),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white),
                        color: Colors.white,
                        image: DecorationImage(
                          image: AssetImage("lib/icons/camra.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Rice Namila",
                  style: GoogleFonts.poppins(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _profileStat(context, "Calories", "103lbs", "lib/icons/callories.png"),
                  _profileDivider(),
                  _profileStat(context, "Poids", "756cal", "lib/icons/weight.png"),
                  _profileDivider(),
                  _profileStat(context, "Rythme cardiaque", "215bpm", "lib/icons/heart.png"),
                ],
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              height: 550,
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    profile_list(
                      image: "lib/icons/heart2.png",
                      title: "Mes Favoris",
                      color: Colors.black87,
                      action: () {},
                    ),
                    _divider(),
                    profile_list(
                      image: "lib/icons/appoint.png",
                      title: "Rendez-vous",
                      color: Colors.black87,
                      action: () {},
                    ),
                    _divider(),
                    profile_list(
                      image: "lib/icons/Chat.png",
                      title: "SAMU",
                      color: Colors.black87,
                      action: () => _callNumber("1234"),
                    ),
                    _divider(),
                    profile_list(
                      image: "lib/icons/Chat.png",
                      title: "POLICE",
                      color: Colors.black87,
                      action: () => _callNumber("1234"),
                    ),
                    _divider(),
                    profile_list(
                      image: "lib/icons/Chat.png",
                      title: "POMPIERS",
                      color: Colors.black87,
                      action: () => _callNumber("1234"),
                    ),
                    _divider(),
                    profile_list(
                      image: "lib/icons/Chat.png",
                      title: "FAQs",
                      color: Colors.black87,
                      action: () {},
                    ),
                    _divider(),
                    profile_list(
                      image: "lib/icons/pay.png",
                      title: "Méthode de Paiement",
                      color: Colors.black87,
                      action: () {},
                    ),
                    _divider(),
                    profile_list(
                      image: "lib/icons/logout.png",
                      title: "Déconnexion",
                      color: Colors.red,
                      action: () {},
                    ),
                    SizedBox(
                      height: 120,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _profileStat(BuildContext context, String title, String value, String icon) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.0900,
      width: MediaQuery.of(context).size.width * 0.2500,
      child: Column(children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.0400,
          width: MediaQuery.of(context).size.width * 0.1500,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(icon),
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        Text(
          title,
          style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 245, 243, 243)),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(
          value,
          style: GoogleFonts.poppins(
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 255, 255, 255)),
        )
      ]),
    );
  }

  Widget _profileDivider() {
    return Container(
      height: 50,
      width: 1,
      color: Colors.white,
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Divider(),
    );
  }
}
