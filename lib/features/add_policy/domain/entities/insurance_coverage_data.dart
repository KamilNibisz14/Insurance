// ignore: camel_case_types
class InsuranceCoverageData{
  bool hasAC;
  bool hasASS;
  bool hasBLS;
  bool hasKR;
  bool hasNNW;
  bool hasOC;
  bool hasTires;
  bool hasWAS;
  bool hasWindows;
  InsuranceCoverageData({
    this.hasAC = false,
    this.hasASS = false,
    this.hasBLS = false,
    this.hasKR = false,
    this.hasNNW = false,
    this.hasOC = true,
    this.hasTires = false,
    this.hasWAS = false,
    this.hasWindows = false,
});
}