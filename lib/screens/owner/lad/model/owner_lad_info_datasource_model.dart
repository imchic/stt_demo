import 'dart:convert';

/// bsnsNo : "5006"
/// bsnsZoneNo : 1
/// thingSerNo : "L-0000005006-0001-4157031025-1-0576-0006-000001"
/// accdtInvstgRstSqnc : 2
/// accdtInvstgSqnc : 1
/// lcrtsDivCd : "1"
/// lcrtsDivNm : "일반"
/// lgdongCd : "4157031025"
/// mlnoLtno : "576"
/// slnoLtno : "6"
/// sttusLndcgrDivCd : "01"
/// sttusLndcgrDivNm : "전"
/// acqsPrpDivCd : "D16"
/// acqsPrpDivNm : "주운수로"
/// aceptncUseDivCd : "07"
/// aceptncUseDivNm : "염전"
/// lgdongNm : "경기도 김포시 고촌면 전호리"
/// ofcbkLndcgrDivCd : "02"
/// ofcbkLndcgrDivNm : "답"
/// ofcbkAra : 668
/// incrprAra : 668
/// cmpnstnInvstgAra : 668
/// oflndvalAmt : 0
/// oflndvalStdrMt : null
/// rprsLtnoYn : "Y"
/// apasmtReqestYn : "Y"
/// invstgDt : "20100210"
/// cmpnstnDtaChnStatDivCd : null
/// cmpnstnDtaCreatId : "실태IMPORT"
/// cmpnstnDtaCreatGrpId : null
/// chnCtnt : null
/// parentMlnoLtno : "0"
/// parentSlnoLtno : "0"
/// parentLcrtsDivCd : null
/// lotMergeDivsDivCd : null
/// accdtInvstgRm : null
/// frstRgstrId : "0"
/// frstRegistDt : "20100426"
/// lastUpdusrId : "LMIS"
/// lastUpdtDt : "20151001"
/// cmpnstnStepDivCd : "49"
/// cmpnstnStepDivCdNm : "보상비지급"

List ownerLadInfoDataSourceKeyValue(
    dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = OwnerLadInfoDatasourceModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

OwnerLadInfoDatasourceModel ownerLadInfoDatasourceModelFromJson(String str) =>
    OwnerLadInfoDatasourceModel.fromJson(json.decode(str));

String ownerLadInfoDatasourceModelToJson(OwnerLadInfoDatasourceModel data) =>
    json.encode(data.toJson());

class OwnerLadInfoDatasourceModel {
  OwnerLadInfoDatasourceModel({
    this.bsnsNo,
    this.bsnsZoneNo,
    this.thingSerNo,
    this.accdtInvstgRstSqnc,
    this.accdtInvstgSqnc,
    this.lcrtsDivCd,
    this.lcrtsDivNm,
    this.lgdongCd,
    this.mlnoLtno,
    this.slnoLtno,
    this.sttusLndcgrDivCd,
    this.sttusLndcgrDivNm,
    this.acqsPrpDivCd,
    this.acqsPrpDivNm,
    this.aceptncUseDivCd,
    this.aceptncUseDivNm,
    this.lgdongNm,
    this.ofcbkLndcgrDivCd,
    this.ofcbkLndcgrDivNm,
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
    this.cmpnstnStepDivCdNm,
  });

  OwnerLadInfoDatasourceModel.fromJson(dynamic json) {
    // bsnsNo = json['bsnsNo'];
    // bsnsZoneNo = json['bsnsZoneNo'];
    // thingSerNo = json['thingSerNo'];
    // accdtInvstgRstSqnc = json['accdtInvstgRstSqnc'];
    // accdtInvstgSqnc = json['accdtInvstgSqnc'];
    // lcrtsDivCd = json['lcrtsDivCd'] ?? '';
    // lcrtsDivNm = json['lcrtsDivNm'];
    // lgdongCd = json['lgdongCd'];
    // mlnoLtno = json['mlnoLtno'];
    // slnoLtno = json['slnoLtno'];
    // sttusLndcgrDivCd = json['sttusLndcgrDivCd'];
    // sttusLndcgrDivNm = json['sttusLndcgrDivNm'];
    // acqsPrpDivCd = json['acqsPrpDivCd'];
    // acqsPrpDivNm = json['acqsPrpDivNm'];
    // aceptncUseDivCd = json['aceptncUseDivCd'];
    // aceptncUseDivNm = json['aceptncUseDivNm'];
    // lgdongNm = json['lgdongNm'];
    // ofcbkLndcgrDivCd = json['ofcbkLndcgrDivCd'];
    // ofcbkLndcgrDivNm = json['ofcbkLndcgrDivNm'];
    // ofcbkAra = json['ofcbkAra'];
    // incrprAra = json['incrprAra'];
    // cmpnstnInvstgAra = json['cmpnstnInvstgAra'];
    // oflndvalAmt = json['oflndvalAmt'];
    // oflndvalStdrMt = json['oflndvalStdrMt'];
    // rprsLtnoYn = json['rprsLtnoYn'];
    // apasmtReqestYn = json['apasmtReqestYn'];
    // invstgDt = json['invstgDt'];
    // cmpnstnDtaChnStatDivCd = json['cmpnstnDtaChnStatDivCd'];
    // cmpnstnDtaCreatId = json['cmpnstnDtaCreatId'];
    // cmpnstnDtaCreatGrpId = json['cmpnstnDtaCreatGrpId'];
    // chnCtnt = json['chnCtnt'];
    // parentMlnoLtno = json['parentMlnoLtno'];
    // parentSlnoLtno = json['parentSlnoLtno'];
    // parentLcrtsDivCd = json['parentLcrtsDivCd'];
    // lotMergeDivsDivCd = json['lotMergeDivsDivCd'];
    // accdtInvstgRm = json['accdtInvstgRm'];
    // frstRgstrId = json['frstRgstrId'];
    // frstRegistDt = json['frstRegistDt'];
    // lastUpdusrId = json['lastUpdusrId'];
    // lastUpdtDt = json['lastUpdtDt'];
    // cmpnstnStepDivCd = json['cmpnstnStepDivCd'];
    // cmpnstnStepDivCdNm = json['cmpnstnStepDivCdNm'];

    lgdongNm = json['lgdongNm'] ?? '';
    lcrtsDivCd = json['lcrtsDivCd'] ?? '';
    lcrtsDivNm = json['lcrtsDivNm'] ?? '';
    mlnoLtno = json['mlnoLtno'] ?? '';
    slnoLtno = json['slnoLtno'] ?? '';
    ofcbkLndcgrDivCd = json['ofcbkLndcgrDivCd'] ?? '';
    ofcbkLndcgrDivNm = json['ofcbkLndcgrDivNm'] ?? '';
    sttusLndcgrDivCd = json['sttusLndcgrDivCd'] ?? '';
    sttusLndcgrDivNm = json['sttusLndcgrDivNm'] ?? '';
    //ofcbkAra= json['ofcbkAra'] ?? '';
    ofcbkAra = json['ofcbkAra'] ?? '';
    incrprAra = json['incrprAra'] ?? '';
    cmpnstnInvstgAra = json['cmpnstnInvstgAra'] ?? '';
    acqsPrpDivCd = json['acqsPrpDivCd'] ?? '';
    acqsPrpDivNm = json['acqsPrpDivNm'] ?? '';
    aceptncUseDivCd = json['aceptncUseDivCd'] ?? '';
    aceptncUseDivNm = json['aceptncUseDivNm'] ?? '';
    accdtInvstgSqnc = json['accdtInvstgSqnc'] ?? '';
    invstgDt = json['invstgDt'] ?? '';
    cmpnstnStepDivCd = json['cmpnstnStepDivCd'] ?? '';
    cmpnstnStepDivCdNm = json['cmpnstnStepDivCdNm'] ?? '';
    accdtInvstgRm = json['accdtInvstgRm'] ?? '';
  }

  String? bsnsNo;
  num? bsnsZoneNo;
  String? thingSerNo;
  num? accdtInvstgRstSqnc;
  num? accdtInvstgSqnc;
  String? lcrtsDivCd;
  String? lcrtsDivNm;
  String? lgdongCd;
  String? mlnoLtno;
  String? slnoLtno;
  String? sttusLndcgrDivCd;
  String? sttusLndcgrDivNm;
  String? acqsPrpDivCd;
  String? acqsPrpDivNm;
  String? aceptncUseDivCd;
  String? aceptncUseDivNm;
  String? lgdongNm;
  String? ofcbkLndcgrDivCd;
  String? ofcbkLndcgrDivNm;
  String? ofcbkAra;
  String? incrprAra;
  String? cmpnstnInvstgAra;
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
    map['lcrtsDivNm'] = lcrtsDivNm;
    map['lgdongCd'] = lgdongCd;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['sttusLndcgrDivCd'] = sttusLndcgrDivCd;
    map['sttusLndcgrDivNm'] = sttusLndcgrDivNm;
    map['acqsPrpDivCd'] = acqsPrpDivCd;
    map['acqsPrpDivNm'] = acqsPrpDivNm;
    map['aceptncUseDivCd'] = aceptncUseDivCd;
    map['aceptncUseDivNm'] = aceptncUseDivNm;
    map['lgdongNm'] = lgdongNm;
    map['ofcbkLndcgrDivCd'] = ofcbkLndcgrDivCd;
    map['ofcbkLndcgrDivNm'] = ofcbkLndcgrDivNm;
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
