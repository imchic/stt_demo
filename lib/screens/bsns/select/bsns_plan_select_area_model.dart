import 'dart:convert';

BsnsPlanSelectAreaModel bsnsPlanSelectAreaModelFromJson(String str) => BsnsPlanSelectAreaModel.fromJson(json.decode(str));
String bsnsPlanSelectAreaModelToJson(BsnsPlanSelectAreaModel data) => json.encode(data.toJson());

class BsnsPlanSelectAreaModel {
  BsnsPlanSelectAreaModel({
      this.bsnsNo, 
      this.bsnsZoneNm, 
      this.bsnsZoneNo, 
      this.lotCnt, 
      this.bsnsAra, 
      this.bsnsReadngPblancDe,});

  BsnsPlanSelectAreaModel.fromJson(dynamic json) {
    bsnsNo = json['bsnsNo'];
    bsnsZoneNm = json['bsnsZoneNm'];
    bsnsZoneNo = json['bsnsZoneNo'];
    lotCnt = json['lotCnt'];
    bsnsAra = json['bsnsAra'];
    bsnsReadngPblancDe = json['bsnsReadngPblancDe'];
  }
  num? bsnsNo;
  String? bsnsZoneNm;
  num? bsnsZoneNo;
  num? lotCnt;
  String? bsnsAra;
  dynamic bsnsReadngPblancDe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNm'] = bsnsZoneNm;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['lotCnt'] = lotCnt;
    map['bsnsAra'] = bsnsAra;
    map['bsnsReadngPblancDe'] = bsnsReadngPblancDe;
    return map;
  }

}