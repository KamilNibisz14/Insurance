
class PolicyDuration{
  late DateTime dateFrom;
  late DateTime dateUntil;
  final DateTime _dateOfConclusion = DateTime.now();

  DateTime getDateOfConclusion(){
    return _dateOfConclusion;
  }
  PolicyDuration();
}