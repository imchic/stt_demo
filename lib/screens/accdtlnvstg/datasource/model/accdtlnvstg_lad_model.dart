import 'dart:convert';
/// bsnsNo : "2005"
/// bsnsZoneNo : 1
/// thingSerNo : "L-0000002005-0001-4715043021-1-0001-0000-000001"
/// accdtInvstgSqnc : 1
/// lcrtsDivCd : "1"
/// lcrtsDivCdNm : "일반"
/// lgdongCd : "4715043021"
/// mlnoLtno : "1"
/// slnoLtno : "0"
/// cmpnstnInvstgAra : 3845
/// sttusLndcgrDivCd : "01"
/// sttusLndcgrDivNm : "전"
/// acqsPrpDivNm : "공사용부지"
/// aceptncUseDivCd : "07"
/// aceptncUseDivNm : "취득"
/// lgdongNm : "경상북도 김천시 부항면 신옥리"
/// ofcbkLndcgrDivCd : "01"
/// ofcbkLndcgrDivNm : "전"
/// ofcbkAra : 3845
/// incrprAra : 3845
/// parentMlnoLtno : "0"
/// parentSlnoLtno : "0"
/// parentLcrtsDivCd : null
/// lotMergeDivsDivCd : null
/// invstgDt : "20050909"
/// frstRgstrId : "19871931"
/// frstRegistDt : "20051109"
/// lastUpdusrId : "LMIS"
/// lastUpdtDt : "20151001"
/// conectIp : "168"
/// ladAtchflId : null
/// buildCnt : 0
/// 
List accdtlnvstgLadDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = AccdtlnvstgLadModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

AccdtlnvstgLadModel AccdtlnvstgLadModelFromJson(String str) => AccdtlnvstgLadModel.fromJson(json.decode(str));
String AccdtlnvstgLadModelToJson(AccdtlnvstgLadModel data) => json.encode(data.toJson());
class AccdtlnvstgLadModel {
  AccdtlnvstgLadModel({
    this.bsnsNo,
    this.bsnsZoneNo,
    this.thingSerNo,
    this.accdtInvstgSqnc,
    this.lcrtsDivCd,
    this.lcrtsDivCdNm,
    this.lgdongCd,
    this.mlnoLtno,
    this.slnoLtno,
    this.cmpnstnInvstgAra,
    this.sttusLndcgrDivCd,
    this.sttusLndcgrDivNm,
    this.acqsPrpDivNm,
    this.aceptncUseDivCd,
    this.aceptncUseDivNm,
    this.lgdongNm,
    this.ofcbkLndcgrDivCd,
    this.ofcbkLndcgrDivNm,
    this.ofcbkAra,
    this.incrprAra,
    this.parentMlnoLtno,
    this.parentSlnoLtno,
    this.parentLcrtsDivCd,
    this.lotMergeDivsDivCd,
    this.invstgDt,
    this.cmpnstnStepDivNm,
    this.accdtInvstgRm,
    this.frstRgstrId,
    this.frstRegistDt,
    this.lastUpdusrId,
    this.lastUpdtDt,
    this.conectIp,
    this.ladAtchflId,
    this.buildCnt,});

  AccdtlnvstgLadModel.fromJson(dynamic json) {
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = num.parse(json['bsnsZoneNo'].toString());
    thingSerNo = json['thingSerNo'];
    accdtInvstgSqnc = num.parse(json['accdtInvstgSqnc'].toString());
    lcrtsDivCd = json['lcrtsDivCd'];
    lcrtsDivCdNm = json['lcrtsDivCdNm'];
    lgdongCd = json['lgdongCd'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    cmpnstnInvstgAra = json['cmpnstnInvstgAra'];
    sttusLndcgrDivCd = json['sttusLndcgrDivCd'];
    sttusLndcgrDivNm = json['sttusLndcgrDivNm'];
    acqsPrpDivNm = json['acqsPrpDivNm'];
    aceptncUseDivCd = json['aceptncUseDivCd'];
    aceptncUseDivNm = json['aceptncUseDivNm'];
    lgdongNm = json['lgdongNm'];
    ofcbkLndcgrDivCd = json['ofcbkLndcgrDivCd'];
    ofcbkLndcgrDivNm = json['ofcbkLndcgrDivNm'];
    ofcbkAra = json['ofcbkAra'];
    incrprAra = json['incrprAra'];
    parentMlnoLtno = json['parentMlnoLtno'];
    parentSlnoLtno = json['parentSlnoLtno'];
    parentLcrtsDivCd = json['parentLcrtsDivCd'];
    lotMergeDivsDivCd = json['lotMergeDivsDivCd'];
    invstgDt = json['invstgDt'];
    cmpnstnStepDivNm = json['cmpnstnStepDivNm'];
    accdtInvstgRm = json['accdtInvstgRm'] ?? '';
    frstRgstrId = json['frstRgstrId'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdusrId = json['lastUpdusrId'];
    lastUpdtDt = json['lastUpdtDt'];
    conectIp = json['conectIp'];
    ladAtchflId = json['ladAtchflId'];
    buildCnt = json['buildCnt'];
  }
  String? bsnsNo;
  num? bsnsZoneNo;
  String? thingSerNo;
  num? accdtInvstgSqnc;
  String? lcrtsDivCd;
  String? lcrtsDivCdNm;
  String? lgdongCd;
  String? mlnoLtno;
  String? slnoLtno;
  num? cmpnstnInvstgAra;
  String? sttusLndcgrDivCd;
  String? sttusLndcgrDivNm;
  String? acqsPrpDivNm;
  String? aceptncUseDivCd;
  String? aceptncUseDivNm;
  String? lgdongNm;
  String? ofcbkLndcgrDivCd;
  String? ofcbkLndcgrDivNm;
  num? ofcbkAra;
  num? incrprAra;
  String? parentMlnoLtno;
  String? parentSlnoLtno;
  dynamic parentLcrtsDivCd;
  dynamic lotMergeDivsDivCd;
  String? invstgDt;
  String? cmpnstnStepDivNm;
  String? accdtInvstgRm;
  String? frstRgstrId;
  String? frstRegistDt;
  String? lastUpdusrId;
  String? lastUpdtDt;
  String? conectIp;
  dynamic ladAtchflId;
  num? buildCnt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['thingSerNo'] = thingSerNo;
    map['accdtInvstgSqnc'] = accdtInvstgSqnc;
    map['lcrtsDivCd'] = lcrtsDivCd;
    map['lcrtsDivCdNm'] = lcrtsDivCdNm;
    map['lgdongCd'] = lgdongCd;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['cmpnstnInvstgAra'] = cmpnstnInvstgAra;
    map['sttusLndcgrDivCd'] = sttusLndcgrDivCd;
    map['sttusLndcgrDivNm'] = sttusLndcgrDivNm;
    map['acqsPrpDivNm'] = acqsPrpDivNm;
    map['aceptncUseDivCd'] = aceptncUseDivCd;
    map['aceptncUseDivNm'] = aceptncUseDivNm;
    map['lgdongNm'] = lgdongNm;
    map['ofcbkLndcgrDivCd'] = ofcbkLndcgrDivCd;
    map['ofcbkLndcgrDivNm'] = ofcbkLndcgrDivNm;
    map['ofcbkAra'] = ofcbkAra;
    map['incrprAra'] = incrprAra;
    map['parentMlnoLtno'] = parentMlnoLtno;
    map['parentSlnoLtno'] = parentSlnoLtno;
    map['parentLcrtsDivCd'] = parentLcrtsDivCd;
    map['lotMergeDivsDivCd'] = lotMergeDivsDivCd;
    map['invstgDt'] = invstgDt;
    map['cmpnstnStepDivNm'] = cmpnstnStepDivNm;
    map['accdtInvstgRm'] = accdtInvstgRm;
    map['frstRgstrId'] = frstRgstrId;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrId'] = lastUpdusrId;
    map['lastUpdtDt'] = lastUpdtDt;
    map['conectIp'] = conectIp;
    map['ladAtchflId'] = ladAtchflId;
    map['buildCnt'] = buildCnt;
    return map;
  }

}