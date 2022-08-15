import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:get/get.dart';

part 'simple_calc_state.dart';

class SimpleCalcCubit extends Cubit<SimpleCalcState> {
  SimpleCalcCubit() : super(SimpleCalcCalculated({}, 0));

  List<num> validDenominations = [200, 50, 20, 10, 5, 2, 1, 0.5, 0.2];

  void calculateWithMod(double? cost, double? tender) {
    if (cost == null || tender == null) return;

    num totalChange = tender - cost;
    Map<String, num> breakdown = {
      '200': 0,
      '50': 0,
      '20': 0,
      '10': 0,
      '5': 0,
      '2': 0,
      '1': 0,
      '0.5': 0,
      '0.2': 0
    };

    // TODO - Calculate your breakdown here, put the results in a map, with the validDenominations as the key, and the result as the value

    if (totalChange > 0) {
      validDenominations.forEach((i) {
        var val = (totalChange / i).floor();
        totalChange = totalChange % i;
        breakdown['${i}'] = val;
      });
    } else {
      print('Not enough funds.');
    }

    breakdown.removeWhere((key, value) =>
        -value ==
        0); //Remove all the items in the map with a key value equal to 0 so only the notes/coins that needs to be given/recieved are displayed by the app
    totalChange = tender - cost;

    emit(SimpleCalcCalculated(breakdown, totalChange));
  }

  void clearAll() {
    emit(SimpleCalcCalculated({}, 0));
  }
}
