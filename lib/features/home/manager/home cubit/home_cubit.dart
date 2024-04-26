import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:bmi_test/core/utils/cache_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_choice_chip/flutter_3d_choice_chip.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../constants.dart';
import '../models/home_model.dart';
part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit get(context)=>BlocProvider.of(context);
  bool finshed=false;
 void changeSwipeableButton(){
   finshed=!finshed;
   emit(_change());
 }
  ///////////////////////////gender
  String gender="";
  void setGender({required int num}){
    if(num==1){
      gender="Male";
      emit(_genderUpdate());
    }
    else if(num==2){
      gender="Female";
      emit(_genderUpdate());
    }
    else if(num==0){
      gender="Unknown";
      emit(_genderUpdate());
    }

  }
  final ChoiceChip3DStyle Selected=ChoiceChip3DStyle(
    borderRadius:BorderRadius.circular(10),
    topColor: Colors.blue,
    backColor: Colors.grey,
  );
  final ChoiceChip3DStyle unSelected=ChoiceChip3DStyle(
    borderRadius:BorderRadius.circular(10),
    topColor: Colors.white,
    backColor: Colors.grey[300]!,
  );
  //////////////////////////////height
  int height=170;
  void updateHeight({required int newHeight}){
    height=newHeight;
    emit(_heightUpdate());
  }
  //////////////////////age
  int minAge=1;
  int maxAge=100;
  int counterAge=25;
  void decAge(){
    if(counterAge>minAge)
      counterAge--;
      emit(_ageUpdate());
  }
  void IncAge(){
    if(counterAge<maxAge)
      counterAge++;
    emit(_ageUpdate());
  }
  ///////////////weight
  int minWeight=5;
  int maxWeight=100;
  int counterWeight=60;
  void decWeight(){
    if(counterWeight>minWeight)
      counterWeight--;
    emit(_weightUpdate());
  }
  void IncWeight(){
    if(counterWeight<maxWeight)
      counterWeight++;
    emit(_weightUpdate());
  }
  //////////////////calculate bmi
  double bmiScore=0;
  void calculateBMI({required int weight,required int height})  {
    bmiScore=weight/pow(height/100,2);
    emit(_bmiCalculate());
  }
  String bmiStatus='';
  String bmiInterpretation='';
  Color? bmiStatusColor;
  void setBmiInterpretation() {
    if (bmiScore > 30) {
      bmiStatus = "Obesity";
      bmiInterpretation = "Please work to reduce obesity";
      bmiStatusColor = Colors.pink;
    } else if (bmiScore >= 25) {
      bmiStatus = "Overweight";
      bmiInterpretation = "Do regular exercise to reduce your  weight";
      bmiStatusColor = Colors.orange;
    } else if (bmiScore >= 18.5) {
      bmiStatus = "Normal";
      bmiInterpretation = "Enjoy,You are fit";
      bmiStatusColor = Colors.green;
    } else if (bmiScore < 18.5) {
      bmiStatus = "Underweight";
      bmiInterpretation = "Try to increase your weight";
      bmiStatusColor = Colors.red;
    }
   emit(setBmiInterpretationSucess());
  }
  ////////////////////////////////uplad data
  void uploadData({
    required String gender,
    required int age,
    required int weight,
    required int height,
    required double bmi,
    required String dateTime,
    required String BMIstatus,
  }){
    emit(uplaodDataLoading());
    DataModel dataModel=DataModel(
     gender: gender,
     age: age,
     weight: weight,
     height: height,
     bmi: bmi,
      dateTime: dateTime,
      BMIstatus: BMIstatus,
    );
    FirebaseFirestore.instance.collection('data').add(dataModel.toMap()).then((value){
      emit(uplaodDataSuccess());
    }).catchError((error){
      emit(uplaodDataError(error.toString()));
    });

  }
  ////get data
  List <DataModel>alldata=[];
void getData(){
  alldata.clear();
  emit(getDataLoading());
    FirebaseFirestore.instance.collection('data').orderBy('dateTime').get().then((value) {
     value.docs.forEach((element) {
       alldata.add(DataModel.fromJson(element.data()));});
     emit(getDataSucess());
     print(alldata.length);
    }).catchError((error){
      emit(getDataError(error.toString()));
    });
}
void SignOut(){
  final FirebaseAuth _auth=FirebaseAuth.instance;
  _auth.signOut().then((value){
    CacheHelper.SignOut(key: 'uId');
  }).catchError((error){

  });
}
}
