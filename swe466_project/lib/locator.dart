import 'package:get_it/get_it.dart';
import 'package:swe466_project/services/databaseServices.dart';
import 'package:swe466_project/viewmodels/homeViewModel.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => DatabaseServices());
  locator.registerFactory(() => HomeViewModel());
}