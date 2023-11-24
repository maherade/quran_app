part of 'app_cubit.dart';

@immutable
abstract class AppState {}

class InitialState extends AppState  {}
class LaunchState extends AppState {}

class GetSurahLoadingState extends AppState {}
class GetSurahSuccessState extends AppState {}
class GetSurahErrorState extends AppState {}
class GetAyahLoadingState extends AppState {}
class GetAyahSuccessState extends AppState {}
class GetAyahErrorState extends AppState {}
class GetZekrLoadingState extends AppState {}
class GetZekrSuccessState extends AppState {}
class GetZekrErrorState extends AppState {}
class GetAudioLoadingState extends AppState {}
class GetAudioSuccessState extends AppState {}
class GetAudioErrorState extends AppState {}
class PlayAudioState extends AppState {}
class StopAudioState extends AppState {}
class GetTafseerLoadingState extends AppState {}
class GetTafseerSuccessState extends AppState {}
class GetTafseerErrorState extends AppState {}
class ChangeCounterState extends AppState {}

