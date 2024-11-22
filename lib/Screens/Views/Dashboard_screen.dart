import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Views/chat_ia_page.dart';
import 'package:medical/Screens/Views/consutation_list.dart';
import 'package:medical/Screens/Views/doctor_search.dart';
import 'package:medical/Screens/Views/find_doctor.dart';
import 'package:medical/Screens/Widgets/article.dart';
import 'package:medical/Screens/Widgets/banner.dart';
import 'package:medical/Screens/Widgets/list_doctor1.dart';
import 'package:medical/Screens/Widgets/listicons.dart';
import 'package:medical/Screens/Views/articlePage.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
            child: Container(
              alignment: Alignment.bottomCenter,
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.06,
              child: Image.asset(
                "lib/icons/bell.png",
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
        ],
        title: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Text(
              "Trouvez votre solution\nsanté souhaitée",
              style: GoogleFonts.inter(
                  color: Color.fromARGB(255, 51, 47, 47),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1),
            ),
          ],
        ),
        toolbarHeight: 130,
        elevation: 0,
      ),
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
            height: 20,
          ),
          Center(
            child: Container(
              height: MediaQuery.of(context).size.height * 0.06,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(),
              child: TextField(
                onTap: () {
                  Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeft,
                      child: find_doctor(),
                    ),
                  );
                },
                textAlign: TextAlign.start,
                textInputAction: TextInputAction.none,
                autofocus: false,
                obscureText: false,
                keyboardType: TextInputType.emailAddress,
                textAlignVertical: TextAlignVertical.center,
                decoration: InputDecoration(
                  focusColor: Colors.black26,
                  fillColor: Color.fromARGB(255, 247, 247, 247),
                  filled: true,
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    child: Container(
                      height: 10,
                      width: 10,
                      child: Image.asset(
                        "lib/icons/search.png",
                        filterQuality: FilterQuality.high,
                      ),
                    ),
                  ),
                  prefixIconColor: const Color.fromARGB(255, 3, 190, 150),
                  label: Text("Recherchez un médecin, médicaments, articles..."),
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          //Body Start
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              listIcons(Icon: "lib/icons/Doctor.png", text: "Médecin"),
              listIcons(Icon: "lib/icons/Pharmacy.png", text: "Pharmacie"),
              listIcons(Icon: "lib/icons/Hospital.png", text: "Hôpital"),
              listIcons(Icon: "lib/icons/Ambulance.png", text: "Ambulance"),
            ],
          ),

          SizedBox(
            height: 10,
          ),
          BannerWidget(
            title: "Protection précoce pour\nla santé de votre famille",
            image: "lib/icons/female.png",
            textButton: "Discuter avec l'IA",
            buttonLink: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ChatIAPage(),
                ),
              );
            },
          ),
          SizedBox(
            height: 10,
          ),
          BannerWidget(
            title: "Protection précoce pour\nla santé de votre famille",
            image: "lib/icons/female.png",
            textButton: "Consultation",
            buttonLink: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ConsutationList(),
                ),
              );
            },
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Meilleurs médecins",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: doctor_search()));
                  },
                  child: Text(
                    "Voir tout",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: const Color.fromARGB(255, 3, 190, 150),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 180,
              width: 400,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: [
                  list_doctor1(
                      distance: "130m de distance",
                      image: "lib/icons/male-doctor.png",
                      maintext: "Dr. Marcus Horizon",
                      numRating: "4.7",
                      subtext: "Cardiologue"),
                  list_doctor1(
                      distance: "130m de distance",
                      image: "lib/icons/docto3.png",
                      maintext: "Dr. Maria Elena",
                      numRating: "4.6",
                      subtext: "Psychologue"),
                  list_doctor1(
                      distance: "2km de distance",
                      image: "lib/icons/doctor2.png",
                      maintext: "Dr. Stevi Jessi",
                      numRating: "4.8",
                      subtext: "Orthopédiste"),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Article santé",
                  style: GoogleFonts.inter(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 46, 46, 46),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeft,
                            child: articlePage()));
                  },
                  child: Text(
                    "Voir tout",
                    style: GoogleFonts.inter(
                      fontSize: 16.sp,
                      color: const Color.fromARGB(255, 3, 190, 150),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Article(
              image: "images/article1.png",
              dateText: "10 juin 2021",
              duration: "5 min de lecture",
              mainText:
                  "Les 25 fruits les plus sains que vous pouvez manger,\nselon un nutritionniste"),
        ]),
      ),
    );
  }
}
