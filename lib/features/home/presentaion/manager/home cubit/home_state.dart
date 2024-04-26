part of 'home_cubit.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}
class uplaodDataLoading extends HomeState {}
class uplaodDataSuccess extends HomeState {}
class uplaodDataError extends HomeState {
  final String error;
   uplaodDataError(this.error);
}
class getDataLoading extends HomeState {}
class getDataSucess extends HomeState {}
class getDataError extends HomeState {
  final String error;
  getDataError(this.error);
}
class _genderUpdate extends HomeState {}
class _heightUpdate extends HomeState {}
class _ageUpdate extends HomeState {}
class _weightUpdate extends HomeState {}
class _bmiCalculate extends HomeState {}
class _change extends HomeState {}
class setBmiInterpretationSucess extends HomeState {}








