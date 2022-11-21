import 'package:insurance/features/add_policy/domain/entities/fuel_type_enum.dart';
import 'package:insurance/features/add_policy/domain/entities/insurance_coverage_data.dart';

import '../entities/premiums_data.dart';

class CalculatePremiums {

  //main constants
  static const int personalIDYearOfBirthValue = 20;
  static const int dateSubstringValue = 10;
  static const double policyDurationDivider = 365;
  static const double premiumsInTotalIfPremiumISTooLow = 25;

  //period constants
  static const int montPolicyPeriod = 30;
  static const int halfAMonthPeriod = 14;
  static const int weekPolicyPeriod = 7;
  // calculate oc premiums constants
  static const double ocOwnerCarDividend = 500;
  static const double ocUserCarDividend = 1000;
  static const double ocEngineCapacityDivider = 100;
  static const double ocEnginePowerDivider = 90;
  // calculate ac premiums constants
  static const double acOwnerCarDividend = 500;
  static const double acUserCarDividend = 1200;
  static const double acEngineCapacityDivider = 100;
  static const double acEnginePowerDivider = 80;
  // calculate kr premiums constants
  static const double krOwnerCarDividend = 300;
  static const double krUserCarDividend = 500;
  static const double krEngineCapacityDivider = 100;
  static const double krEnginePowerDivider = 100;
  // calculate fuel multiplication constants
  static const double petrolMultiplication = 1.0;
  static const double dieselMultiplication = 1.1;
  static const double lpgMultiplication = 1.1;
  static const double electricMultiplication = 1.2;
  static const double hybridMultiplication = 1.0;
  // calculate nnw premiums constants
  static const double nnwBreakPoint = 3000;
  static const double nnwSmallerPremium = 60;
  static const double nnwBiggerPremium = 60;
  // calculate was premiums constants
  static const double wasBreakPoint = 3000;
  static const double wasSmallerPremium = 102;
  static const double wasBiggerPremium = 160;
  // calculate other premiums constants
  static const double blsPremium = 16;
  static const double assPremium = 12;
  static const double windowsPremium = 114;
  static const double tiresPremium = 102;




  PremiumsData calculatePremiums(String ownerPersonalID,String userPersonalID,DateTime dateFrom,dateUntil,int engineCapacity,int enginePower,FuelType fuelType,int numbersOfPremiums,InsuranceCoverageData insuranceCoverageData) {
    int ownerAge = _calculatePersonAgeInDays(ownerPersonalID);
    int userAge = _calculatePersonAgeInDays(userPersonalID);
    int policyDuration = dateUntil.difference(dateFrom).inDays;

    PremiumsData premiumsData = PremiumsData();
    premiumsData.datesOfPremiums = _getPremiumsDates(numbersOfPremiums, policyDuration);

    premiumsData.premiums = _getPremiums(policyDuration, ownerAge, userAge, engineCapacity, enginePower, numbersOfPremiums, fuelType, insuranceCoverageData,);

    return premiumsData;
  }
  int _calculatePersonAgeInDays(String personalID){
    DateTime currDate = DateTime.now();
    int currYear = currDate.year;
    if(int.parse(personalID.substring(2,4)) > personalIDYearOfBirthValue) {
      int yearOfBirth = int.parse('20${personalID.substring(0,2)}');
      return currYear-yearOfBirth;
    }
    else{
      int yearOfBirth = int.parse('19${personalID.substring(0,2)}');
      return currYear-yearOfBirth;
    }
  }
  List<String> _getPremiumsDates(int numberOfPremiums, int policyDuration){
    List<String> datesOfPremiums = [];
    if(policyDuration <= montPolicyPeriod){
      if(policyDuration <= weekPolicyPeriod){
        datesOfPremiums.add(DateTime.now().toString().substring(0,dateSubstringValue));
      }
      else{
        datesOfPremiums.add(DateTime.now().add(const Duration(days: weekPolicyPeriod)).toString().substring(0,dateSubstringValue));
      }
    }
    else{
      if(numberOfPremiums == 1){
        datesOfPremiums.add(DateTime.now().add(const Duration(days: halfAMonthPeriod)).toString().substring(0,dateSubstringValue));
      }
      else{
        datesOfPremiums.add(DateTime.now().add(const Duration(days: halfAMonthPeriod)).toString().substring(0,dateSubstringValue));
        int breakBetween = ((policyDuration  - halfAMonthPeriod) / numberOfPremiums).floor();
        for(int i = 1; i < numberOfPremiums; ++i){
          datesOfPremiums.add(DateTime.now().add(Duration(days: i * breakBetween)).toString().substring(0,dateSubstringValue));
        }
      }
    }
    return datesOfPremiums;
  }
  List<int> _getPremiums(
      int policyDuration,
      int ownerAge,
      int userAge,
      int engineCapacity,
      int enginePower,
      int numberOfPremiums,
      FuelType fuelType,
      InsuranceCoverageData insuranceCoverage,
      ){

    List<int> premiums = [];

    double premiumsInTotal = _calcOC(policyDuration, ownerAge, userAge, engineCapacity, enginePower, fuelType);
    if(insuranceCoverage.hasAC == true){
      premiumsInTotal += _calcAC(policyDuration, ownerAge, userAge, engineCapacity, enginePower, fuelType);
    }
    if(insuranceCoverage.hasKR == true){
      premiumsInTotal += _calcKR(policyDuration, ownerAge, userAge, engineCapacity, enginePower, fuelType);
    }
    if(insuranceCoverage.hasASS == true){
      premiumsInTotal += _calcASS(engineCapacity, enginePower);
    }
    if(insuranceCoverage.hasBLS == true){
      premiumsInTotal += _calcBLS(engineCapacity, enginePower);
    }
    if(insuranceCoverage.hasNNW == true){
      premiumsInTotal += _calcNNW(engineCapacity, enginePower);
    }
    if(insuranceCoverage.hasTires == true){
      premiumsInTotal += _calcTires();
    }
    if(insuranceCoverage.hasWAS == true){
      premiumsInTotal += _calcWAS(engineCapacity, enginePower);
    }
    if(insuranceCoverage.hasWindows == true){
      premiumsInTotal += _calcWindows();
    }
    if(premiumsInTotal <=premiumsInTotalIfPremiumISTooLow){
      premiumsInTotal = premiumsInTotalIfPremiumISTooLow;
    }

    if(policyDuration <= montPolicyPeriod){
      premiums.add(premiumsInTotal.ceil());
      return premiums;
    }else{
      for(int i = 0; i < numberOfPremiums; ++i){
        premiums.add((premiumsInTotal / numberOfPremiums).ceil());
      }
      return premiums;
    }
  }

  double _calcOC(
      int policyDuration,
      int ownerAge,
      int userAge,
      int engineCapacity,
      int enginePower,
      FuelType fuelType,
      ){
    double premium = (((ocOwnerCarDividend / ownerAge) + (ocUserCarDividend / userAge)) * ((engineCapacity / ocEngineCapacityDivider) + (enginePower / ocEnginePowerDivider))) * (policyDuration/policyDurationDivider);
    if (fuelType == FuelType.Petrol) {
      premium *= petrolMultiplication;
    }
    else if(fuelType == FuelType.Diesel) {
      premium *= dieselMultiplication;
    }
    else if (fuelType == FuelType.LPG) {
      premium *= lpgMultiplication;
    }
    else if (fuelType == FuelType.Electric) {
      premium *= electricMultiplication;
    }
    else if (fuelType == FuelType.Hybrid) {
      premium *= hybridMultiplication;
    }

    return premium;

  }
  double _calcAC(
      int policyDuration,
      int ownerAge,
      int userAge,
      int engineCapacity,
      int enginePower,
      FuelType fuelType,
      ){
    double premium = (((acOwnerCarDividend / ownerAge) + (acUserCarDividend / userAge)) * ((engineCapacity / acEngineCapacityDivider) + (enginePower / acEnginePowerDivider))) * (policyDuration/policyDurationDivider);
    if (fuelType == FuelType.Petrol) {
      premium *= petrolMultiplication;
    }
    else if(fuelType == FuelType.Diesel) {
      premium *= dieselMultiplication;
    }
    else if (fuelType == FuelType.LPG) {
      premium *= lpgMultiplication;
    }
    else if (fuelType == FuelType.Electric) {
      premium *= electricMultiplication;
    }
    else if (fuelType == FuelType.Hybrid) {
      premium *= hybridMultiplication;
    }

    return premium;


  }
  double _calcKR(
      int policyDuration,
      int ownerAge,
      int userAge,
      int engineCapacity,
      int enginePower,
      FuelType fuelType,
      ){

    double premium = (((krOwnerCarDividend / ownerAge) + (krUserCarDividend / userAge)) * ((engineCapacity / krEngineCapacityDivider) + (enginePower / krEnginePowerDivider))) * (policyDuration/policyDurationDivider);
    if (fuelType == FuelType.Petrol) {
      premium *= petrolMultiplication;
    }
    else if(fuelType == FuelType.Diesel) {
      premium *= dieselMultiplication;
    }
    else if (fuelType == FuelType.LPG) {
      premium *= lpgMultiplication;
    }
    else if (fuelType == FuelType.Electric) {
      premium *= electricMultiplication;
    }
    else if (fuelType == FuelType.Hybrid) {
      premium *= hybridMultiplication;
    }

    return premium;

  }
  double _calcNNW(int engineCapacity, int enginePower,){

    if (engineCapacity + enginePower < nnwBreakPoint) {
      return nnwSmallerPremium;
    }
    else{
      return nnwBiggerPremium;
    }
  }
  double _calcBLS(int engineCapacity, int enginePower,){
    return blsPremium;
  }
  double _calcASS(int engineCapacity, int enginePower,){
    return assPremium;
  }
  double _calcWindows(){
    return windowsPremium;
  }
  double _calcTires(){

    return tiresPremium;
  }
  double _calcWAS(int engineCapacity, int enginePower,){
    if (engineCapacity + enginePower < wasBreakPoint) {
      return wasSmallerPremium;
    }
    else{
      return wasBiggerPremium;
    }

  }
}