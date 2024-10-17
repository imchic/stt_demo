import 'dart:convert';
/// chk : 0
/// bsnsNo : "3015"
/// bsnsZoneNo : "1"
/// thingSerNo : "O-0000003015-0001-3611039023-1-0080-0001-000001"
/// accdtInvstgSqnc : "1"
/// accdtInvstgRstSqnc : "999"
/// cmpnstnObstNo : "1"
/// lgdongCd : "3611039023"
/// lcrtsDivCd : "1"
/// lcrtsDivCdNm : "일반"
/// mlnoLtno : "80"
/// slnoLtno : "1"
/// acqsPrpDivCd : "S03"
/// acqsPrpDivNm : "도수관로"
/// lgdongNm : "세종특별자치시  소정면 대곡리"
/// invstgDt : "2014-03-01"
/// obstDivCd : "03"
/// obstDivNm : "과수 등"
/// cmpnstnThingKndDtls : "복숭아나무1"
/// obstStrctStndrdInfo : "근경(10cm)"
/// dtaPrcsSittnCtnt : null
/// cmpnstnQtyAraVu : "2"
/// cmpnstnThingUnitDivCd : "175"
/// cmpnstnThingUnitDivNm : "주"
/// cmpnstnStepDivCd : "49"
/// cmpnstnStepDivNm : "보상비지급"
/// cmptnUpcCtnt : null
/// chnCtnt : null
/// spcitm : null
/// fobjctNo : null
/// obstSeq : null
/// apasmtReqestYn : "Y"
/// sttusLndcgrDivCd : "01"
/// sttusLndcgrDivNm : "전"
/// aceptncUseDivCd : "02"
/// aceptncUseDivNm : "사용"
/// incrprAra : "206"
/// accdtInvstgRm : "지장물 입력"
/// obstAtchflId : null
/// frstRgstrNm : null
/// frstRegistDt : "2017-09-04"
/// lastUpdtDt : 1504520007000
/// locinfo : "세종특별자치시  소정면 대곡리  일반  80 - 1"
/// sanctnStatCd : null
/// sanctnDe : null
List accdtlnvstgObstDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = AccdtlnvstgObstModel.fromJson(str[i] == 'null' ? {} : str[i]);
    list.add(data);
  }
  return list;
}

AccdtlnvstgObstModel AccdtlnvstgObstModelFromJson(String str) => AccdtlnvstgObstModel.fromJson(json.decode(str));
String AccdtlnvstgObstModelToJson(AccdtlnvstgObstModel data) => json.encode(data.toJson());
class AccdtlnvstgObstModel {
  AccdtlnvstgObstModel({
    this.chk,
    this.bsnsNo,
    this.bsnsZoneNo,
    this.thingSerNo,
    this.accdtInvstgSqnc,
    this.accdtInvstgRstSqnc,
    this.cmpnstnObstNo,
    this.lgdongCd,
    this.lcrtsDivCd,
    this.lcrtsDivCdNm,
    this.mlnoLtno,
    this.slnoLtno,
    this.acqsPrpDivCd,
    this.acqsPrpDivNm,
    this.lgdongNm,
    this.invstgDt,
    this.obstDivCd,
    this.obstDivNm,
    this.cmpnstnThingKndDtls,
    this.obstStrctStndrdInfo,
    this.dtaPrcsSittnCtnt,
    this.cmpnstnQtyAraVu,
    this.cmpnstnThingUnitDivCd,
    this.cmpnstnThingUnitDivNm,
    this.cmpnstnStepDivCd,
    this.cmpnstnStepDivNm,
    this.cmptnUpcCtnt,
    this.chnCtnt,
    this.spcitm,
    this.fobjctNo,
    this.obstSeq,
    this.apasmtReqestYn,
    this.sttusLndcgrDivCd,
    this.sttusLndcgrDivNm,
    this.aceptncUseDivCd,
    this.aceptncUseDivNm,
    this.incrprAra,
    this.accdtInvstgRm,
    this.obstAtchflId,
    this.frstRgstrNm,
    this.frstRegistDt,
    this.lastUpdtDt,
    this.locinfo,
    this.sanctnStatCd,
    this.sanctnDe,});

  AccdtlnvstgObstModel.fromJson(dynamic json) {
    chk = json['chk'];
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    thingSerNo = json['thingSerNo'];
    accdtInvstgSqnc = json['accdtInvstgSqnc'];
    accdtInvstgRstSqnc = json['accdtInvstgRstSqnc'];
    cmpnstnObstNo = json['cmpnstnObstNo'];
    lgdongCd = json['lgdongCd'];
    lcrtsDivCd = json['lcrtsDivCd'];
    lcrtsDivCdNm = json['lcrtsDivCdNm'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    acqsPrpDivCd = json['acqsPrpDivCd'];
    acqsPrpDivNm = json['acqsPrpDivNm'];
    lgdongNm = json['lgdongNm'];
    invstgDt = json['invstgDt'];
    obstDivCd = json['obstDivCd'];
    obstDivNm = json['obstDivNm'];
    cmpnstnThingKndDtls = json['cmpnstnThingKndDtls'];
    obstStrctStndrdInfo = json['obstStrctStndrdInfo'];
    dtaPrcsSittnCtnt = json['dtaPrcsSittnCtnt'];
    cmpnstnQtyAraVu = json['cmpnstnQtyAraVu'];
    cmpnstnThingUnitDivCd = json['cmpnstnThingUnitDivCd'];
    cmpnstnThingUnitDivNm = json['cmpnstnThingUnitDivNm'];
    cmpnstnStepDivCd = json['cmpnstnStepDivCd'];
    cmpnstnStepDivNm = json['cmpnstnStepDivNm'];
    cmptnUpcCtnt = json['cmptnUpcCtnt'];
    chnCtnt = json['chnCtnt'];
    spcitm = json['spcitm'];
    fobjctNo = json['fobjctNo'];
    obstSeq = json['obstSeq'];
    apasmtReqestYn = json['apasmtReqestYn'];
    sttusLndcgrDivCd = json['sttusLndcgrDivCd'];
    sttusLndcgrDivNm = json['sttusLndcgrDivNm'];
    aceptncUseDivCd = json['aceptncUseDivCd'];
    aceptncUseDivNm = json['aceptncUseDivNm'];
    incrprAra = json['incrprAra'];
    accdtInvstgRm = json['accdtInvstgRm'];
    obstAtchflId = json['obstAtchflId'];
    frstRgstrNm = json['frstRgstrNm'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdtDt = json['lastUpdtDt'];
    locinfo = json['locinfo'];
    sanctnStatCd = json['sanctnStatCd'];
    sanctnDe = json['sanctnDe'];
  }
  num? chk;
  String? bsnsNo;
  String? bsnsZoneNo;
  String? thingSerNo;
  String? accdtInvstgSqnc;
  String? accdtInvstgRstSqnc;
  String? cmpnstnObstNo;
  String? lgdongCd;
  String? lcrtsDivCd;
  String? lcrtsDivCdNm;
  String? mlnoLtno;
  String? slnoLtno;
  String? acqsPrpDivCd;
  String? acqsPrpDivNm;
  String? lgdongNm;
  String? invstgDt;
  String? obstDivCd;
  String? obstDivNm;
  String? cmpnstnThingKndDtls;
  String? obstStrctStndrdInfo;
  dynamic dtaPrcsSittnCtnt;
  String? cmpnstnQtyAraVu;
  String? cmpnstnThingUnitDivCd;
  String? cmpnstnThingUnitDivNm;
  String? cmpnstnStepDivCd;
  String? cmpnstnStepDivNm;
  dynamic cmptnUpcCtnt;
  dynamic chnCtnt;
  dynamic spcitm;
  dynamic fobjctNo;
  dynamic obstSeq;
  String? apasmtReqestYn;
  String? sttusLndcgrDivCd;
  String? sttusLndcgrDivNm;
  String? aceptncUseDivCd;
  String? aceptncUseDivNm;
  String? incrprAra;
  String? accdtInvstgRm;
  dynamic obstAtchflId;
  dynamic frstRgstrNm;
  String? frstRegistDt;
  num? lastUpdtDt;
  String? locinfo;
  dynamic sanctnStatCd;
  dynamic sanctnDe;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['chk'] = chk;
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['thingSerNo'] = thingSerNo;
    map['accdtInvstgSqnc'] = accdtInvstgSqnc;
    map['accdtInvstgRstSqnc'] = accdtInvstgRstSqnc;
    map['cmpnstnObstNo'] = cmpnstnObstNo;
    map['lgdongCd'] = lgdongCd;
    map['lcrtsDivCd'] = lcrtsDivCd;
    map['lcrtsDivCdNm'] = lcrtsDivCdNm;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['acqsPrpDivCd'] = acqsPrpDivCd;
    map['acqsPrpDivNm'] = acqsPrpDivNm;
    map['lgdongNm'] = lgdongNm;
    map['invstgDt'] = invstgDt;
    map['obstDivCd'] = obstDivCd;
    map['obstDivNm'] = obstDivNm;
    map['cmpnstnThingKndDtls'] = cmpnstnThingKndDtls ?? '';
    map['obstStrctStndrdInfo'] = obstStrctStndrdInfo;
    map['dtaPrcsSittnCtnt'] = dtaPrcsSittnCtnt;
    map['cmpnstnQtyAraVu'] = cmpnstnQtyAraVu;
    map['cmpnstnThingUnitDivCd'] = cmpnstnThingUnitDivCd;
    map['cmpnstnThingUnitDivNm'] = cmpnstnThingUnitDivNm;
    map['cmpnstnStepDivCd'] = cmpnstnStepDivCd;
    map['cmpnstnStepDivNm'] = cmpnstnStepDivNm;
    map['cmptnUpcCtnt'] = cmptnUpcCtnt;
    map['chnCtnt'] = chnCtnt;
    map['spcitm'] = spcitm ?? '';
    map['fobjctNo'] = fobjctNo;
    map['obstSeq'] = obstSeq;
    map['apasmtReqestYn'] = apasmtReqestYn;
    map['sttusLndcgrDivCd'] = sttusLndcgrDivCd;
    map['sttusLndcgrDivNm'] = sttusLndcgrDivNm;
    map['aceptncUseDivCd'] = aceptncUseDivCd;
    map['aceptncUseDivNm'] = aceptncUseDivNm;
    map['incrprAra'] = incrprAra;
    map['accdtInvstgRm'] = accdtInvstgRm;
    map['obstAtchflId'] = obstAtchflId;
    map['frstRgstrNm'] = frstRgstrNm;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdtDt'] = lastUpdtDt;
    map['locinfo'] = locinfo;
    map['sanctnStatCd'] = sanctnStatCd;
    map['sanctnDe'] = sanctnDe;
    return map;
  }

}