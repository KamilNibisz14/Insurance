part of 'add_policy_bloc.dart';

abstract class AddPolicyEvent extends Equatable {
  const AddPolicyEvent();

  @override
  List<Object> get props => [];
}

// ignore: must_be_immutable
class AddPolicyDuration extends AddPolicyEvent{
  PolicyDuration policyDuration;
  AddPolicyDuration({
    required this.policyDuration
  });
  @override
  List<Object> get props => [policyDuration];
}
// ignore: must_be_immutable
class AddCarOwnerData extends AddPolicyEvent{
  CarOwnerData carOwnerData;
  AddCarOwnerData({
    required this.carOwnerData
  });
  @override
  List<Object> get props => [carOwnerData];
}
// ignore: must_be_immutable
class AddCarUserData extends AddPolicyEvent{
  CarUserData carUserData;
  AddCarUserData({
    required this.carUserData
  });
  @override
  List<Object> get props => [carUserData];
}
// ignore: must_be_immutable
class AddCarData extends AddPolicyEvent{
  CarData carData;
  AddCarData({
    required this.carData
  });
  @override
  List<Object> get props => [carData];
}
// ignore: must_be_immutable
class AddInsuranceCoverage extends AddPolicyEvent{
  InsuranceCoverageData insuranceCoverageData;
  AddInsuranceCoverage({
    required this.insuranceCoverageData
  });
  @override
  List<Object> get props => [insuranceCoverageData];
}
// ignore: must_be_immutable
class AddNumbersOfPremiums extends AddPolicyEvent{
  int numberOfPremiums;
  AddNumbersOfPremiums({
    required this.numberOfPremiums
  });
  @override
  List<Object> get props => [numberOfPremiums];
}

class CalculatePremiumsEvent extends AddPolicyEvent{}

class SaveDataEvent extends AddPolicyEvent{}

