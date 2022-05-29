import 'package:flutter/material.dart';
import 'package:lifetime_expectation/calculation.dart';
import 'package:lifetime_expectation/constanst.dart';
import 'package:lifetime_expectation/user_data.dart';

class ResultPage extends StatelessWidget {
  final UserData _userData;
  const ResultPage(this._userData, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Result Page',
          style: commonTheme,
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 8,
            child: Center(
              child: Text(
                'Expected Lifetime : ${Calculation(_userData).calculation().round()}',
                style: commonTheme,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.lightGreenAccent,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text(
                'Go Back',
                style: commonTheme,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
