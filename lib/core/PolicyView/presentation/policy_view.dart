import 'package:flutter/material.dart';
import 'package:insurance/core/PolicyView/domain/entities/policy_view_data.dart';
import 'package:insurance/core/PolicyView/presentation/widgets/car_data.dart';
import 'package:insurance/core/PolicyView/presentation/widgets/personal_data.dart';
import 'package:insurance/core/PolicyView/presentation/widgets/policy_id.dart';
import 'package:insurance/core/PolicyView/presentation/widgets/policy_period.dart';
import 'package:insurance/core/PolicyView/presentation/widgets/premiums_data.dart';

// ignore: must_be_immutable
class PolicyView extends StatelessWidget {
  PolicyView({
    Key? key,
    required this.policyData
  }) : super(key: key);

  PolicyViewData policyData;
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double policyNumberTextSize = screenWidth / 18;
    double contentFontSize = screenWidth / 23;
    double premiumsFontSize = contentFontSize * 0.85;
    double iconSize = screenWidth / 20;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        PolicyIDWidget(
          policyID: policyData.policyID,
          fontSize: policyNumberTextSize,),
        PolicyPeriodWidget(
          dateOfConclusion: policyData.dateOfConclusion,
          periodFrom: policyData.periodFrom,
          periodUntil: policyData.periodUntil,
          fontSize: contentFontSize,
          iconSize: iconSize,
        ),
        PersonalDataWidget(
          typeOfClient: 'Owner',
          name: policyData.ownerName,
          surname: policyData.ownerSurname,
          personalID: policyData.ownerPersonalID,
          city: policyData.ownerCity,
          street: policyData.ownerStreet,
          apartment: policyData.ownerApartment,
          postal: policyData.ownerPostalNumber,
          fontSize: contentFontSize,
          iconSize: iconSize,
        ),
        PersonalDataWidget(
          typeOfClient: 'User',
          name: policyData.userName,
          surname: policyData.userSurname,
          personalID: policyData.userPersonalID,
          city: policyData.userCity,
          street: policyData.userStreet,
          apartment: policyData.userApartment,
          postal: policyData.userPostalNumber,
          fontSize: contentFontSize,
          iconSize: iconSize,
        ),
        CarDataWidgets(
          brand: policyData.brand,
          model: policyData.model,
          dateOfProduction: policyData.dateOfProduction,
          vinNumber: policyData.vinNumber,
          registrationNumber: policyData.registrationNumber,
          engineCapacity: policyData.engineCapacity.toString(),
          enginePower: policyData.enginePower.toString(),
          weight: policyData.weight.toString(),
          numberOfSeats: policyData.numberOfSeats.toString(),
          fontSize: contentFontSize,
          iconSize: iconSize,
        ),
        PremiumsDataWidget(
          datesOfPremiums: policyData.datesOfPremiums,
          premiums: policyData.premiums,
          titleTextSize: contentFontSize,
          fontSize: premiumsFontSize,
          iconSize: iconSize,
        ),
      ],
    );
  }
}
