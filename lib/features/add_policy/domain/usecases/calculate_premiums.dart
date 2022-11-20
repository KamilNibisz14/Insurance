import 'package:insurance/features/add_policy/domain/entities/fuel_type_enum.dart';
import 'package:insurance/features/add_policy/domain/entities/insurance_coverage_data.dart';

import '../entities/premiums_data.dart';

class CalculatePremiums {
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
    if(int.parse(personalID.substring(2,4)) > 20) {
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
    if(policyDuration <= 30){
      if(policyDuration <= 7){
        datesOfPremiums.add(DateTime.now().toString().substring(0,10));
      }
      else{
        datesOfPremiums.add(DateTime.now().add(const Duration(days: 7)).toString().substring(0,10));
      }
    }
    else{
      if(numberOfPremiums == 1){
        datesOfPremiums.add(DateTime.now().add(const Duration(days: 14)).toString().substring(0,10));
      }
      else{
        datesOfPremiums.add(DateTime.now().add(const Duration(days: 14)).toString().substring(0,10));
        int breakBetween = ((policyDuration  - 14) / numberOfPremiums).floor();
        for(int i = 1; i < numberOfPremiums; ++i){
          datesOfPremiums.add(DateTime.now().add(Duration(days: i * breakBetween)).toString().substring(0,10));
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
    if(premiumsInTotal ==0){
      premiumsInTotal = 25;
    }

    if(policyDuration <= 30){
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
    double premium = (((500.0 / ownerAge) + (1000.0 / userAge)) * ((engineCapacity / 100.0) + (enginePower / 90.0))) * (policyDuration/365.0);
    if (fuelType == FuelType.Petrol) {
      premium *= 1.0;
    }
    else if(fuelType == FuelType.Diesel) {
      premium *= 1.1;
    }
    else if (fuelType == FuelType.LPG) {
      premium *= 1.1;
    }
    else if (fuelType == FuelType.Electric) {
      premium *= 1.2;
    }
    else if (fuelType == FuelType.Hybrid) {
      premium *= 1.0;
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
    double premium = (((500.0 / ownerAge) + (1200.0 / userAge)) * ((engineCapacity / 100.0) + (enginePower / 80.0))) * (policyDuration/365.0);
    if (fuelType == FuelType.Petrol) {
      premium *= 1.0;
    }
    else if(fuelType == FuelType.Diesel) {
      premium *= 1.1;
    }
    else if (fuelType == FuelType.LPG) {
      premium *= 1.1;
    }
    else if (fuelType == FuelType.Electric) {
      premium *= 1.2;
    }
    else if (fuelType == FuelType.Hybrid) {
      premium *= 1.0;
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

    double premium = (((300.0 / ownerAge) + (500.0 / userAge)) * ((engineCapacity / 100.0) + (enginePower / 100.0))) * (policyDuration/365.0);
    if (fuelType == FuelType.Petrol) {
      premium *= 1.0;
    }
    else if(fuelType == FuelType.Diesel) {
      premium *= 1.1;
    }
    else if (fuelType == FuelType.LPG) {
      premium *= 1.1;
    }
    else if (fuelType == FuelType.Electric) {
      premium *= 1.2;
    }
    else if (fuelType == FuelType.Hybrid) {
      premium *= 1.0;
    }

    return premium;

  }
  double _calcNNW(int engineCapacity, int enginePower,){

    if (engineCapacity + enginePower < 3000) {
      return 60;
    }
    else{
      return 120;
    }
  }
  double _calcBLS(int engineCapacity, int enginePower,){
    return 16;
  }
  double _calcASS(int engineCapacity, int enginePower,){
    return 12;
  }
  double _calcWindows(){
    return 114;
  }
  double _calcTires(){

    return 102;

  }
  double _calcWAS(int engineCapacity, int enginePower,){
    if (engineCapacity + enginePower < 3000) {
      return 102;
    }
    else{
      return 160;
    }

  }



}