import 'package:flutter/material.dart';
import 'package:jugger/components/salidas_torneo.dart';


class TournamentMain extends StatelessWidget {
  const TournamentMain({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
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
    );
  }
}