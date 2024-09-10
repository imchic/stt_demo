import 'dart:convert';
/// bsnsNo : "2101"
/// bsnsZoneNo : 2
/// accdtInvstgSqnc : 1
/// accdtInvstgNm : "군위댐 직하류 하천정비공사 실태조사"
/// delYn : "N"
/// frstRgstrId : "30011533"
/// frstRegistDt : 1501772771000
/// lastUpdusrId : "30011533"
/// lastUpdtDt : 1501772771000
/// conectIp : "172.20.85.20"

List bsnsAccdtinvstgSqncModelFromJson(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = BsnsAccdtinvstgSqncModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}
String bsnsAccdtinvstgSqncModelToJson(BsnsAccdtinvstgSqncModel data) => json.encode(data.toJson());
class BsnsAccdtinvstgSqncModel {
  BsnsAccdtinvstgSqncModel({
      this.bsnsNo, 
      this.bsnsZoneNo, 
      this.accdtInvstgSqnc, 
      this.accdtInvstgNm, 
      this.delYn, 
      this.frstRgstrId, 
      this.frstRegistDt, 
      this.lastUpdusrId, 
      this.lastUpdtDt, 
      this.conectIp,});

  BsnsAccdtinvstgSqncModel.fromJson(dynamic json) {
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    accdtInvstgSqnc = json['accdtInvstgSqnc'];
    accdtInvstgNm = json['accdtInvstgNm'];
    delYn = json['delYn'];
    frstRgstrId = json['frstRgstrId'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdusrId = json['lastUpdusrId'];
    lastUpdtDt = json['lastUpdtDt'];
    conectIp = json['conectIp'];
  }
  String? bsnsNo;
  num? bsnsZoneNo;
  num? accdtInvstgSqnc;
  String? accdtInvstgNm;
  String? delYn;
  String? frstRgstrId;
  String? frstRegistDt;
  String? lastUpdusrId;
  String? lastUpdtDt;
  String? conectIp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['accdtInvstgSqnc'] = accdtInvstgSqnc;
    map['accdtInvstgNm'] = accdtInvstgNm;
    map['delYn'] = delYn;
    map['frstRgstrId'] = frstRgstrId;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrId'] = lastUpdusrId;
    map['lastUpdtDt'] = lastUpdtDt;
    map['conectIp'] = conectIp;
    return map;
  }

}