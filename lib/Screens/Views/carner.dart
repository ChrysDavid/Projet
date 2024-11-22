import 'package:flutter/material.dart';
import 'package:medical/Screens/Views/constutation.dart';

class CarnerPage extends StatefulWidget {
  const CarnerPage({super.key});

  @override
  State<CarnerPage> createState() => _CarnerPageState();
}

class _CarnerPageState extends State<CarnerPage> {
  final List<Map<String, dynamic>> items = [
    {
      'icon': Icons.medical_services,
      'label': 'Consultation',
      'link': (BuildContext context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ConsultationListScreen()),
        );
      },
    },
    {'icon': Icons.science, 'label': 'Laboratoire', 'link': (BuildContext context) {}},
    {'icon': Icons.camera_alt, 'label': 'Radiologie', 'link': (BuildContext context) {}},
    {'icon': Icons.medication, 'label': 'Ordonnances', 'link': (BuildContext context) {}},
    {'icon': Icons.vaccines, 'label': 'Immunisation', 'link': (BuildContext context) {}},
    {'icon': Icons.attach_money, 'label': 'Factures', 'link': (BuildContext context) {}},
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
              onTap: () => item['link'](context), // Passe le contexte
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
  final VoidCallback onTap;

  const CardCustom({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Icon(
                icon,
                size: 40,
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
      ),
    );
  }
}
