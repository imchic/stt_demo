import 'dart:convert';
/// bsnsNo : "3015"
/// bsnsZoneNo : 1
/// thingSerNo : "L-0000003015-0001-4420025325-1-0415-0011-000001"
/// ownerNo : "1000083467"
/// lgdongCd : "4420025325"
/// lgdongNm : "충청남도 아산시 배방읍 북수리"
/// lcrtsDivCd : "1"
/// mlnoLtno : "415"
/// slnoLtno : "11"
/// acqsPrpDivCd : "S03"
/// ofcbkLndcgrDivCd : "02"
/// sttusLndcgrDivCd : "02"
/// ofcbkAra : 556
/// incrprAra : 556
/// cmpnstnInvstgAra : 556
/// posesnShreNmrtrInfo : "1"
/// posesnShreDnmntrInfo : "1"
/// partcpntSeq : 1
/// cmpnstnPartcpntRsn : "근저당권"
/// partcpntNm : "배방농협"
/// partcpntAddr : null
/// partcpntMbtlnum : null

CstmrcardLadPartcpntDatasourceModel cstmrcardLadPartcpntFromJson(String str) => CstmrcardLadPartcpntDatasourceModel.fromJson(json.decode(str));
String cstmrcardLadPartcpntToJson(CstmrcardLadPartcpntDatasourceModel data) => json.encode(data.toJson());
class CstmrcardLadPartcpntDatasourceModel {
  CstmrcardLadPartcpntDatasourceModel({
      this.bsnsNo,
      this.bsnsZoneNo,
      this.thingSerNo,
      this.ownerNo,
      this.lgdongCd,
      this.lgdongNm,
      this.lcrtsDivCd,
      this.mlnoLtno,
      this.slnoLtno,
      this.acqsPrpDivCd,
      this.ofcbkLndcgrDivCd,
      this.sttusLndcgrDivCd,
      this.ofcbkAra,
      this.incrprAra,
      this.cmpnstnInvstgAra,
      this.posesnShreNmrtrInfo,
      this.posesnShreDnmntrInfo,
      this.partcpntSeq,
      this.cmpnstnPartcpntRsn,
      this.partcpntNm,
      this.partcpntAddr,
      this.partcpntMbtlnum,});

  CstmrcardLadPartcpntDatasourceModel.fromJson(dynamic json) {
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    thingSerNo = json['thingSerNo'];
    ownerNo = json['ownerNo'];
    lgdongCd = json['lgdongCd'];
    lgdongNm = json['lgdongNm'];
    lcrtsDivCd = json['lcrtsDivCd'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    acqsPrpDivCd = json['acqsPrpDivCd'];
    ofcbkLndcgrDivCd = json['ofcbkLndcgrDivCd'];
    sttusLndcgrDivCd = json['sttusLndcgrDivCd'];
    ofcbkAra = json['ofcbkAra'];
    incrprAra = json['incrprAra'];
    cmpnstnInvstgAra = json['cmpnstnInvstgAra'];
    posesnShreNmrtrInfo = json['posesnShreNmrtrInfo'];
    posesnShreDnmntrInfo = json['posesnShreDnmntrInfo'];
    partcpntSeq = json['partcpntSeq'];
    cmpnstnPartcpntRsn = json['cmpnstnPartcpntRsn'];
    partcpntNm = json['partcpntNm'];
    partcpntAddr = json['partcpntAddr'];
    partcpntMbtlnum = json['partcpntMbtlnum'];
  }
  String? bsnsNo;
  num? bsnsZoneNo;
  String? thingSerNo;
  String? ownerNo;
  String? lgdongCd;
  String? lgdongNm;
  String? lcrtsDivCd;
  String? mlnoLtno;
  String? slnoLtno;
  String? acqsPrpDivCd;
  String? ofcbkLndcgrDivCd;
  String? sttusLndcgrDivCd;
  num? ofcbkAra;
  num? incrprAra;
  num? cmpnstnInvstgAra;
  String? posesnShreNmrtrInfo;
  String? posesnShreDnmntrInfo;
  num? partcpntSeq;
  String? cmpnstnPartcpntRsn;
  String? partcpntNm;
  dynamic partcpntAddr;
  dynamic partcpntMbtlnum;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['thingSerNo'] = thingSerNo;
    map['ownerNo'] = ownerNo;
    map['lgdongCd'] = lgdongCd;
    map['lgdongNm'] = lgdongNm;
    map['lcrtsDivCd'] = lcrtsDivCd;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['acqsPrpDivCd'] = acqsPrpDivCd;
    map['ofcbkLndcgrDivCd'] = ofcbkLndcgrDivCd;
    map['sttusLndcgrDivCd'] = sttusLndcgrDivCd;
    map['ofcbkAra'] = ofcbkAra;
    map['incrprAra'] = incrprAra;
    map['cmpnstnInvstgAra'] = cmpnstnInvstgAra;
    map['posesnShreNmrtrInfo'] = posesnShreNmrtrInfo;
    map['posesnShreDnmntrInfo'] = posesnShreDnmntrInfo;
    map['partcpntSeq'] = partcpntSeq;
    map['cmpnstnPartcpntRsn'] = cmpnstnPartcpntRsn;
    map['partcpntNm'] = partcpntNm;
    map['partcpntAddr'] = partcpntAddr;
    map['partcpntMbtlnum'] = partcpntMbtlnum;
    return map;
  }

}