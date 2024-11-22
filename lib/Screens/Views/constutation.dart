import 'package:flutter/material.dart';

class Consultation {
  final String medecin;
  final String titre;
  final bool exterieur;
  final String? hopital;
  final DateTime date;
  final String diagnostic;
  final String traitement;
  final String remarques;

  Consultation({
    required this.medecin,
    required this.titre,
    this.exterieur = false,
    this.hopital,
    required this.date,
    required this.diagnostic,
    required this.traitement,
    required this.remarques,
  });
}

class ConsultationListScreen extends StatelessWidget {
  final List<Consultation> consultations = [
    Consultation(
      medecin: 'Dr. Dupont',
      titre: 'Consultation Générale',
      exterieur: false,
      date: DateTime(2024, 11, 1),
      diagnostic: 'Fatigue générale',
      traitement: 'Repos et hydratation',
      remarques: 'À surveiller si les symptômes persistent.',
    ),
    Consultation(
      medecin: 'Dr. Martin',
      titre: 'Cardiologie',
      exterieur: true,
      hopital: 'Clinique Siloé',
      date: DateTime(2024, 10, 15),
      diagnostic: 'Hypertension artérielle',
      traitement: 'Médication antihypertensive',
      remarques: 'Réduire la consommation de sel.',
    ),
    Consultation(
      medecin: 'Dr. André',
      titre: 'Dermatologie',
      exterieur: false,
      date: DateTime(2024, 9, 20),
      diagnostic: 'Éruption cutanée allergique',
      traitement: 'Crème corticostéroïde',
      remarques: 'Éviter le contact avec les allergènes identifiés.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des Consultations'),
      ),
      body: ListView.builder(
        itemCount: consultations.length,
        itemBuilder: (context, index) {
          final consultation = consultations[index];
          return Card(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    consultation.titre,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 8),
                  Text('Médecin : ${consultation.medecin}', style: TextStyle(fontSize: 16)),
                  if (consultation.exterieur)
                    Text(
                      'Hôpital : ${consultation.hopital}',
                      style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                    ),
                  Text(
                    'Date : ${consultation.date.toLocal()}'.split(' ')[0],
                    style: TextStyle(fontSize: 16),
                  ),
                  SizedBox(height: 16),
                  Align(
                    alignment: Alignment.centerRight,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ConsultationDetailScreen(consultation: consultation),
                          ),
                        );
                      },
                      child: Text('Voir Détail'),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ConsultationDetailScreen extends StatelessWidget {
  final Consultation consultation;

  ConsultationDetailScreen({required this.consultation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Détails de la Consultation'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              consultation.titre,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Text(
              'Médecin : ${consultation.medecin}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Date : ${consultation.date.toLocal()}'.split(' ')[0],
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 16),
            Text(
              'Diagnostic :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              consultation.diagnostic,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Traitement :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              consultation.traitement,
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Remarques :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              consultation.remarques,
              style: TextStyle(fontSize: 16),
            ),
            if (consultation.exterieur) ...[
              SizedBox(height: 16),
              Text(
                'Hôpital : ${consultation.hopital}',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ],
        ),
      ),
    );
  }
}