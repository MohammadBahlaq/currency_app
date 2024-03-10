class Trasnaction {
  String? selectedDate;
  String? countryCode1;
  String? countryName1;
  String? countryFlag1;
  double? currencyPrice1;

  String? countryCode2;
  String? countryName2;
  String? countryFlag2;
  double? currencyPrice2;

  Trasnaction({
    this.selectedDate,
    this.countryCode1,
    this.countryName1,
    this.countryFlag1,
    this.currencyPrice1,
    this.countryCode2,
    this.countryName2,
    this.countryFlag2,
    this.currencyPrice2,
  });

  factory Trasnaction.fromJson(Map<String, dynamic> json) => Trasnaction(
        selectedDate: json["selectedDate"],
        countryCode1: json["countryCode1"],
        countryName1: json["countryName1"],
        countryFlag1: json["countryFlag1"],
        currencyPrice1: json["currencyPrice1"],
        countryCode2: json["countryCode2"],
        countryName2: json["countryName2"],
        countryFlag2: json["countryFlag2"],
        currencyPrice2: json["currencyPrice2"],
      );

  Map<String, dynamic> toJson() => {
        "selectedDate": selectedDate,
        "countryCode1": countryCode1,
        "countryName1": countryName1,
        "countryFlag1": countryFlag1,
        "currencyPrice1": currencyPrice1,
        "countryCode2": countryCode2,
        "countryName2": countryName2,
        "countryFlag2": countryFlag2,
        "currencyPrice2": currencyPrice2,
      };
}
