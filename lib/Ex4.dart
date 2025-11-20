import 'package:flutter/material.dart';

void main() {
  runApp(const MyScoreApp());
}

class MyScoreApp extends StatelessWidget {
  const MyScoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ScoreHomePage(),
    );
  }
}

class ScoreHomePage extends StatelessWidget {
  const ScoreHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 78, 127, 22),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            SubjectScoreCard(subjectName: "Flutter"),
            SizedBox(height: 15),
            SubjectScoreCard(subjectName: "Dart"),
            SizedBox(height: 15),
            SubjectScoreCard(subjectName: "React"),
          ],
        ),
      ),
    );
  }
}

class SubjectScoreCard extends StatelessWidget {
  final String subjectName;

  const SubjectScoreCard({
    Key? key,
    required this.subjectName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            "My score in $subjectName",
            style: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 8),
          const InteractiveScoreBar(),
        ],
      ),
    );
  }
}

class InteractiveScoreBar extends StatefulWidget {
  const InteractiveScoreBar({Key? key}) : super(key: key);

  @override
  State<InteractiveScoreBar> createState() => _InteractiveScoreBarState();
}

class _InteractiveScoreBarState extends State<InteractiveScoreBar> {
  int currentScore = 1;

  // Color intensity mapping
  final List<int> colorShades = [
    200, 300, 300, 500, 500, 600, 600, 800, 800, 900
  ];

  int getColorShade() {
    return colorShades[currentScore - 1];
  }

  void incrementScore() {
    if (currentScore < 10) {
      setState(() {
        currentScore++;
      });
    }
  }

  void decrementScore() {
    if (currentScore > 1) {
      setState(() {
        currentScore--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildScoreControls(),
        const SizedBox(height: 8),
        _buildProgressBar(),
      ],
    );
  }

  Widget _buildScoreControls() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildControlButton(
          icon: Icons.remove,
          onTap: currentScore > 1 ? decrementScore : null,
          color: Colors.red,
        ),
        _buildScoreDisplay(),
        _buildControlButton(
          icon: Icons.add,
          onTap: currentScore < 10 ? incrementScore : null,
          color: Colors.green,
        ),
      ],
    );
  }

  Widget _buildControlButton({
    required IconData icon,
    required VoidCallback? onTap,
    required Color color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: IconButton(
        onPressed: onTap,
        icon: Icon(
          icon,
          color: onTap != null ? color : Colors.grey,
        ),
      ),
    );
  }

  Widget _buildScoreDisplay() {
    return Container(
      width: 60,
      height: 20,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          width: 1,
          color: Colors.blueGrey,
        ),
      ),
      child: Center(
        child: Text(
          currentScore.toString(),
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Widget _buildProgressBar() {
    return Stack(
      children: [
        Container(
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              width: 1,
              color: Colors.grey,
            ),
          ),
        ),
        Row(
          children: [
            Expanded(
              flex: currentScore,
              child: Container(
                height: 35,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green[getColorShade()],
                ),
              ),
            ),
            Expanded(
              flex: 10 - currentScore,
              child: const SizedBox(),
            ),
          ],
        ),
      ],
    );
  }
}