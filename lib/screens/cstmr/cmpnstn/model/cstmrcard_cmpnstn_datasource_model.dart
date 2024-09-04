import 'dart:convert';

List cstmrcardCmpnstnDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = CstmrcardCmpnstnDatasourceModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

CstmrcardCmpnstnDatasourceModel cstmrcardCmpnstnFromJson(String str) => CstmrcardCmpnstnDatasourceModel.fromJson(json.decode(str));
String cstmrcardCmpnstnTojson(CstmrcardCmpnstnDatasourceModel data) => json.encode(data.toJson());
class CstmrcardCmpnstnDatasourceModel {
  CstmrcardCmpnstnDatasourceModel({
      this.bsnsNo,
      this.bsnsZoneNo,
      this.cmpnstnDscssSqnc,
      this.ownerNo,
      this.cmpnstnDscssDtls,
      this.sbmtDe,
      this.sanctnTit,
      this.dscssMthDc,
      this.cmpnstnDscssPdInfo,
      this.cmpnstnDscssPlaceDtls,
      this.cmpnstnEraMthPrcdrCtnt,
  });

  CstmrcardCmpnstnDatasourceModel.fromJson(dynamic json) {
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    cmpnstnDscssSqnc = json['cmpnstnDscssSqnc'];
    ownerNo = json['ownerNo'];
    cmpnstnDscssDtls = json['cmpnstnDscssDtls'];
    sbmtDe = json['sbmtDe'];
    sanctnTit = json['sanctnTit'];
    dscssMthDc = json['dscssMthDc'];
    cmpnstnDscssPdInfo = json['cmpnstnDscssPdInfo'];
    cmpnstnDscssPlaceDtls = json['cmpnstnDscssPlaceDtls'];
    cmpnstnEraMthPrcdrCtnt = json['cmpnstnEraMthPrcdrCtnt'];
  }

  String? bsnsNo;
  num? bsnsZoneNo;
  String? cmpnstnDscssSqnc;
  String? ownerNo;
  String? cmpnstnDscssDtls;
  String? sbmtDe;
  String? sanctnTit;
  String? dscssMthDc;
  String? cmpnstnDscssPdInfo;
  String? cmpnstnDscssPlaceDtls;
  String? cmpnstnEraMthPrcdrCtnt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['cmpnstnDscssSqnc'] = cmpnstnDscssSqnc;
    map['ownerNo'] = ownerNo;
    map['cmpnstnDscssDtls'] = cmpnstnDscssDtls;
    map['sbmtDe'] = sbmtDe;
    map['sanctnTit'] = sanctnTit;
    map['dscssMthDc'] = dscssMthDc;
    map['cmpnstnDscssPdInfo'] = cmpnstnDscssPdInfo;
    map['cmpnstnDscssPlaceDtls'] = cmpnstnDscssPlaceDtls;
    map['cmpnstnEraMthPrcdrCtnt'] = cmpnstnEraMthPrcdrCtnt;
    return map;
  }

}