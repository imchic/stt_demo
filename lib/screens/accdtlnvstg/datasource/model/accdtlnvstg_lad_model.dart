/// [AccdtlnvstgLadModel] 실태조사서 > 토지내역

class AccdtlnvstgLadModel {

  // 조사일자
  String? surveyDate;
  // 조사차수
  String? surveyOrder;
  // 소재지
  String? location;
  // 본번
  String? mainNumber;
  // 부번
  String? subNumber;
  // 공부지목
  String? publicLandType;

  AccdtlnvstgLadModel({
    this.surveyDate,
    this.surveyOrder,
    this.location,
    this.mainNumber,
    this.subNumber,
    this.publicLandType,
  });

  factory AccdtlnvstgLadModel.fromJson(Map<String, dynamic> json) {
    return AccdtlnvstgLadModel(
      surveyDate: json['surveyDate'],
      surveyOrder: json['surveyOrder'],
      location: json['location'],
      mainNumber: json['mainNumber'],
      subNumber: json['subNumber'],
      publicLandType: json['publicLandType'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['surveyDate'] = this.surveyDate;
    data['surveyOrder'] = this.surveyOrder;
    data['location'] = this.location;
    data['mainNumber'] = this.mainNumber;
    data['subNumber'] = this.subNumber;
    data['publicLandType'] = this.publicLandType;
    return data;
  }

  @override
  String toString() {
    return toJson().toString().replaceAll(",", ",\n");
  }


}