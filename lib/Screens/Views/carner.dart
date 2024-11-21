import 'package:flutter/material.dart';

class CarnerPage extends StatefulWidget {
  const CarnerPage({super.key});

  @override
  State<CarnerPage> createState() => _CarnerPageState();
}

class _CarnerPageState extends State<CarnerPage> {
  final List<Map<String, dynamic>> items = [
    {'icon': Icons.medical_services, 'label': 'Consultation'},
    {'icon': Icons.science, 'label': 'Laboratoire'},
    {'icon': Icons.camera_alt, 'label': 'Radiologie'},
    {'icon': Icons.medication, 'label': 'Ordonnances'},
    {'icon': Icons.vaccines, 'label': 'Immunisation'},
    {'icon': Icons.attach_money, 'label': 'Factures'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Dossier"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Deux colonnes par ligne
            crossAxisSpacing: 10, // Espacement horizontal
            mainAxisSpacing: 10, // Espacement vertical
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return CardCustom(
              icon: item['icon'],
              label: item['label'],
            );
          },
        ),
      ),
    );
  }
}

class CardCustom extends StatelessWidget {
  final IconData icon;
  final String label;

  const CardCustom({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.teal,
              borderRadius: BorderRadius.circular(70),
            ),
            child: Icon(
              icon,
              size: 50,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            label,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
