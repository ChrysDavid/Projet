import 'package:flutter/material.dart';

class CarnerPage extends StatefulWidget {
  const CarnerPage({super.key});

  @override
  State<CarnerPage> createState() => _CarnerPageState();
}

class _CarnerPageState extends State<CarnerPage> {
  List<IconData> listIcons  = [
      Icons.medical_services,
      Icons.science,
      Icons.camera_alt,
      Icons.medication,
      Icons.vaccines,
      Icons.attach_money,
    ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Dossier"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Deux colonnes par ligne
            crossAxisSpacing: 10, // Espacement horizontal
            mainAxisSpacing: 10, // Espacement vertical
          ),
          itemCount: listIcons.length, // Nombre d'éléments
          itemBuilder: (context, index) {
            return CardCustom(listIcon: listIcons[index]);
          },
        ),
      ),
    );
  }
}

class CardCustom extends StatelessWidget {
  final IconData listIcon;
  const CardCustom({super.key, required this.listIcon});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4, // Ombre pour chaque élément
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Container(
          height: 100,
          width: 100,
          decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(50),
          ),
          child: Center(
            child: Icon(
              listIcon, // Utilisation de l'icône de la liste
              size: 50,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
