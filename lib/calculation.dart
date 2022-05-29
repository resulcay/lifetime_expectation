import 'package:lifetime_expectation/user_data.dart';

class Calculation {
  final UserData _userData;
  Calculation(this._userData);

  double calculation() {
    double result;

    result = (90 + _userData.isExercise! - _userData.consumedSmoke!);
    result = result + (_userData.height! / _userData.weight!);

    if (_userData.chosenGender == 'Women') {
      return result + 3;
    } else {
      return result;
    }
  }
}
