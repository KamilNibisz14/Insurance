import 'package:get_it/get_it.dart';
import 'package:insurance/features/login/domain/usecases/check_if_login_is_correct.dart';

import 'features/add_policy/data/repository/get_policy_ID.dart';
import 'features/add_policy/data/repository/save_data.dart';
import 'features/add_policy/domain/usecases/calculate_premiums.dart';
import 'features/search_policy/data/repository/get_policy_data.dart';

final locator = GetIt.instance;

void setup(){
  locator.registerLazySingleton<CheckLogin>(() => CheckLogin());
  locator.registerLazySingleton<CalculatePremiums>(() => CalculatePremiums());
  locator.registerLazySingleton<GetPolicyID>(() => GetPolicyID());
  locator.registerLazySingleton<AddDataToDatabase>(() => AddDataToDatabase());
  locator.registerLazySingleton<GetPolicyDataFromRepository>(() => GetPolicyDataFromRepository());
}