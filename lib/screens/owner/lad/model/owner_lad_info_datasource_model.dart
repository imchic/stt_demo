/// TM_LP20210 (LP_실태조사토지정보)

import 'dart:convert';
/// bsnsNo : "4301"
/// bsnsZoneNo : 1
/// thingSerNo : "L-0000004301-0001-4313012100-2-0012-0005-000001"
/// accdtInvstgRstSqnc : 1
/// accdtInvstgSqnc : 1
/// lcrtsDivCd : "2"
/// lgdongCd : "4313012100"
/// mlnoLtno : "12"
/// slnoLtno : "5"
/// sttusLndcgrDivCd : "30"
/// acqsPrpDivCd : "D18"
/// aceptncUseDivCd : null
/// lgdongNm : "충청북도 충주시 종민동"
/// ofcbkLndcgrDivCd : "30"
/// ofcbkAra : 18516
/// incrprAra : 16359
/// cmpnstnInvstgAra : 16359
/// oflndvalAmt : 0
/// oflndvalStdrMt : null
/// rprsLtnoYn : "Y"
/// apasmtReqestYn : "Y"
/// invstgDt : "20150311"
/// cmpnstnDtaChnStatDivCd : null
/// cmpnstnDtaCreatId : "실태IMPORT"
/// cmpnstnDtaCreatGrpId : null
/// chnCtnt : null
/// parentMlnoLtno : "0"
/// parentSlnoLtno : "0"
/// parentLcrtsDivCd : null
/// lotMergeDivsDivCd : null
/// accdtInvstgRm : null
/// frstRgstrId : "20150132"
/// frstRegistDt : "20150326"
/// lastUpdusrId : "LMIS"
/// lastUpdtDt : "20151001"
/// cmpnstnStepDivCd : "29"
/// cmpnstnStepDivCdNm : "x"

OwnerLadInfoDatasourceModel ownerLadInfoFromJson(String str) => OwnerLadInfoDatasourceModel.fromJson(json.decode(str));
String ownerLadInfoToJson(OwnerLadInfoDatasourceModel data) => json.encode(data.toJson());
class OwnerLadInfoDatasourceModel {
  OwnerLadInfoDatasourceModel({
    this.bsnsNo,
    this.bsnsZoneNo,
    this.thingSerNo,
    this.accdtInvstgRstSqnc,
    this.accdtInvstgSqnc,
    this.lcrtsDivCd,
    this.lgdongCd,
    this.mlnoLtno,
    this.slnoLtno,
    this.sttusLndcgrDivCd,
    this.acqsPrpDivCd,
    this.aceptncUseDivCd,
    this.lgdongNm,
    this.ofcbkLndcgrDivCd,
    this.ofcbkAra,
    this.incrprAra,
    this.cmpnstnInvstgAra,
    this.oflndvalAmt,
    this.oflndvalStdrMt,
    this.rprsLtnoYn,
    this.apasmtReqestYn,
    this.invstgDt,
    this.cmpnstnDtaChnStatDivCd,
    this.cmpnstnDtaCreatId,
    this.cmpnstnDtaCreatGrpId,
    this.chnCtnt,
    this.parentMlnoLtno,
    this.parentSlnoLtno,
    this.parentLcrtsDivCd,
    this.lotMergeDivsDivCd,
    this.accdtInvstgRm,
    this.frstRgstrId,
    this.frstRegistDt,
    this.lastUpdusrId,
    this.lastUpdtDt,
    this.cmpnstnStepDivCd,
    this.cmpnstnStepDivCdNm,});

  OwnerLadInfoDatasourceModel.fromJson(dynamic json) {
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    thingSerNo = json['thingSerNo'];
    accdtInvstgRstSqnc = json['accdtInvstgRstSqnc'];
    accdtInvstgSqnc = json['accdtInvstgSqnc'];
    lcrtsDivCd = json['lcrtsDivCd'];
    lgdongCd = json['lgdongCd'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    sttusLndcgrDivCd = json['sttusLndcgrDivCd'];
    acqsPrpDivCd = json['acqsPrpDivCd'];
    aceptncUseDivCd = json['aceptncUseDivCd'];
    lgdongNm = json['lgdongNm'];
    ofcbkLndcgrDivCd = json['ofcbkLndcgrDivCd'];
    ofcbkAra = json['ofcbkAra'];
    incrprAra = json['incrprAra'];
    cmpnstnInvstgAra = json['cmpnstnInvstgAra'];
    oflndvalAmt = json['oflndvalAmt'];
    oflndvalStdrMt = json['oflndvalStdrMt'];
    rprsLtnoYn = json['rprsLtnoYn'];
    apasmtReqestYn = json['apasmtReqestYn'];
    invstgDt = json['invstgDt'];
    cmpnstnDtaChnStatDivCd = json['cmpnstnDtaChnStatDivCd'];
    cmpnstnDtaCreatId = json['cmpnstnDtaCreatId'];
    cmpnstnDtaCreatGrpId = json['cmpnstnDtaCreatGrpId'];
    chnCtnt = json['chnCtnt'];
    parentMlnoLtno = json['parentMlnoLtno'];
    parentSlnoLtno = json['parentSlnoLtno'];
    parentLcrtsDivCd = json['parentLcrtsDivCd'];
    lotMergeDivsDivCd = json['lotMergeDivsDivCd'];
    accdtInvstgRm = json['accdtInvstgRm'];
    frstRgstrId = json['frstRgstrId'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdusrId = json['lastUpdusrId'];
    lastUpdtDt = json['lastUpdtDt'];
    cmpnstnStepDivCd = json['cmpnstnStepDivCd'];
    cmpnstnStepDivCdNm = json['cmpnstnStepDivCdNm'];
  }
  String? bsnsNo;
  num? bsnsZoneNo;
  String? thingSerNo;
  num? accdtInvstgRstSqnc;
  num? accdtInvstgSqnc;
  String? lcrtsDivCd;
  String? lgdongCd;
  String? mlnoLtno;
  String? slnoLtno;
  String? sttusLndcgrDivCd;
  String? acqsPrpDivCd;
  dynamic aceptncUseDivCd;
  String? lgdongNm;
  String? ofcbkLndcgrDivCd;
  num? ofcbkAra;
  num? incrprAra;
  num? cmpnstnInvstgAra;
  num? oflndvalAmt;
  dynamic oflndvalStdrMt;
  String? rprsLtnoYn;
  String? apasmtReqestYn;
  String? invstgDt;
  dynamic cmpnstnDtaChnStatDivCd;
  String? cmpnstnDtaCreatId;
  dynamic cmpnstnDtaCreatGrpId;
  dynamic chnCtnt;
  String? parentMlnoLtno;
  String? parentSlnoLtno;
  dynamic parentLcrtsDivCd;
  dynamic lotMergeDivsDivCd;
  dynamic accdtInvstgRm;
  String? frstRgstrId;
  String? frstRegistDt;
  String? lastUpdusrId;
  String? lastUpdtDt;
  String? cmpnstnStepDivCd;
  String? cmpnstnStepDivCdNm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['thingSerNo'] = thingSerNo;
    map['accdtInvstgRstSqnc'] = accdtInvstgRstSqnc;
    map['accdtInvstgSqnc'] = accdtInvstgSqnc;
    map['lcrtsDivCd'] = lcrtsDivCd;
    map['lgdongCd'] = lgdongCd;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['sttusLndcgrDivCd'] = sttusLndcgrDivCd;
    map['acqsPrpDivCd'] = acqsPrpDivCd;
    map['aceptncUseDivCd'] = aceptncUseDivCd;
    map['lgdongNm'] = lgdongNm;
    map['ofcbkLndcgrDivCd'] = ofcbkLndcgrDivCd;
    map['ofcbkAra'] = ofcbkAra;
    map['incrprAra'] = incrprAra;
    map['cmpnstnInvstgAra'] = cmpnstnInvstgAra;
    map['oflndvalAmt'] = oflndvalAmt;
    map['oflndvalStdrMt'] = oflndvalStdrMt;
    map['rprsLtnoYn'] = rprsLtnoYn;
    map['apasmtReqestYn'] = apasmtReqestYn;
    map['invstgDt'] = invstgDt;
    map['cmpnstnDtaChnStatDivCd'] = cmpnstnDtaChnStatDivCd;
    map['cmpnstnDtaCreatId'] = cmpnstnDtaCreatId;
    map['cmpnstnDtaCreatGrpId'] = cmpnstnDtaCreatGrpId;
    map['chnCtnt'] = chnCtnt;
    map['parentMlnoLtno'] = parentMlnoLtno;
    map['parentSlnoLtno'] = parentSlnoLtno;
    map['parentLcrtsDivCd'] = parentLcrtsDivCd;
    map['lotMergeDivsDivCd'] = lotMergeDivsDivCd;
    map['accdtInvstgRm'] = accdtInvstgRm;
    map['frstRgstrId'] = frstRgstrId;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrId'] = lastUpdusrId;
    map['lastUpdtDt'] = lastUpdtDt;
    map['cmpnstnStepDivCd'] = cmpnstnStepDivCd;
    map['cmpnstnStepDivCdNm'] = cmpnstnStepDivCdNm;
    return map;
  }

}