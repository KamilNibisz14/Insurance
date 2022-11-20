import 'package:insurance/core/PolicyView/domain/entities/policy_view_data.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddDataToDatabase{
  void saveData(PolicyViewData policyViewData) async{
    PolicyViewData policyData = policyViewData;
    final docPolicy = FirebaseFirestore.instance.collection('policy').doc(policyData.policyID);
    Map<String, dynamic> jsonData = {
    'policyID': policyData.policyID,
    'dateOfConclusion': policyData.dateOfConclusion,
    'periodFrom': policyData.periodFrom,
    'periodUntil': policyData.periodUntil,
    'ownerName': policyData.ownerName,
    'ownerSurname': policyData.ownerSurname,
    'ownerPersonalID': policyData.ownerPersonalID,
    'ownerCity': policyData.ownerCity,
    'ownerStreet': policyData.ownerStreet,
    'ownerApartment': policyData.ownerApartment,
    'ownerPostalNumber': policyData.ownerPostalNumber,
    'userName': policyData.userName,
    'userSurname': policyData.userSurname,
    'userPersonalID': policyData.userPersonalID,
    'userCity': policyData.userCity,
    'userStreet': policyData.userStreet,
    'userApartment': policyData.userApartment,
    'userPostalNumber': policyData.userPostalNumber,
    'brand': policyData.brand,
    'model': policyData.model,
    'registrationNumber': policyData.registrationNumber,
    'vinNumber': policyData.vinNumber,
    'engineCapacity': policyData.engineCapacity,
    'enginePower': policyData.enginePower,
    'weight': policyData.weight,
    'numberOfSeats': policyData.numberOfSeats,
    'dateOfProduction': policyData.dateOfProduction,
    'datesOfPremiums': policyData.datesOfPremiums,
    'premiums': policyData.premiums,
    };

    await docPolicy.set(jsonData);

  }
}