import 'dart:convert';

String bsnsPlanSelectAreaModelToJson(BsnsPlanSelectAreaModel data) => json.encode(data.toJson());
List bsnsPlanSelectAreaModelFromJson(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = BsnsPlanSelectAreaModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

class BsnsPlanSelectAreaModel {
  BsnsPlanSelectAreaModel({
      this.bsnsNo, 
      this.bsnsZoneNm, 
      this.bsnsZoneNo, 
      this.lotCnt, 
      this.bsnsAra, 
      this.bsnsReadngPblancDe,});

  BsnsPlanSelectAreaModel.fromJson(dynamic json) {
    bsnsNo = num.parse(json['bsnsNo'].toString());
    bsnsZoneNm = json['bsnsZoneNm'] ?? '';
    bsnsZoneNo = json['bsnsZoneNo'] ?? 0;
    lotCnt = num.parse(json['lotCnt'].toString()).toString();
    bsnsAra = num.parse(json['bsnsAra'].toString()).toString();
    bsnsReadngPblancDe = json['bsnsReadngPblancDe'] ?? '';
  }
  num? bsnsNo;
  String? bsnsZoneNm;
  num? bsnsZoneNo;
  String? lotCnt;
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