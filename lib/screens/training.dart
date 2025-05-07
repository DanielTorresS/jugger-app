import 'dart:async';
import 'package:flutter/material.dart';

class Training extends StatefulWidget {
  const Training({super.key});

  @override
  _TrainingState createState() => _TrainingState();
}

class _TrainingState extends State<Training> {
  int scoreTeam1 = 0;
  int scoreTeam2 = 0;
  double time = 100.0;
  double step = 1;
  bool isPlaying = false;
  Timer? _timer;

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startTimer() {
    if (isPlaying) return;
    setState(() => isPlaying = true);
    _timer = Timer.periodic(const Duration(milliseconds: 1500), (timer) {
      setState(() {
        time = (time - step).clamp(0.0, time);
        if (time <= 0.0) {
          _pauseTimer();
        }
      });
    });
  }

  void _pauseTimer() {
    _timer?.cancel();
    setState(() => isPlaying = false);
  }

  @override
  Widget build(BuildContext context) {
    const double height = 200.0;
    //const double width = 160.0;
    return Column(
      children: [
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            _scoreCard('Raiders', scoreTeam1, () {
              setState(() => scoreTeam1 = scoreTeam1 > 0 ? scoreTeam1 - 1 : 0);
            }, () {
              setState(() => scoreTeam1++);
            }),
            const SizedBox(width: 10.0),
            _scoreCard('Rigor mortis', scoreTeam2, () {
              setState(() => scoreTeam2 = scoreTeam2 > 0 ? scoreTeam2 - 1 : 0);
            }, () {
              setState(() => scoreTeam2++);
            }),
            const Spacer(),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: height - 10.0,
              margin: const EdgeInsets.symmetric(horizontal: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(35.0),
              ),
              child: Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () => setState(() {
                      if (time > 0.0) time -= 1.0;
                    }),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.remove, size: 80.0, color: Colors.black),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    time.toStringAsFixed(0),
                    style: const TextStyle(
                      fontSize: 80.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      letterSpacing: -1.0,
                    ),
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () => setState(() {
                      time += 1.0;
                    }),
                    child: Container(
                      width: 80.0,
                      height: 80.0,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(Icons.add, size: 80.0, color: Colors.black),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
            /*const SizedBox(height: 10.0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Row(
                children: [
                  const Text('Decremento:'),
                  Expanded(
                    child: Slider(
                      value: step,
                      min: 0.1,
                      max: 10.0,
                      divisions: 99,
                      label: step.toStringAsFixed(1),
                      onChanged: (double value) => setState(() {
                        step = value;
                      }),
                    ),
                  ),
                ],
              ),
            ),*/
          ],
        ),
        const Spacer(),
        Row(
          children: [
            const Spacer(),
            GestureDetector(
              onTap: () {
                if (isPlaying) {
                  _pauseTimer();
                } else {
                  _startTimer();
                }
              },
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  isPlaying ? Icons.pause : Icons.play_arrow,
                  size: 80.0,
                  color: Colors.black,
                ),
              ),
            ),
            const Spacer(),
            const Icon(Icons.vertical_align_bottom, size: 70.0, color: Colors.white),
            const Spacer(),
            GestureDetector(
              onTap: () => setState(() {
                _pauseTimer();
                time = 100.0;
              }),
              child: Container(
                width: 100.0,
                height: 100.0,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.stop, size: 80.0, color: Colors.black),
              ),
            ),
            const Spacer(),
          ],
        ),
        const Spacer(),
      ],
    );
  }

  Widget _scoreCard(String name, int score, VoidCallback onMinus, VoidCallback onPlus) {
    return Container(
      alignment: Alignment.center,
      height: 200.0,
      width: 160.0,
      margin: const EdgeInsets.symmetric(horizontal: 10.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35.0),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            name.toUpperCase(),
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: -1.0,
            ),
          ),
          Text(
            '$score',
            style: const TextStyle(
              fontSize: 40.0,
              fontWeight: FontWeight.bold,
              color: Colors.black,
              letterSpacing: -1.0,
            ),
          ),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: onMinus,
                child: Container(
                  width: 52.0,
                  height: 52.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.remove, size: 40.0, color: Colors.black),
                ),
              ),
              const SizedBox(width: 20.0),
              GestureDetector(
                onTap: onPlus,
                child: Container(
                  width: 52.0,
                  height: 52.0,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.add, size: 40.0, color: Colors.black),
                ),
              ),
              const Spacer(),
            ],
          ),
        ],
      ),
    );
  }
}
