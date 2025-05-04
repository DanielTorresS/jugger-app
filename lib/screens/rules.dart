import 'package:flutter/material.dart';
import 'package:jugger/core/app_colors.dart';
import '../core/app_text_styles.dart';

class Rules extends StatelessWidget {
  const Rules({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      children: [
        Container(
          height: 50,
          color: AppColors.accent2,
          alignment: Alignment.center,
          child: Text(
            '¿Qué es Jugger?',
            style: AppTextStyles.headLine1(color: Colors.black),
          ),
        ),

        const SizedBox(height: 10),

        // Aquí el bloque de texto
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              Text(
              '''El Jugger es un deporte para dos equipos. El objetivo es colocar el Jugg (pelota de juego) en el Mal contrario (portería) la mayor cantidad de veces. Cada equipo consta de cinco jugadores en campo y hasta tres suplentes. Solo uno de los cinco jugadores en campo, el Qwik (corredor), puede tomar el Jugg y colocarlo en el Mal.''',
                style: AppTextStyles.bodyText1(color: Colors.white),
                textAlign: TextAlign.justify,
              ),

              Text(
                '''
                Los otros cuatro jugadores o Pompfer están equipados con Pompfen (material deportivo acolchado) con el que pueden impactar a los jugadores contrarios. Los jugadores impactados de manera válida ya no pueden participar en el partido durante un período de tiempo específico. Es así como los cuatro Pompfer pueden apoyar a su propio Qwik a marcar puntos.''',
                style: AppTextStyles.bodyText1(color: Colors.white),
                textAlign: TextAlign.justify,
              ),
            ],
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
