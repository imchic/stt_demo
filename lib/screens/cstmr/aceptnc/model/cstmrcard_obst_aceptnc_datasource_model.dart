import 'dart:convert';
import 'dart:core';
/// bsnsNo : "1034"
/// bsnsZoneNo : 1
/// thingSerNo : "O-0000001034-0001-4150035030-1-0022-0001-000006"
/// ownerNo : "1000029592"
/// lgdongCd : "4150035030"
/// lgdongNm : "경기도 이천시 대월면 구시리"
/// lcrtsDivCd : "1"
/// lcrtsDivNm : "일반"
/// mlnoLtno : "22"
/// slnoLtno : "1"
/// acqsPrpDivCd : "S04"
/// acqsPrpDivNm : "송수관로"
/// cmpnstnThingKndDtls : "스프링쿨러타이머"
/// obstDivCd : "02"
/// obstDivNm : "공작물"
/// obstStrctStndrdInfo : null
/// dtaPrcsSittnCtnt : null
/// cmpnstnQtyAraVu : 1
/// cmpnstnThingUnitDivCd : "182"
/// cmpnstnThingUnitDivNm : "식"
/// aceptncUseBeginDe : null
/// aceptncAdjdcDt : null
/// aceptncAdjdcUpc : null
/// aceptncAdjdcAmt : 50000
/// adjdcRqstSqnc : 0
/// cpsmnPymntStepDivCd : "02"

List cstmrcardObstAceptncDatasourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = CstmrcardObstAceptncDatasourceModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

CstmrcardObstAceptncDatasourceModel cstmrcardObstAceptncDatasourceModelFromJson(String str) => CstmrcardObstAceptncDatasourceModel.fromJson(json.decode(str));
String cstmrcardObstAceptncDatasourceModelToJson(CstmrcardObstAceptncDatasourceModel data) => json.encode(data.toJson());
class CstmrcardObstAceptncDatasourceModel {
  CstmrcardObstAceptncDatasourceModel({
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
      this.cmpnstnThingKndDtls, 
      this.obstDivCd, 
      this.obstDivNm, 
      this.obstStrctStndrdInfo, 
      this.dtaPrcsSittnCtnt, 
      this.cmpnstnQtyAraVu, 
      this.cmpnstnThingUnitDivCd, 
      this.cmpnstnThingUnitDivNm, 
      this.aceptncUseBeginDe, 
      this.aceptncAdjdcDt, 
      this.aceptncAdjdcUpc, 
      this.aceptncAdjdcAmt, 
      this.adjdcRqstSqnc, 
      this.cpsmnPymntStepDivCd,});

  CstmrcardObstAceptncDatasourceModel.fromJson(dynamic json) {
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
    cmpnstnThingKndDtls = json['cmpnstnThingKndDtls'];
    obstDivCd = json['obstDivCd'];
    obstDivNm = json['obstDivNm'];
    obstStrctStndrdInfo = json['obstStrctStndrdInfo'];
    dtaPrcsSittnCtnt = json['dtaPrcsSittnCtnt'];
    cmpnstnQtyAraVu = json['cmpnstnQtyAraVu'];
    cmpnstnThingUnitDivCd = json['cmpnstnThingUnitDivCd'];
    cmpnstnThingUnitDivNm = json['cmpnstnThingUnitDivNm'];
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
  String? cmpnstnThingKndDtls;
  String? obstDivCd;
  String? obstDivNm;
  dynamic obstStrctStndrdInfo;
  dynamic dtaPrcsSittnCtnt;
  num? cmpnstnQtyAraVu;
  String? cmpnstnThingUnitDivCd;
  String? cmpnstnThingUnitDivNm;
  dynamic aceptncUseBeginDe;
  dynamic aceptncAdjdcDt;
  dynamic aceptncAdjdcUpc;
  num? aceptncAdjdcAmt;
  num? adjdcRqstSqnc;
  String? cpsmnPymntStepDivCd;

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
    map['cmpnstnThingKndDtls'] = cmpnstnThingKndDtls;
    map['obstDivCd'] = obstDivCd;
    map['obstDivNm'] = obstDivNm;
    map['obstStrctStndrdInfo'] = obstStrctStndrdInfo;
    map['dtaPrcsSittnCtnt'] = dtaPrcsSittnCtnt;
    map['cmpnstnQtyAraVu'] = cmpnstnQtyAraVu;
    map['cmpnstnThingUnitDivCd'] = cmpnstnThingUnitDivCd;
    map['cmpnstnThingUnitDivNm'] = cmpnstnThingUnitDivNm;
    map['aceptncUseBeginDe'] = aceptncUseBeginDe;
    map['aceptncAdjdcDt'] = aceptncAdjdcDt;
    map['aceptncAdjdcUpc'] = aceptncAdjdcUpc;
    map['aceptncAdjdcAmt'] = aceptncAdjdcAmt;
    map['adjdcRqstSqnc'] = adjdcRqstSqnc;
    map['cpsmnPymntStepDivCd'] = cpsmnPymntStepDivCd;
    return map;
  }

}