import 'package:flutter/material.dart';
import 'package:medical/Screens/Widgets/shedule_card.dart';

class shedule_tab1 extends StatelessWidget {
  const shedule_tab1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(children: [
        const SizedBox(
          height: 30,
        ),
         shedule_card(
            confirmation: "Confirmé",
            mainText: "Dr Marcus Horizon",
            subText: "Cardiologue",
            date: "26/06/2022",
            time: "10h30",
            image: "lib/icons/male-doctor.png",
          ),
          const SizedBox(
            height: 20,
          ),
          shedule_card(
            confirmation: "Confirmé",
            mainText: "Dr Marcus Horizon",
            subText: "Cardiologue",
            date: "26/06/2022",
            time: "14h00",
            image: "lib/icons/female-doctor2.png",
          ),
      ]),
    );
  }
}
