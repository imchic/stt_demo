import 'dart:convert';
/// bsnsNo : "4701"
/// bsnsZoneNo : 1
/// thingSerNo : "L-0000004701-0001-4792034025-1-0168-0002-000002"
/// ownerNo : "1000070526"
/// lgdongCd : "4792034025"
/// lgdongNm : "경상북도 봉화군 춘양면 애당리"
/// lcrtsDivCd : "1"
/// lcrtsDivNm : "일반"
/// mlnoLtno : "168"
/// slnoLtno : "2"
/// acqsPrpDivCd : "D06"
/// acqsPrpDivNm : "이설도로"
/// ofcbkLndcgrDivCd : "11"
/// ofcbkLndcgrDivNm : "도로"
/// sttusLndcgrDivCd : "11"
/// sttusLndcgrDivNm : "도로"
/// ofcbkAra : 443
/// incrprAra : 443
/// cmpnstnInvstgAra : 443
/// posesnShreNmrtrInfo : "1"
/// posesnShreDnmntrInfo : "1"
/// aceptncUseBeginDe : null
/// aceptncAdjdcDt : null
/// aceptncAdjdcUpc : null
/// aceptncAdjdcAmt : null
/// adjdcRqstSqnc : null
/// cpsmnPymntStepDivCd : null

List cstmrcardLadAceptncDatasourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = CstmrcardLadAceptncDatasourceModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

CstmrcardLadAceptncDatasourceModel cstmrcardLadAceptncDatasourceModelFromJson(String str) => CstmrcardLadAceptncDatasourceModel.fromJson(json.decode(str));
String cstmrcardLadAceptncDatasourceModelToJson(CstmrcardLadAceptncDatasourceModel data) => json.encode(data.toJson());
class CstmrcardLadAceptncDatasourceModel {
  CstmrcardLadAceptncDatasourceModel({
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
      this.acqsPrpDivNm, 
      this.ofcbkLndcgrDivCd, 
      this.ofcbkLndcgrDivNm, 
      this.sttusLndcgrDivCd, 
      this.sttusLndcgrDivNm, 
      this.ofcbkAra, 
      this.incrprAra, 
      this.cmpnstnInvstgAra, 
      this.posesnShreNmrtrInfo, 
      this.posesnShreDnmntrInfo, 
      this.aceptncUseBeginDe, 
      this.aceptncAdjdcDt, 
      this.aceptncAdjdcUpc, 
      this.aceptncAdjdcAmt, 
      this.adjdcRqstSqnc, 
      this.cpsmnPymntStepDivCd,});

  CstmrcardLadAceptncDatasourceModel.fromJson(dynamic json) {
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
    acqsPrpDivNm = json['acqsPrpDivNm'];
    ofcbkLndcgrDivCd = json['ofcbkLndcgrDivCd'];
    ofcbkLndcgrDivNm = json['ofcbkLndcgrDivNm'];
    sttusLndcgrDivCd = json['sttusLndcgrDivCd'];
    sttusLndcgrDivNm = json['sttusLndcgrDivNm'];
    ofcbkAra = json['ofcbkAra'];
    incrprAra = json['incrprAra'];
    cmpnstnInvstgAra = json['cmpnstnInvstgAra'];
    posesnShreNmrtrInfo = json['posesnShreNmrtrInfo'];
    posesnShreDnmntrInfo = json['posesnShreDnmntrInfo'];
    aceptncUseBeginDe = json['aceptncUseBeginDe'];
    aceptncAdjdcDt = json['aceptncAdjdcDt'];
    aceptncAdjdcUpc = json['aceptncAdjdcUpc'];
    aceptncAdjdcAmt = json['aceptncAdjdcAmt'];
    adjdcRqstSqnc = json['adjdcRqstSqnc'];
    cpsmnPymntStepDivCd = json['cpsmnPymntStepDivCd'];
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
  String? acqsPrpDivNm;
  String? ofcbkLndcgrDivCd;
  String? ofcbkLndcgrDivNm;
  String? sttusLndcgrDivCd;
  String? sttusLndcgrDivNm;
  num? ofcbkAra;
  num? incrprAra;
  num? cmpnstnInvstgAra;
  String? posesnShreNmrtrInfo;
  String? posesnShreDnmntrInfo;
  dynamic aceptncUseBeginDe;
  dynamic aceptncAdjdcDt;
  dynamic aceptncAdjdcUpc;
  dynamic aceptncAdjdcAmt;
  dynamic adjdcRqstSqnc;
  dynamic cpsmnPymntStepDivCd;

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
    map['acqsPrpDivNm'] = acqsPrpDivNm;
    map['ofcbkLndcgrDivCd'] = ofcbkLndcgrDivCd;
    map['ofcbkLndcgrDivNm'] = ofcbkLndcgrDivNm;
    map['sttusLndcgrDivCd'] = sttusLndcgrDivCd;
    map['sttusLndcgrDivNm'] = sttusLndcgrDivNm;
    map['ofcbkAra'] = ofcbkAra;
    map['incrprAra'] = incrprAra;
    map['cmpnstnInvstgAra'] = cmpnstnInvstgAra;
    map['posesnShreNmrtrInfo'] = posesnShreNmrtrInfo;
    map['posesnShreDnmntrInfo'] = posesnShreDnmntrInfo;
    map['aceptncUseBeginDe'] = aceptncUseBeginDe;
    map['aceptncAdjdcDt'] = aceptncAdjdcDt;
    map['aceptncAdjdcUpc'] = aceptncAdjdcUpc;
    map['aceptncAdjdcAmt'] = aceptncAdjdcAmt;
    map['adjdcRqstSqnc'] = adjdcRqstSqnc;
    map['cpsmnPymntStepDivCd'] = cpsmnPymntStepDivCd;
    return map;
  }

}