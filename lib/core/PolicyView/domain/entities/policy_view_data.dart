
class PolicyViewData{
  String policyID;
  String dateOfConclusion;
  String periodFrom;
  String periodUntil;
  String ownerName;
  String ownerSurname;
  String ownerPersonalID;
  String ownerCity;
  String ownerStreet;
  String ownerApartment;
  String ownerPostalNumber;
  String userName;
  String userSurname;
  String userPersonalID;
  String userCity;
  String userStreet;
  String userApartment;
  String userPostalNumber;
  String brand;
  String model;
  String registrationNumber;
  String vinNumber;
  int engineCapacity;
  int enginePower;
  int weight;
  int numberOfSeats;
  String dateOfProduction;
  List<String> datesOfPremiums;
  List<int> premiums;

  PolicyViewData({
    required this.vinNumber,
    required this.premiums,
    required this.datesOfPremiums,
    required this.registrationNumber,
    required this.dateOfProduction,
    required this.model,
    required this.brand,
    required this.periodUntil,
    required this.periodFrom,
    required this.dateOfConclusion,
    required this.ownerApartment,
    required this.ownerCity,
    required this.ownerName,
    required this.ownerPersonalID,
    required this.ownerStreet,
    required this.ownerSurname,
    required this.policyID,
    required this.userApartment,
    required this.userCity,
    required this.userName,
    required this.userPersonalID,
    required this.userStreet,
    required this.userSurname,
    required this.ownerPostalNumber,
    required this.userPostalNumber,
    required this.enginePower,
    required this.engineCapacity,
    required this.numberOfSeats,
    required this.weight
});

}