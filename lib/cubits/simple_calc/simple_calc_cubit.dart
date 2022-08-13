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

    if (tender >= cost) {
      //check if the amount paid is more than the cost of the product. If the amount paid is larger than the cost the application should display the amount of change the person should recieve
      while (totalChange >= 200) {
        //Check how many R200 notes the person should recieve as change
        breakdown.update('200', (value) => ++value);
        totalChange -= 200;
      }

      while (totalChange >= 50) {
        //Check how many R50 notes the person should recieve as change
        breakdown.update('50', (value) => ++value);
        totalChange -= 50;
      }

      while (totalChange >= 20) {
        //Check how many R20 notes the person should recieve as change
        breakdown.update('20', (value) => ++value);
        totalChange -= 20;
      }

      while (totalChange >= 10) {
        //Check how many R10 notes the person should recieve as change
        breakdown.update('10', (value) => ++value);
        totalChange -= 10;
      }

      while (totalChange >= 5) {
        //Check how many R5 coins the person should recieve as change
        breakdown.update('5', (value) => ++value);
        totalChange -= 5;
      }

      while (totalChange >= 2) {
        //Check how many R2 coins the person should recieve as change
        breakdown.update('2', (value) => ++value);
        totalChange -= 2;
      }

      while (totalChange >= 0.5) {
        //Check how many 50c coins the person should recieve as change
        breakdown.update('0.5', (value) => ++value);
        totalChange -= 0.5;
      }

      while (totalChange >= 0.2) {
        //Check how many 20c coins the person should recieve as change
        breakdown.update('0.2', (value) => ++value);
        totalChange -= 0.2;
      }

      while (totalChange >= 1) {
        //Check how many R1 coins the person should recieve as change
        breakdown.update('1', (value) => ++value);
        totalChange -= 1;
      }
    } else if (cost > tender) {
      //Check if the person paying for the product gave enough money. If they did not give enough money the application will show how much they still owe markek by a negative
      while (totalChange <= -200) {
        //Check how many R200 notes the person still needs to pay
        breakdown.update('200', (value) => --value);
        totalChange += 200;
      }

      while (totalChange <= -50) {
        //Check how many R50 notes the person still needs to pay
        breakdown.update('50', (value) => --value);
        totalChange += 50;
      }

      while (totalChange <= -20) {
        //Check how many R20 notes the person still needs to pay
        breakdown.update('20', (value) => --value);
        totalChange += 20;
      }

      while (totalChange <= -10) {
        //Check how many R10 notes the person still needs to pay
        breakdown.update('10', (value) => --value);
        totalChange += 10;
      }

      while (totalChange <= -5) {
        //Check how many R5 coins the person still needs to pay
        breakdown.update('5', (value) => --value);
        totalChange += 5;
      }

      while (totalChange <= -2) {
        //Check how many R2 coins the person still needs to pay
        breakdown.update('2', (value) => --value);
        totalChange += 2;
      }

      while (totalChange <= -1) {
        //Check how many R1 coins the person still needs to pay
        breakdown.update('1', (value) => --value);
        totalChange += 1;
      }

      while (totalChange <= -0.5) {
        //Check how many 50c coins the person still needs to pay
        breakdown.update('0.5', (value) => --value);
        totalChange += 0.5;
      }

      while (totalChange <= -0.2) {
        //Check how many 20c coins the person still needs to pay
        breakdown.update('0.2', (value) => --value);
        totalChange += 0.2;
      }
    }
    breakdown.removeWhere((key, value) =>
        value ==
        0); //Remove all the items in the map with a key value equal to 0 so only the notes/coins that needs to be given/recieved are displayed by the app
    totalChange = tender - cost;
    emit(SimpleCalcCalculated(breakdown, totalChange));
  }

  void clearAll() {
    emit(SimpleCalcCalculated({}, 0));
  }
}
