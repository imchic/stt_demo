import 'dart:convert';
/// plotUseNo : "201600164"
/// sanctnDocNo : "16103.468506900"
/// sanctnDocNm : "김포가압장내 국유재산 사용수익허가 신청"
/// delYn : "N"
/// frstRgstrId : "20130984"
/// frstRegistDt : 1460602131000
/// lastUpdusrId : "LMIS"
/// lastUpdtDt : 1460602131000
/// conectIp : "172.20.22.43"
List usePrmisnCanclAprvDocDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = UsePrmisnCanclAprvDocModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

UsePrmisnCanclAprvDocModel usePrmisnCanclAprvDocModelFromJson(String str) => UsePrmisnCanclAprvDocModel.fromJson(json.decode(str));
String usePrmisnCanclAprvDocModelToJson(UsePrmisnCanclAprvDocModel data) => json.encode(data.toJson());
class UsePrmisnCanclAprvDocModel {
  UsePrmisnCanclAprvDocModel({
      this.plotUseNo, 
      this.sanctnDocNo, 
      this.sanctnDocNm, 
      this.delYn, 
      this.frstRgstrId, 
      this.frstRegistDt, 
      this.lastUpdusrId, 
      this.lastUpdtDt, 
      this.conectIp,});

  UsePrmisnCanclAprvDocModel.fromJson(dynamic json) {
    plotUseNo = json['plotUseNo'];
    sanctnDocNo = json['sanctnDocNo'];
    sanctnDocNm = json['sanctnDocNm'];
    delYn = json['delYn'];
    frstRgstrId = json['frstRgstrId'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdusrId = json['lastUpdusrId'];
    lastUpdtDt = json['lastUpdtDt'];
    conectIp = json['conectIp'];
  }
  String? plotUseNo;
  String? sanctnDocNo;
  String? sanctnDocNm;
  String? delYn;
  String? frstRgstrId;
  num? frstRegistDt;
  String? lastUpdusrId;
  num? lastUpdtDt;
  String? conectIp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['plotUseNo'] = plotUseNo;
    map['sanctnDocNo'] = sanctnDocNo;
    map['sanctnDocNm'] = sanctnDocNm;
    map['delYn'] = delYn;
    map['frstRgstrId'] = frstRgstrId;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrId'] = lastUpdusrId;
    map['lastUpdtDt'] = lastUpdtDt;
    map['conectIp'] = conectIp;
    return map;
  }

}