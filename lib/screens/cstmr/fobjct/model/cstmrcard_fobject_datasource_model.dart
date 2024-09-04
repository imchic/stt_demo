import 'dart:convert';
/// issNo : "1"
/// isuDt : 1424790000000
/// bondIsuDe : null
/// prchasCnfrmnIsuDivCd : "01"
/// prchasCnfrmnIsuDivNm : "취득세면제용"
/// pymntSumAmt : null
/// prchasCnfrmnIssAmt : null
/// delamt : 0
/// janamt : 0


List cstmrcardFobjctDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = CstmrcardFobjectDatasourceModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

CstmrcardFobjectDatasourceModel CstmrcardFobjectDatasourceModelFromJson(String str) => CstmrcardFobjectDatasourceModel.fromJson(json.decode(str));
String CstmrcardFobjectDatasourceModelToJson(CstmrcardFobjectDatasourceModel data) => json.encode(data.toJson());
class CstmrcardFobjectDatasourceModel {
  CstmrcardFobjectDatasourceModel({
      this.bsnsNo,
      this.bsnsZoneNo,
      this.rceptNo,
      this.rqstDe,
      this.actnDtls,
      this.applcntNm,
      this.applcntRrnEnc,
      this.applcntTelno,
      this.applcntAddr,
      this.objcRqstDtls,
      this.actnDt,
      this.objcApplcntDivCd,
      this.objcApplcntDivNm,
      this.drftNo,
      this.sanctnStatCd,
      this.frstRgstrId,
      this.frstRegistDt,
      this.lastUpdusrId,
      this.lastUpdtDt,
      this.conectIp,
      this.fobjctPrgstsDivCd,
      this.fobjctPrgstsDivNm,
      this.frstRgstrNm,
      this.lastUpdusrNm,
      this.fobjctApplcntRelInfo,
      this.rqstPrcsStatCd,
      this.tmprWritngDt,
  });

  CstmrcardFobjectDatasourceModel.fromJson(dynamic json) {
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    rceptNo = json['rceptNo'];
    rqstDe = json['rqstDe'];
    actnDtls = json['actnDtls'];
    applcntNm = json['applcntNm'];
    applcntRrnEnc = json['applcntRrnEnc'];
    applcntTelno = json['applcntTelno'];
    applcntAddr = json['applcntAddr'];
    objcRqstDtls = json['objcRqstDtls'];
    actnDt = json['actnDt'];
    objcApplcntDivCd = json['objcApplcntDivCd'];
    objcApplcntDivNm = json['objcApplcntDivNm'];
    drftNo = json['drftNo'];
    sanctnStatCd = json['sanctnStatCd'];
    frstRgstrId = json['frstRgstrId'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdusrId = json['lastUpdusrId'];
    lastUpdtDt = json['lastUpdtDt'];
    conectIp = json['conectIp'];
    fobjctPrgstsDivCd = json['fobjctPrgstsDivCd'];
    fobjctPrgstsDivNm = json['fobjctPrgstsDivNm'];
    frstRgstrNm = json['frstRgstrNm'];
    lastUpdusrNm = json['lastUpdusrNm'];
    fobjctApplcntRelInfo = json['fobjctApplcntRelInfo'];
    rqstPrcsStatCd = json['rqstPrcsStatCd'];
    tmprWritngDt = json['tmprWritngDt'];
  }

  String? bsnsNo;
  num? bsnsZoneNo;
  String? rceptNo;
  num? rqstDe;
  String? actnDtls;
  String? applcntNm;
  String? applcntRrnEnc;
  String? applcntTelno;
  String? applcntAddr;
  String? objcRqstDtls;
  num? actnDt;
  String? objcApplcntDivCd;
  String? objcApplcntDivNm;
  String? drftNo;
  String? sanctnStatCd;
  String? frstRgstrId;
  num? frstRegistDt;
  String? lastUpdusrId;
  num? lastUpdtDt;
  String? conectIp;
  String? fobjctPrgstsDivCd;
  String? fobjctPrgstsDivNm;
  String? frstRgstrNm;
  String? lastUpdusrNm;
  String? fobjctApplcntRelInfo;
  String? rqstPrcsStatCd;
  num? tmprWritngDt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['rceptNo'] = rceptNo;
    map['rqstDe'] = rqstDe;
    map['actnDtls'] = actnDtls;
    map['applcntNm'] = applcntNm;
    map['applcntRrnEnc'] = applcntRrnEnc;
    map['applcntTelno'] = applcntTelno;
    map['applcntAddr'] = applcntAddr;
    map['objcRqstDtls'] = objcRqstDtls;
    map['actnDt'] = actnDt;
    map['objcApplcntDivCd'] = objcApplcntDivCd;
    map['objcApplcntDivNm'] = objcApplcntDivNm;
    map['drftNo'] = drftNo;
    map['sanctnStatCd'] = sanctnStatCd;
    map['frstRgstrId'] = frstRgstrId;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrId'] = lastUpdusrId;
    map['lastUpdtDt'] = lastUpdtDt;
    map['conectIp'] = conectIp;
    map['fobjctPrgstsDivCd'] = fobjctPrgstsDivCd;
    map['fobjctPrgstsDivNm'] = fobjctPrgstsDivNm;
    map['frstRgstrNm'] = frstRgstrNm;
    map['lastUpdusrNm'] = lastUpdusrNm;
    map['fobjctApplcntRelInfo'] = fobjctApplcntRelInfo;
    map['rqstPrcsStatCd'] = rqstPrcsStatCd;
    map['tmprWritngDt'] = tmprWritngDt;
    return map;
  }

}