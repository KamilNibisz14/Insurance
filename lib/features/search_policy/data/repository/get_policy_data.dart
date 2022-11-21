
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:insurance/core/PolicyView/domain/entities/policy_view_data.dart';

class GetPolicyDataFromRepository{

  late PolicyViewData policyViewData;
  Future<bool> checkIfDocumentExist(String policyID)async{
    var document = FirebaseFirestore.instance.collection('policy').doc(policyID);
    var value = await document.get();
    if(value.exists){
      return true;
    }
    else{
      return false;
    }
  }


  Future<PolicyViewData> getPolicyDocument(String policyID) async {
    await _getPolicyData(policyID);
    return policyViewData;
  }

  // ignore: non_constant_identifier_names
  Future<void> _getPolicyData(String policyID) async{
    var document = FirebaseFirestore.instance.collection('policy').doc(policyID);
    var value = await document.get();
    {
      policyViewData =
      PolicyViewData(
      vinNumber: value['vinNumber'],
      premiums:List<int>.from(value['premiums'] as List),
      datesOfPremiums:List<String>.from(value['datesOfPremiums'] as List),
      registrationNumber: value['registrationNumber'],
      dateOfProduction: value['dateOfProduction'],
      model: value['model'],
      brand: value['brand'],
      periodUntil: value['periodUntil'],
      periodFrom: value['periodFrom'],
      dateOfConclusion: value['dateOfConclusion'],
      ownerApartment: value['ownerApartment'],
      ownerCity: value['ownerCity'],
      ownerName: value['ownerName'],
      ownerPersonalID: value['ownerPersonalID'],
      ownerStreet: value['ownerStreet'],
      ownerSurname: value['ownerSurname'],
      policyID:value['policyID'],
      userApartment: value['userApartment'],
      userCity:value['userCity'],
      userName:value['userName'],
      userPersonalID:value['userPersonalID'],
      userStreet:value['userStreet'],
      userSurname:value['userSurname'],
      ownerPostalNumber:value['ownerPostalNumber'],
      userPostalNumber: value['userPostalNumber'],
      enginePower:value['enginePower'],
      engineCapacity:value['engineCapacity'],
      numberOfSeats:value['numberOfSeats'],
      weight:value['weight']
      );
    }
  }  


}