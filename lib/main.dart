import 'package:flutter/material.dart';
import './question.dart';
import './Answer.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _answersChosen = <String>[];
  Color? _backgroundColor;

  void _answerQuestion(String answer, Color? backgroundColor) {
    setState(() {
      if (_questionIndex == 0) {
        _backgroundColor = backgroundColor;
      }
      _answersChosen.add(answer);
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    print(_answersChosen);
  }

  void _restartQuiz() {
    setState(() {
      _questionIndex = 0;
      _answersChosen.clear();
      _backgroundColor = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    var questions = [
      {
        'questionText': 'Quelle est votre saison préférée ?',
        'answers': [
          {'text': 'Printemps' },
          {'text': 'Été'},
          {'text': 'Automne'},
          {'text': 'Hiver'},
        ],
      },
      {
        'questionText': 'Quel est votre plat préféré ?',
        'answers': [
          {'text': ' Pizza'},
          {'text': 'Sushi'},
          {'text': 'Hamburger'},
          {'text': 'Salade'},
        ],
      },
      {
        'questionText': 'Quel est votre genre de musique préféré ?',
        'answers': [
          {'text': 'Pop' },
          {'text': 'Rock'},
          {'text': ' Hip-hop'},
          {'text': 'Classique'},
        ],
      },
      {
        'questionText': 'Quelle est votre activité de loisir préférée ?',
        'answers': [
          {'text': 'Lecture' },
          {'text': 'Sport'},
          {'text': ' Peinture/dessin'},
          {'text': 'Regarder des films/séries'},
        ],
      },
    ];

    return MaterialApp(
      debugShowCheckedModeBanner: false,

      home: Scaffold(
        appBar: AppBar(
          title: Text('My Quiz' ,  style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.purpleAccent,
        ),
        body: _questionIndex < questions.length
            ? Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'] as String,
            ),
            ...(questions[_questionIndex]['answers'] as List<Map<String, Object>>)
                .map((answer) {
              return Answer(
                      () => _answerQuestion(
                    answer['text'] as String,
                    answer.containsKey('color') ? answer['color'] as Color : null,
                  ),
                  answer['text'] as String);
            }).toList()
          ],
        )
            : Container(
          color: _backgroundColor,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Vous avez terminé le quiz !',
                  style: TextStyle(fontSize: 20  , fontWeight: FontWeight.w800,),
                ),
                const SizedBox(height: 20),
               const Text(
                  'C\'est tellement intéressant ! ',
                  style: TextStyle(fontSize: 16 ,  fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,

                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                     const Text(
                      'votre saison préférée est le : ',
                      style: TextStyle(fontSize: 16 ,  fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,

                    ),
                    Text(
                      '${_answersChosen[0]} ',
                      style: TextStyle(fontSize: 16 , color: Colors.purpleAccent, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,

                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    const Text(
                      'votre plat préférée est le : ',
                      style: TextStyle(fontSize: 16 ,  fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,

                    ),
                    Text(
                      '${_answersChosen[1]} ',
                      style: TextStyle(fontSize: 16 , color: Colors.purpleAccent, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,

                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    const Text(
                      'votre genre de musique préférée est le : ',
                      style: TextStyle(fontSize: 16 ,  fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,

                    ),
                    Text(
                      '${_answersChosen[2]} ',
                      style: TextStyle(fontSize: 16 , color: Colors.purpleAccent, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,

                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment:MainAxisAlignment.center,
                  children: [
                    const Text(
                      'votre activité de loisir préférée est le : ',
                      style: TextStyle(fontSize: 16 ,  fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,

                    ),
                    Text(
                      '${_answersChosen[3]} ',
                      style: TextStyle(fontSize: 16 , color: Colors.purpleAccent, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,

                    ),
                  ],
                ),
                Text(
                  ' C\'est fascinant de découvrir vos préférences ',
                  style: TextStyle(fontSize: 16 ,  fontWeight: FontWeight.w400),
                  textAlign: TextAlign.center,

                ),


                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: _restartQuiz,
                  child: Text('Restart Quiz'),
                ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}