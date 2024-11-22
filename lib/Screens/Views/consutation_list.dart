import 'package:flutter/material.dart';

class ConsutationList extends StatelessWidget {
  const ConsutationList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> services = [
      {"title": "Generalist", "price": 6000.0},
      {"title": "Nutritionist", "price": 6000.0},
      {"title": "Gynecologist", "price": 6000.0},
      {"title": "Endocrinologist", "price": 10000.0},
      {"title": "Dermo-cosmetic", "price": 15000.0},
      {"title": "Herborist", "price": 25000.0},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sélectionnez un Service"),
        actions: [
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Téléconsultation",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: services.length,
                itemBuilder: (context, index) {
                  final service = services[index];
                  return ServiceTile(
                    title: service["title"],
                    price: service["price"],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ServiceTile extends StatelessWidget {
  final String title;
  final double price;

  const ServiceTile({
    Key? key,
    required this.title,
    required this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color.fromARGB(255, 4, 138, 109),
          child: const Icon(Icons.phone, color: Colors.white),
        ),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("$price CFA"),
        trailing: const Icon(Icons.radio_button_off),
        onTap: () {
          // Action lors du clic sur un service
          print("Service $title sélectionné");
        },
      ),
    );
  }
}