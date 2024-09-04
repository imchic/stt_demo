import 'dart:convert';

List cstmrcardReprchsDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = CstmrcardReprchsDatasourceModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

CstmrcardReprchsDatasourceModel CstmrcardReprchsDatasourceModelFromJson(String str) => CstmrcardReprchsDatasourceModel.fromJson(json.decode(str));
String CstmrcardReprchsDatasourceModelToJson(CstmrcardReprchsDatasourceModel data) => json.encode(data.toJson());
class CstmrcardReprchsDatasourceModel {
  CstmrcardReprchsDatasourceModel({
    this.bsnsNo,
    this.bsnsZoneNo,
    this.thingSerNo,
    this.ownerNo,
    this.lgdongCd,
    this.lgdongNm,
    this.lcrtsDivCd,
    this.lcrtsDivNm,
    this.mlnoLtno,
    this.slnoLtno,
    this.acqsPrpDivCd,
    this.ofcbkLndcgrDivCd,
    this.sttusLndcgrDivCd,
    this.acqsPrpDivNm,
    this.ofcbkLndcgrDivNm,
    this.sttusLndcgrDivNm,
    this.ofcbkAra,
    this.incrprAra,
    this.cmpnstnInvstgAra,
    this.posesnShreNmrtrInfo,
    this.posesnShreDnmntrInfo,
    this.cpsmn,
    this.ownerNm,
    this.reprchsNotieRecptDe,
    this.reprchsOpinionAnswerDe,
    this.apasmtReqestDt,
    this.apasmtSqnc,
    this.prcPnttmDe,
    this.apasmtInsttEvlUpc1,
    this.apasmtInsttEvamt1,
    this.apasmtInsttEvlUpc2,
    this.apasmtInsttEvamt2,
    this.reprchsCmptnUpc,
    this.reprchsCmptnAmt,
    this.sanctnDe,
    this.reprchsRctcDivCd,
    this.rctcAmt,
    this.rctcDe,
   });

  CstmrcardReprchsDatasourceModel.fromJson(dynamic json) {
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    thingSerNo = json['thingSerNo'];
    ownerNo = json['ownerNo'];
    lgdongCd = json['lgdongCd'];
    lgdongNm = json['lgdongNm'];
    lcrtsDivCd = json['lcrtsDivCd'];
    lcrtsDivNm = json['lcrtsDivNm'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    acqsPrpDivCd = json['acqsPrpDivCd'];
    ofcbkLndcgrDivCd = json['ofcbkLndcgrDivCd'];
    sttusLndcgrDivCd = json['sttusLndcgrDivCd'];
    acqsPrpDivNm = json['acqsPrpDivNm'];
    ofcbkLndcgrDivNm = json['ofcbkLndcgrDivNm'];
    sttusLndcgrDivNm = json['sttusLndcgrDivNm'];
    ofcbkAra = json['ofcbkAra'];
    incrprAra = json['incrprAra'];
    cmpnstnInvstgAra = json['cmpnstnInvstgAra'];
    posesnShreNmrtrInfo = json['posesnShreNmrtrInfo'];
    posesnShreDnmntrInfo = json['posesnShreDnmntrInfo'];
    cpsmn = json['cpsmn'];
    ownerNm = json['ownerNm'];
    reprchsNotieRecptDe = json['reprchsNotieRecptDe'];
    reprchsOpinionAnswerDe = json['reprchsOpinionAnswerDe'];
    apasmtReqestDt = json['apasmtReqestDt'];
    apasmtSqnc = json['apasmtSqnc'];
    prcPnttmDe = json['prcPnttmDe'];
    apasmtInsttEvlUpc1 = json['apasmtInsttEvlUpc1'];
    apasmtInsttEvamt1 = json['apasmtInsttEvamt1'];
    apasmtInsttEvlUpc2 = json['apasmtInsttEvlUpc2'];
    apasmtInsttEvamt2 = json['apasmtInsttEvamt2'];
    reprchsCmptnUpc = json['reprchsCmptnUpc'];
    reprchsCmptnAmt = json['reprchsCmptnAmt'];
    sanctnDe = json['sanctnDe'];
    reprchsRctcDivCd = json['reprchsRctcDivCd'];
    rctcAmt = json['rctcAmt'];
    rctcDe = json['rctcDe'];
  }
  String? bsnsNo;
  num? bsnsZoneNo;
  String? thingSerNo;
  String? ownerNo;
  String? lgdongCd;
  String? lgdongNm;
  String? lcrtsDivCd;
  String? lcrtsDivNm;
  String? mlnoLtno;
  String? slnoLtno;
  String? acqsPrpDivCd;
  String? ofcbkLndcgrDivCd;
  String? sttusLndcgrDivCd;
  String? acqsPrpDivNm;
  String? ofcbkLndcgrDivNm;
  String? sttusLndcgrDivNm;
  num? ofcbkAra;
  num? incrprAra;
  num? cmpnstnInvstgAra;
  String? posesnShreNmrtrInfo;
  String? posesnShreDnmntrInfo;
  String? cpsmn;
  String? ownerNm;
  String? reprchsNotieRecptDe;
  String? reprchsOpinionAnswerDe;
  String? apasmtReqestDt;
  String? apasmtSqnc;
  String? prcPnttmDe;
  num? apasmtInsttEvlUpc1;
  num? apasmtInsttEvamt1;
  num? apasmtInsttEvlUpc2;
  num? apasmtInsttEvamt2;
  num? reprchsCmptnUpc;
  num? reprchsCmptnAmt;
  String? sanctnDe;
  String? reprchsRctcDivCd;
  num? rctcAmt;
  String? rctcDe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['thingSerNo'] = thingSerNo;
    map['ownerNo'] = ownerNo;
    map['lgdongCd'] = lgdongCd;
    map['lgdongNm'] = lgdongNm;
    map['lcrtsDivCd'] = lcrtsDivCd;
    map['lcrtsDivNm'] = lcrtsDivNm;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['acqsPrpDivCd'] = acqsPrpDivCd;
    map['ofcbkLndcgrDivCd'] = ofcbkLndcgrDivCd;
    map['sttusLndcgrDivCd'] = sttusLndcgrDivCd;
    map['acqsPrpDivNm'] = acqsPrpDivNm;
    map['ofcbkLndcgrDivNm'] = ofcbkLndcgrDivNm;
    map['sttusLndcgrDivNm'] = sttusLndcgrDivNm;
    map['ofcbkAra'] = ofcbkAra;
    map['incrprAra'] = incrprAra;
    map['cmpnstnInvstgAra'] = cmpnstnInvstgAra;
    map['posesnShreNmrtrInfo'] = posesnShreNmrtrInfo;
    map['posesnShreDnmntrInfo'] = posesnShreDnmntrInfo;
    map['cpsmn'] = cpsmn;
    map['ownerNm'] = ownerNm;
    map['reprchsNotieRecptDe'] = reprchsNotieRecptDe;
    map['reprchsOpinionAnswerDe'] = reprchsOpinionAnswerDe;
    map['apasmtReqestDt'] = apasmtReqestDt;
    map['apasmtSqnc'] = apasmtSqnc;
    map['prcPnttmDe'] = prcPnttmDe;
    map['apasmtInsttEvlUpc1'] = apasmtInsttEvlUpc1;
    map['apasmtInsttEvamt1'] = apasmtInsttEvamt1;
    map['apasmtInsttEvlUpc2'] = apasmtInsttEvlUpc2;
    map['apasmtInsttEvamt2'] = apasmtInsttEvamt2;
    map['reprchsCmptnUpc'] = reprchsCmptnUpc;
    map['reprchsCmptnAmt'] = reprchsCmptnAmt;
    map['sanctnDe'] = sanctnDe;
    map['reprchsRctcDivCd'] = reprchsRctcDivCd;
    map['rctcAmt'] = rctcAmt;
    map['rctcDe'] = rctcDe;
    return map;
  }

}