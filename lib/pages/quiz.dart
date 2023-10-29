import 'package:flutter/material.dart';
import 'colors.dart' as color;

import 'httpclient.dart';
import 'user.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: QuizScreen(),
    );
  }
}

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<int> answers = List.filled(10, 0); // Initialize answer list with 10 zeros.
  int currentQuestionIndex = 0;

  final questions = [
    'Little interest or pleasure in doing things',
    'Feeling down, depressed, or hopeless',
    'Trouble falling or staying asleep, or sleeping too much',
    'Feeling tired or having little energy',
    'Poor appetite or overeating',
    'Feeling bad about yourself - or that you are a failure or have let yourself or your family down',
    'Trouble concentrating on things, such as reading the newspaper or watching television',
    'Moving or speaking so slowly that other people could have noticed',
    'Thoughts that you would be better off dead, or of hurting yourself',
    'If you\'ve had any days with issues above, how difficult have these problems made it for you at work, home, school, or with other people?'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePageBackground,
      body: (currentQuestionIndex == questions.length)
          ? ScoreScreen(answers)
          : QuizQuestion(
        question: questions[currentQuestionIndex],
        onAnswerSelected: (int answer) {
          setState(() {
            answers[currentQuestionIndex] = answer;
            currentQuestionIndex++;
          });
        },
      ),
    );
  }
}

class QuizQuestion extends StatelessWidget {
  final String question;
  final Function(int) onAnswerSelected;

  QuizQuestion({required this.question, required this.onAnswerSelected});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: color.AppColor.homePageBackground,
        appBar: AppBar(
//        backgroundColor: Colors.transparent,
          backgroundColor: Color(0x44000000),
          elevation: 0,
          title: Text("Mental Health Check-In"),
        ),
    body: SafeArea(
      child: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 150,0,25),
              alignment: Alignment.topCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Flexible(
                    child: Text(
                      question,
                      style: TextStyle(fontSize:20),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
               )





            ),
            // Padding(
            //   padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            //   child: Text(
            //     question,
            //     style: TextStyle(fontSize:20),
            //   ),
            // ),
            AnswerOption(
              label: 'Not at all',
              onTap: () => onAnswerSelected(0),
            ),
            AnswerOption(
              label: 'Several days',
              onTap: () => onAnswerSelected(1),
            ),
            AnswerOption(
              label: 'More than half of the days',
              onTap: () => onAnswerSelected(2),
            ),
            AnswerOption(
              label: 'Nearly every day',
              onTap: () => onAnswerSelected(3),
            ),
          ],
        )
      )
    )

    );
  }
}

class AnswerOption extends StatelessWidget {
  final String label;
  final Function onTap;

  AnswerOption({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ElevatedButton(
        onPressed: () => onTap(),
        child: Text(label),
      ),
    );
  }
}

class ScoreScreen extends StatelessWidget {
  final List<int> answers;

  ScoreScreen(this.answers);

  String calculateDepressionLevel(int score) {
    if (score >= 5 && score <= 9) {
      return "You may be experiencing mild depression. It's essential to talk to someone you trust about your feelings.";
    } else if (score >= 10 && score <= 14) {
      return "You are in the moderate depression range. Consider seeking help from a mental health professional.";
    } else if (score >= 15 && score <= 19) {
      return "Your score indicates a moderately severe depression. It's crucial to consult a mental health expert.";
    } else if (score >= 20) {
      return "Your score suggests severe depression. Please seek immediate help from a mental health professional.";
    } else {
      return "Your score indicates that you are not experiencing significant depression symptoms. Keep monitoring your mood and seek support if needed.";
    }
  }

  @override
  Widget build(BuildContext context) {
    int totalScore = answers.reduce((value, element) => value + element);
    var http = HTTP();
    http.createUser(QUser(name:'admin1@gmail.com',score: totalScore));

    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your Total Score: $totalScore',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              calculateDepressionLevel(totalScore),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Go back to the quiz screen
              },
              child: Text('Retake Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
