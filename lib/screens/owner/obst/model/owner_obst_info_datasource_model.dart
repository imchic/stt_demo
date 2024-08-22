import 'dart:convert';
/// bsnsNo : "4301"
/// bsnsZoneNo : 1
/// thingSerNo : "O-0000004301-0001-4313012100-1-0898-0003-000001"
/// accdtInvstgRstSqnc : 1
/// accdtInvstgSqnc : 1
/// cmpnstnObstNo : 1
/// obstSeq : 1
/// lgdongCd : "4313012100"
/// mlnoLtno : "898"
/// slnoLtno : "3"
/// lcrtsDivCd : "1"
/// acqsPrpDivCd : "D18"
/// lgdongNm : "충청북도 충주시 종민동"
/// invstgDt : "2015-03-10"
/// obstDivCd : "03"
/// cmpnstnThingKndDtls : "사과나무"
/// obstStrctStndrdInfo : null
/// dtaPrcsSittnCtnt : null
/// cmpnstnQtyAraVu : 433
/// cmpnstnThingUnitDivCd : "175"
/// cmptnUpcCtnt : null
/// cmpnstnDtaChnStatDivCd : null
/// chnCtnt : null
/// spcitm : "10년"
/// fobjctNo : "0"
/// accdtInvstgRm : null
/// frstRgstrId : "0"
/// frstRegistDt : 1429025457000
/// lastUpdusrId : "LMIS"
/// lastUpdtDt : 1443675917000
/// cmpnstnStepDivCd : "49"
/// cmpnstnStepDivCdNm : "x"

OwnerObstInfoDatasourceModel ownerObstInfoDatasourcModelFromJson(String str) => OwnerObstInfoDatasourceModel.fromJson(json.decode(str));
String ownerObstInfoDatasourcModelToJson(OwnerObstInfoDatasourceModel data) => json.encode(data.toJson());
class OwnerObstInfoDatasourceModel {
  OwnerObstInfoDatasourceModel({
      this.bsnsNo, 
      this.bsnsZoneNo, 
      this.thingSerNo, 
      this.accdtInvstgRstSqnc, 
      this.accdtInvstgSqnc, 
      this.cmpnstnObstNo, 
      this.obstSeq, 
      this.lgdongCd, 
      this.mlnoLtno, 
      this.slnoLtno, 
      this.lcrtsDivCd, 
      this.acqsPrpDivCd, 
      this.lgdongNm, 
      this.invstgDt, 
      this.obstDivCd, 
      this.cmpnstnThingKndDtls, 
      this.obstStrctStndrdInfo, 
      this.dtaPrcsSittnCtnt, 
      this.cmpnstnQtyAraVu, 
      this.cmpnstnThingUnitDivCd, 
      this.cmptnUpcCtnt, 
      this.cmpnstnDtaChnStatDivCd, 
      this.chnCtnt, 
      this.spcitm, 
      this.fobjctNo, 
      this.accdtInvstgRm, 
      this.frstRgstrId, 
      this.frstRegistDt, 
      this.lastUpdusrId, 
      this.lastUpdtDt, 
      this.cmpnstnStepDivCd, 
      this.cmpnstnStepDivCdNm,});

  OwnerObstInfoDatasourceModel.fromJson(dynamic json) {
    bsnsNo = json['bsnsNo'];
    bsnsZoneNo = json['bsnsZoneNo'];
    thingSerNo = json['thingSerNo'];
    accdtInvstgRstSqnc = json['accdtInvstgRstSqnc'];
    accdtInvstgSqnc = json['accdtInvstgSqnc'];
    cmpnstnObstNo = json['cmpnstnObstNo'];
    obstSeq = json['obstSeq'];
    lgdongCd = json['lgdongCd'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    lcrtsDivCd = json['lcrtsDivCd'];
    acqsPrpDivCd = json['acqsPrpDivCd'];
    lgdongNm = json['lgdongNm'];
    invstgDt = json['invstgDt'];
    obstDivCd = json['obstDivCd'];
    cmpnstnThingKndDtls = json['cmpnstnThingKndDtls'];
    obstStrctStndrdInfo = json['obstStrctStndrdInfo'];
    dtaPrcsSittnCtnt = json['dtaPrcsSittnCtnt'];
    cmpnstnQtyAraVu = json['cmpnstnQtyAraVu'];
    cmpnstnThingUnitDivCd = json['cmpnstnThingUnitDivCd'];
    cmptnUpcCtnt = json['cmptnUpcCtnt'];
    cmpnstnDtaChnStatDivCd = json['cmpnstnDtaChnStatDivCd'];
    chnCtnt = json['chnCtnt'];
    spcitm = json['spcitm'];
    fobjctNo = json['fobjctNo'];
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
  num? cmpnstnObstNo;
  num? obstSeq;
  String? lgdongCd;
  String? mlnoLtno;
  String? slnoLtno;
  String? lcrtsDivCd;
  String? acqsPrpDivCd;
  String? lgdongNm;
  String? invstgDt;
  String? obstDivCd;
  String? cmpnstnThingKndDtls;
  dynamic obstStrctStndrdInfo;
  dynamic dtaPrcsSittnCtnt;
  num? cmpnstnQtyAraVu;
  String? cmpnstnThingUnitDivCd;
  dynamic cmptnUpcCtnt;
  dynamic cmpnstnDtaChnStatDivCd;
  dynamic chnCtnt;
  String? spcitm;
  String? fobjctNo;
  dynamic accdtInvstgRm;
  String? frstRgstrId;
  num? frstRegistDt;
  String? lastUpdusrId;
  num? lastUpdtDt;
  String? cmpnstnStepDivCd;
  String? cmpnstnStepDivCdNm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsnsNo'] = bsnsNo;
    map['bsnsZoneNo'] = bsnsZoneNo;
    map['thingSerNo'] = thingSerNo;
    map['accdtInvstgRstSqnc'] = accdtInvstgRstSqnc;
    map['accdtInvstgSqnc'] = accdtInvstgSqnc;
    map['cmpnstnObstNo'] = cmpnstnObstNo;
    map['obstSeq'] = obstSeq;
    map['lgdongCd'] = lgdongCd;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['lcrtsDivCd'] = lcrtsDivCd;
    map['acqsPrpDivCd'] = acqsPrpDivCd;
    map['lgdongNm'] = lgdongNm;
    map['invstgDt'] = invstgDt;
    map['obstDivCd'] = obstDivCd;
    map['cmpnstnThingKndDtls'] = cmpnstnThingKndDtls;
    map['obstStrctStndrdInfo'] = obstStrctStndrdInfo;
    map['dtaPrcsSittnCtnt'] = dtaPrcsSittnCtnt;
    map['cmpnstnQtyAraVu'] = cmpnstnQtyAraVu;
    map['cmpnstnThingUnitDivCd'] = cmpnstnThingUnitDivCd;
    map['cmptnUpcCtnt'] = cmptnUpcCtnt;
    map['cmpnstnDtaChnStatDivCd'] = cmpnstnDtaChnStatDivCd;
    map['chnCtnt'] = chnCtnt;
    map['spcitm'] = spcitm;
    map['fobjctNo'] = fobjctNo;
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