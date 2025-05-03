import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../core/app_colors.dart';

class ScorePrint extends StatelessWidget {
  final String round;
  final String izquierdo;
  final String derecho;
  final int scoreIzq;
  final int scoreDer;
  final String referee;
  final String place;
  final DateTime time;

  const ScorePrint({
    super.key,
    required this.round,
    required this.izquierdo,
    required this.derecho,
    required this.scoreIzq,
    required this.scoreDer,
    required this.referee,
    required this.place,
    required this.time,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 10),
        Container(
          alignment: Alignment.center,
          height: 250,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Línea roja con texto y borde redondeado superior
              Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                decoration: BoxDecoration(
                  color: AppColors.accent,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(35),
                  ),
                ),
                alignment: Alignment.center,
                //encabezado
                child: Text(
                  round,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: -1,
                  ),
                ),
              ),

              // Contenido principal
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      //lugar
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.place_outlined, size: 20, color: Colors.black),
                          SizedBox(width: 6),
                          Text(
                            place,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                      //fecha y hora
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.calendar_today_outlined, size: 20, color: Colors.black),
                          SizedBox(width: 6),
                          Text(
                            DateFormat('dd-MM-yyyy - h:mm a').format(time),
                            //time.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      //equipos
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Equipo 1
                          Column(
                            children: [
                              Image.asset("assets/images/raiders.jpg", height: 90, width: 90),
                              Text(
                                izquierdo.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                          // Marcador
                          Column(
                            children: [
                              Text(
                                "Stones",
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  letterSpacing: -1,
                                ),
                              ),
                              Text(
                                "$scoreIzq : $scoreDer",
                                style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black,
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                          // Equipo 2
                          Column(
                            children: [
                              Image.asset("assets/images/lycaon.jpg", height: 90, width: 90),
                              Text(
                                derecho.toUpperCase(),
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black,
                                  letterSpacing: -1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 5,),
                      // Árbitro
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.sports, size: 20, color: Colors.black),
                          SizedBox(width: 6),
                          Text(
                            referee,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              letterSpacing: -1,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}