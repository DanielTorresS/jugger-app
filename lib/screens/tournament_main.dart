import 'package:flutter/material.dart';
import 'package:jugger/components/salidas_torneo.dart';

import '../core/app_colors.dart';

class TournamentMain extends StatefulWidget {
  const TournamentMain({super.key});

  @override
  State<TournamentMain> createState() => _TournamentMainState();
}

class _TournamentMainState extends State<TournamentMain> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text('Ronda 1'),
        foregroundColor: Colors.white,
      ),
      backgroundColor: AppColors.Background,
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          ScorePrint(
            round: "Partido K1R1M1",
            izquierdo: "Raiders",
            derecho: "Lycaon",
            scoreDer: 3,
            scoreIzq: 9,
            referee: "Daniel A. Torres",
            place: "PRD",
            time: DateTime(2025, 6, 20),
          ),
          ScorePrint(
            round: "Partido K1R1M2",
            izquierdo: "Raiders",
            derecho: "Lycaon",
            scoreDer: 2,
            scoreIzq: 5,
            referee: "Daniel A. Torres",
            place: "UDS",
            time: DateTime(2025, 6, 20),
          ),
          ScorePrint(
            round: "Partido K1R1M1",
            izquierdo: "Raiders",
            derecho: "Lycaon",
            scoreDer: 3,
            scoreIzq: 9,
            referee: "Daniel A. Torres",
            place: "PRD",
            time: DateTime(2025, 6, 20),
          ),
          ScorePrint(
            round: "Partido K1R1M2",
            izquierdo: "Raiders",
            derecho: "Lycaon",
            scoreDer: 2,
            scoreIzq: 5,
            referee: "Daniel A. Torres",
            place: "UDS",
            time: DateTime(2025, 6, 20),
          ),
          ScorePrint(
            round: "Partido K1R1M1",
            izquierdo: "Raiders",
            derecho: "Lycaon",
            scoreDer: 3,
            scoreIzq: 9,
            referee: "Daniel A. Torres",
            place: "PRD",
            time: DateTime(2025, 6, 20),
          ),
          ScorePrint(
            round: "Partido K1R1M2",
            izquierdo: "Raiders",
            derecho: "Lycaon",
            scoreDer: 2,
            scoreIzq: 5,
            referee: "Daniel A. Torres",
            place: "UDS",
            time: DateTime(2025, 6, 20),
          ),
          ScorePrint(
            round: "Partido K1R1M1",
            izquierdo: "Raiders",
            derecho: "Lycaon",
            scoreDer: 3,
            scoreIzq: 9,
            referee: "Daniel A. Torres",
            place: "PRD",
            time: DateTime(2025, 6, 20),
          ),
          ScorePrint(
            round: "Partido K1R1M2",
            izquierdo: "Raiders",
            derecho: "Lycaon",
            scoreDer: 2,
            scoreIzq: 5,
            referee: "Daniel A. Torres",
            place: "UDS",
            time: DateTime(2025, 6, 20),
          ),
        ],
      ),
    );
  }
}