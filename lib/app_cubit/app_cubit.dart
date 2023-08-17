import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_states.dart';

class AppCubit extends Cubit<AppStates>{

  AppCubit() : super(AppInitialState());


  double currentHeight = 100;

  int currentWeight = 60;
  int currentAge = 21;
  bool? isMale;

  void changeGender(bool value){
    isMale = value;
    emit(ChangeGenderState());
  }

  void changeHeight(double value){
    currentHeight = value;

    emit(ChangeHeightState());
  }

  void changeWeight(int value){
    currentWeight = value;
    emit(ChangeWeightState());
  }

  void changeAge(int value){
    currentAge = value;
    emit(ChangeAgeState());
  }

}