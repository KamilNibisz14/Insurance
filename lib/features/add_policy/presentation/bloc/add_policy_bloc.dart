import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:insurance/features/add_policy/data/repository/save_data.dart';
import 'package:insurance/features/add_policy/domain/entities/car_owner_data.dart';
import 'package:insurance/features/add_policy/domain/entities/car_user_data.dart';

import '../../../../core/PolicyView/domain/entities/policy_view_data.dart';
import '../../../../locator.dart';
import '../../data/repository/get_policy_ID.dart';
import '../../domain/entities/car_data.dart';
import '../../domain/entities/insurance_coverage_data.dart';
import '../../domain/entities/policy_duration_data.dart';
import '../../domain/entities/premiums_data.dart';
import '../../domain/usecases/calculate_premiums.dart';

part 'add_policy_event.dart';
part 'add_policy_state.dart';

class AddPolicyBloc extends Bloc<AddPolicyEvent, AddPolicyState> {
  late PolicyDuration policyDuration;
  late CarOwnerData carOwnerData;
  late CarUserData carUserData;
  late CarData carData;
  late int numberOfPremiums;
  late InsuranceCoverageData insuranceCoverageData;
  late PremiumsData premiumsData;
  late PolicyViewData policyData;
  
  AddPolicyBloc() : super(AddPolicyInitial()) {
    on<AddPolicyEvent>((event, emit) {
    });
    on<AddPolicyDuration>(_onAddPolicyDuration);
    on<AddCarOwnerData>(_onAddCarOwnerData);
    on<AddCarUserData>(_onAddCarUserData);
    on<AddCarData>(_onAddCarData);
    on<AddInsuranceCoverage>(_onAddInsuranceCoverage);
    on<AddNumbersOfPremiums>(_onAddNumbersOfPremiums);
    on<CalculatePremiumsEvent>(_onCalculatePremiums);
    on<SaveDataEvent>(_onSaveData);
  }

  _onAddPolicyDuration(AddPolicyDuration event, Emitter<AddPolicyState> emit){
    policyDuration = event.policyDuration;
    emit(FillPolicyState());
  }
    _onAddCarOwnerData(AddCarOwnerData event, Emitter<AddPolicyState> emit){
    carOwnerData = event.carOwnerData;
    emit(FillPolicyState());
  }
  _onAddCarUserData(AddCarUserData event, Emitter<AddPolicyState> emit){
    carUserData = event.carUserData;
    emit(FillPolicyState());
  }
  _onAddCarData(AddCarData event, Emitter<AddPolicyState> emit){
    carData = event.carData;
    emit(FillPolicyState());
  }

  _onAddInsuranceCoverage(AddInsuranceCoverage event, Emitter<AddPolicyState> emit){
    insuranceCoverageData = event.insuranceCoverageData;
    emit(FillPolicyState());
  }
  _onAddNumbersOfPremiums(AddNumbersOfPremiums event, Emitter<AddPolicyState> emit){
    numberOfPremiums = event.numberOfPremiums;
    emit(FillPolicyState());
  }
  _onCalculatePremiums(CalculatePremiumsEvent event, Emitter<AddPolicyState> emit)async{
     premiumsData = locator.get<CalculatePremiums>().calculatePremiums(carOwnerData.personalID, carUserData.personalID, policyDuration.dateFrom, policyDuration.dateUntil, carData.engineCapacity, carData.enginePower, carData.fuelType, numberOfPremiums, insuranceCoverageData);

     policyData = await getPolicyData();
     emit(PolicyViewState(policyData: policyData));
  }

  _onSaveData(SaveDataEvent event, Emitter<AddPolicyState> emit){
    locator.get<AddDataToDatabase>().saveData(policyData);
    emit(FillPolicyState());
  }

  Future<PolicyViewData> getPolicyData()async{
    return PolicyViewData(
        vinNumber: carData.vin,
        premiums: premiumsData.premiums,
        datesOfPremiums: premiumsData.datesOfPremiums,
        registrationNumber: carData.registrationNumber,
        dateOfProduction: carData.productionDate.toString().substring(0,10),
        model: carData.model,
        brand: carData.brand,
        periodUntil: policyDuration.dateUntil.toString().substring(0,10),
        periodFrom: policyDuration.dateFrom.toString().substring(0,10),
        dateOfConclusion: policyDuration.getDateOfConclusion().toString().substring(0,10),
        ownerApartment: '${carOwnerData.houseNumber}/${carOwnerData.apartmentNumber}',
        ownerCity: carOwnerData.city,
        ownerName: carOwnerData.name,
        ownerPersonalID: carOwnerData.personalID,
        ownerStreet: carOwnerData.street,
        ownerSurname: carOwnerData.surname,
        policyID: await locator.get<GetPolicyID>().getPolicyID(),
        userApartment: '${carUserData.houseNumber}/${carUserData.apartmentNumber}',
        userCity: carUserData.city,
        userName: carUserData.name,
        userPersonalID: carUserData.personalID,
        userStreet: carUserData.street,
        userSurname: carUserData.surname,
        ownerPostalNumber: carOwnerData.postalNumber,
        userPostalNumber: carUserData.postalNumber,
        enginePower: carData.enginePower,
        engineCapacity: carData.engineCapacity,
        numberOfSeats: carData.numberOfSeats,
        weight: carData.weight,
    );
  }


}
