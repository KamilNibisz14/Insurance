import 'fuel_type_enum.dart';

class CarData{
  late String brand;
  late String model;
  late String countryOfRegistration;
  late String registrationNumber;
  late String vin;
  late int engineCapacity;
  late int enginePower;
  late int weight;
  late int numberOfSeats;
  late DateTime productionDate;
  late FuelType fuelType;

  CarData({
    this.fuelType = FuelType.Petrol,
});

}