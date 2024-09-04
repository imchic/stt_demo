import 'dart:convert';
/// bsnsNo : "1034"
/// bsnsZoneNo : 1
/// thingSerNo : "L-0000001034-0001-4150035030-1-0022-0001-000001"
/// ownerNo : "1000029592"
/// lgdongCd : "4150035030"
/// lgdongNm : "경기도 이천시 대월면 구시리"
/// lcrtsDivCd : "1"
/// lcrtsDivNm : "일반"
/// mlnoLtno : "22"
/// slnoLtno : "1"
/// acqsPrpDivCd : "S04"
/// ofcbkLndcgrDivCd : "02"
/// sttusLndcgrDivCd : "02"
/// acqsPrpDivNm : "송수관로"
/// ofcbkLndcgrDivNm : "답"
/// sttusLndcgrDivNm : "답"
/// ofcbkAra : 2992
/// incrprAra : 611.6
/// cmpnstnInvstgAra : 608
/// posesnShreNmrtrInfo : "1"
/// posesnShreDnmntrInfo : "1"
/// objcLdgmntDe : null
/// objcLdgmntAmt : null
/// obadUpc : null
/// objcRstAmt : null
/// objcIrsdAmt : null
/// objcAdjdcDt : null
/// objcLdgmntPrrgDe : null

List cstmrcardLadObjcDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = CstmrcardLadObjcDatasourceModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

CstmrcardLadObjcDatasourceModel cstmrcardLadObjcDatasourceModelFromJson(String str) => CstmrcardLadObjcDatasourceModel.fromJson(json.decode(str));
String cstmrcardLadObjcDatasourceModelToJson(CstmrcardLadObjcDatasourceModel data) => json.encode(data.toJson());
class CstmrcardLadObjcDatasourceModel {
  CstmrcardLadObjcDatasourceModel({
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
      this.objcLdgmntDe, 
      this.objcLdgmntAmt, 
      this.obadUpc, 
      this.objcRstAmt, 
      this.objcIrsdAmt, 
      this.objcAdjdcDt, 
      this.objcLdgmntPrrgDe,});

  CstmrcardLadObjcDatasourceModel.fromJson(dynamic json) {
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
    objcLdgmntDe = json['objcLdgmntDe'];
    objcLdgmntAmt = json['objcLdgmntAmt'];
    obadUpc = json['obadUpc'];
    objcRstAmt = json['objcRstAmt'];
    objcIrsdAmt = json['objcIrsdAmt'];
    objcAdjdcDt = json['objcAdjdcDt'];
    objcLdgmntPrrgDe = json['objcLdgmntPrrgDe'];
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
  dynamic objcLdgmntDe;
  dynamic objcLdgmntAmt;
  dynamic obadUpc;
  dynamic objcRstAmt;
  dynamic objcIrsdAmt;
  dynamic objcAdjdcDt;
  dynamic objcLdgmntPrrgDe;

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
    map['objcLdgmntDe'] = objcLdgmntDe;
    map['objcLdgmntAmt'] = objcLdgmntAmt;
    map['obadUpc'] = obadUpc;
    map['objcRstAmt'] = objcRstAmt;
    map['objcIrsdAmt'] = objcIrsdAmt;
    map['objcAdjdcDt'] = objcAdjdcDt;
    map['objcLdgmntPrrgDe'] = objcLdgmntPrrgDe;
    return map;
  }

}