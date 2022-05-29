import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lifetime_expectation/constanst.dart';
import 'package:lifetime_expectation/user_data.dart';

import 'gender_column.dart';
import 'my_widget.dart';
import 'result_page.dart';
import 'user_data.dart';

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  String? chosenGender;
  double consumedSmoke = 0;
  double isExercise = 0;
  int height = 170;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: const Text(
          'LIFETIME EXPECTATION',
          style: TextStyle(color: Colors.black54),
        ),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: MyWidget(
                    child: buildRowWithOutlinedButton('HEIGHT'),
                    color: Colors.limeAccent,
                  ),
                ),
                Expanded(
                  child: MyWidget(
                    child: buildRowWithOutlinedButton('WEIGHT'),
                    color: Colors.limeAccent,
                  ),
                ),
              ],
            ),
          ),
          MyWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'Cigarettes you smoke per/day',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  consumedSmoke.round().toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.red),
                ),
                Slider(
                    label: 'Cigarette Count',
                    activeColor: Colors.red,
                    inactiveColor: Colors.green,
                    divisions: 20,
                    min: 0,
                    max: 20,
                    value: consumedSmoke,
                    onChanged: (double newValue) {
                      setState(() {
                        consumedSmoke = newValue;
                      });
                    })
              ],
            ),
            color: const Color(0xFF7FFFD4),
          ),
          MyWidget(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const SizedBox(
                  height: 7,
                ),
                const Text(
                  'How often do you exercise per week?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  isExercise.round().toString(),
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.green),
                ),
                Slider(
                    label: 'Day Count',
                    activeColor: Colors.green,
                    inactiveColor: Colors.red,
                    divisions: 7,
                    min: 0,
                    max: 7,
                    value: isExercise,
                    onChanged: (double newValue) {
                      setState(() {
                        isExercise = newValue;
                      });
                    })
              ],
            ),
            color: const Color(0xFF7FFFD4),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        chosenGender = 'Women';
                      });
                    },
                    child: MyWidget(
                        child: const GenderColumn(
                          gender: 'Women',
                          icon: FontAwesomeIcons.venus,
                        ),
                        color: chosenGender == 'Women'
                            ? Colors.pink
                            : Colors.white70),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        chosenGender = 'Man';
                      });
                    },
                    child: MyWidget(
                      child: const GenderColumn(
                        icon: FontAwesomeIcons.mars,
                        gender: 'Man',
                      ),
                      color: chosenGender == 'Man'
                          ? Colors.indigo[600]
                          : Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsetsDirectional.fromSTEB(16, 2, 16, 2),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFF6698FF),
                primary: Colors.black,
              ),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ResultPage(UserData(
                              chosenGender: chosenGender,
                              consumedSmoke: consumedSmoke,
                              isExercise: isExercise,
                              height: height,
                              weight: weight,
                            ))));
              },
              child: Text(
                'Calculate',
                style: commonTheme,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Row buildRowWithOutlinedButton(String label) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label,
            style: commonTheme,
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        RotatedBox(
          quarterTurns: -1,
          child: Text(
            label == 'HEIGHT' ? height.toString() : weight.toString(),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: const StadiumBorder(),
                  side: const BorderSide(width: 3)),
              onPressed: () {
                if (label == 'HEIGHT') {
                  setState(() {
                    height++;
                  });
                } else if (label == 'WEIGHT') {
                  setState(() {
                    weight++;
                  });
                }
              },
              onLongPress: () {
                if (label == 'HEIGHT') {
                  setState(() {
                    height = height + 10;
                  });
                } else if (label == 'WEIGHT') {
                  setState(() {
                    weight = weight + 5;
                  });
                }
              },
              child: const Icon(
                FontAwesomeIcons.plus,
                size: 15,
                color: Colors.black,
              ),
            ),
            OutlinedButton(
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.indigo,
                  shape: const StadiumBorder(),
                  side: const BorderSide(width: 3)),
              onPressed: () {
                if (label == 'HEIGHT') {
                  setState(() {
                    height--;
                  });
                } else if (label == 'WEIGHT') {
                  setState(() {
                    weight--;
                  });
                }
              },
              onLongPress: () {
                if (label == 'HEIGHT') {
                  setState(() {
                    height = height - 10;
                  });
                } else if (label == 'WEIGHT') {
                  setState(() {
                    weight = weight - 5;
                  });
                }
              },
              child: const Icon(
                FontAwesomeIcons.minus,
                size: 15,
                color: Colors.black,
              ),
            ),
          ],
        )
      ],
    );
  }
}
