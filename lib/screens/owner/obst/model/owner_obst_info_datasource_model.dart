import 'dart:convert';
/// bsnsNo : "2005"
/// bsnsZoneNo : 1
/// thingSerNo : "O-0000002005-0001-4715043023-2-0016-0005-000007"
/// accdtInvstgRstSqnc : 0
/// accdtInvstgSqnc : 3
/// cmpnstnObstNo : 8
/// obstSeq : 7
/// lgdongCd : "4715043023"
/// mlnoLtno : "16"
/// slnoLtno : "5"
/// lcrtsDivCd : "2"
/// lcrtsDivNm : "산"
/// acqsPrpDivCd : "D01"
/// acqsPrpDivNm : "수몰용지"
/// lgdongNm : "경상북도 김천시 부항면 지좌리 "
/// invstgDt : "2006-09-25"
/// obstDivCd : "09"
/// obstDivNm : "분묘"
/// cmpnstnThingKndDtls : "단장"
/// obstStrctStndrdInfo : "6-14"
/// dtaPrcsSittnCtnt : "무연"
/// cmpnstnQtyAraVu : 1
/// cmpnstnThingUnitDivCd : "910"
/// cmpnstnThingUnitDivNm : "기"
/// cmptnUpcCtnt : null
/// cmpnstnDtaChnStatDivCd : "09"
/// chnCtnt : "데이터변경"
/// spcitm : null
/// fobjctNo : "0"
/// accdtInvstgRm : null
/// frstRgstrId : "20090301"
/// frstRegistDt : 1264644377000
/// lastUpdusrId : "LMIS"
/// lastUpdtDt : 1443631404000
/// cmpnstnStepDivCd : "41"
/// cmpnstnStepDivNm : "보상협의요청"

OwnerObstInfoDatasourceModel ownerObstInfoDatasourceModelFromJson(String str) => OwnerObstInfoDatasourceModel.fromJson(json.decode(str));
String ownerObstInfoDatasourceModelToJson(OwnerObstInfoDatasourceModel data) => json.encode(data.toJson());
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
      this.lcrtsDivNm, 
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
      this.cmpnstnStepDivNm,});

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
    lcrtsDivNm = json['lcrtsDivNm'];
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
    cmpnstnStepDivNm = json['cmpnstnStepDivNm'];
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
  String? lcrtsDivNm;
  String? acqsPrpDivCd;
  String? acqsPrpDivNm;
  String? lgdongNm;
  String? invstgDt;
  String? obstDivCd;
  String? obstDivNm;
  String? cmpnstnThingKndDtls;
  String? obstStrctStndrdInfo;
  String? dtaPrcsSittnCtnt;
  num? cmpnstnQtyAraVu;
  String? cmpnstnThingUnitDivCd;
  String? cmpnstnThingUnitDivNm;
  dynamic cmptnUpcCtnt;
  String? cmpnstnDtaChnStatDivCd;
  String? chnCtnt;
  dynamic spcitm;
  String? fobjctNo;
  dynamic accdtInvstgRm;
  String? frstRgstrId;
  num? frstRegistDt;
  String? lastUpdusrId;
  num? lastUpdtDt;
  String? cmpnstnStepDivCd;
  String? cmpnstnStepDivNm;

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
    map['lcrtsDivNm'] = lcrtsDivNm;
    map['acqsPrpDivCd'] = acqsPrpDivCd;
    map['acqsPrpDivNm'] = acqsPrpDivNm;
    map['lgdongNm'] = lgdongNm;
    map['invstgDt'] = invstgDt;
    map['obstDivCd'] = obstDivCd;
    map['obstDivNm'] = obstDivNm;
    map['cmpnstnThingKndDtls'] = cmpnstnThingKndDtls;
    map['obstStrctStndrdInfo'] = obstStrctStndrdInfo;
    map['dtaPrcsSittnCtnt'] = dtaPrcsSittnCtnt;
    map['cmpnstnQtyAraVu'] = cmpnstnQtyAraVu;
    map['cmpnstnThingUnitDivCd'] = cmpnstnThingUnitDivCd;
    map['cmpnstnThingUnitDivNm'] = cmpnstnThingUnitDivNm;
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
    map['cmpnstnStepDivNm'] = cmpnstnStepDivNm;
    return map;
  }

}