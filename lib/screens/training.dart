import 'package:flutter/material.dart';

class Training extends StatelessWidget {
  const Training({
    super.key,
    /*final String? nameDer,
    final String? nameIzq,
    final int? scoreDer,
    final int? scoreIzq,
    final int? stones,*/
  });

  @override
  Widget build(BuildContext context) {
    double height = 200;
    double width = 160;
    return Column(
      children: [
        //SizedBox(height: 50,),
        Spacer(),
        //equipos y puntajes
        Row(
          children: [
            Spacer(),

            //equipo 1
            Container(
              alignment: Alignment.center,
              height: height,
              width: width,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //nombre
                  Text(
                    "Rigor mortis".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: -1,
                    ),
                  ),
                  //puntos
                  Text(
                    "0",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: -1,
                    ),
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Spacer(),
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.remove, size: 40, color: Colors.black),
                      ),
                      SizedBox(width: 20,),

                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, size: 40, color: Colors.black),
                      ),
                      Spacer(),
                    ],
                  ),

                ],
              ),
            ),

            SizedBox(width: 10),
            //equipo 2
            Container(
              alignment: Alignment.center,
              height: height,
              width: width,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35),
              ),

              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //nombre
                  Text(
                    "Rigor mortis".toUpperCase(),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: -1,
                    ),
                  ),
                  //puntos
                  Text(
                    "0",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: -1,
                    ),
                  ),
                  Row(
                    //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Spacer(),
                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.remove, size: 40, color: Colors.black),
                      ),
                      SizedBox(width: 20,),

                      Container(
                        width: 52,
                        height: 52,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                        ),
                        child: Icon(Icons.add, size: 40, color: Colors.black),
                      ),
                      Spacer(),
                    ],
                  ),

                ],
              ),
            ),

            Spacer(),
          ],
        ),

        Spacer(),

        //tiempo del partido
        Container(
          alignment: Alignment.center,
          height: height-10,
          margin: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(35),
          ),

          child: Row(
            children: [
              Spacer(),
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.remove, size: 80, color: Colors.black),
              ),

              Spacer(),

              Text(
                "60",
                style: TextStyle(
                  fontSize: 80,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                  letterSpacing: -1,
                ),
              ),

              Spacer(),

              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.add, size: 80, color: Colors.black),
              ),

              Spacer(),
            ],
          ),
        ),

        Spacer(),
        //play, game and pause
        Row(
          children: [
            Spacer(),

            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.play_arrow, size: 80, color: Colors.black),
            ),

            Spacer(),

            Icon(Icons.vertical_align_bottom, size: 70, color: Colors.white),

            Spacer(),

            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.stop, size: 80, color: Colors.black),
            ),
            Spacer(),
          ],
        ),

        Spacer(),
      ],
    );
  }
}