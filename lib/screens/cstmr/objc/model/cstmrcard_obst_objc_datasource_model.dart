import 'dart:convert';
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
/// cmpnstnThingKndDtls : "스프링쿨러타이머"
/// obstDivCd : "02"
/// acqsPrpDivNm : "송수관로"
/// obstDivNm : "공작물"
/// obstStrctStndrdInfo : null
/// dtaPrcsSittnCtnt : null
/// cmpnstnQtyAraVu : 1
/// cmpnstnThingUnitDivCd : "182"
/// cmpnstnThingUnitDivNm : "식"
/// objcLdgmntDe : null
/// objcLdgmntAmt : null
/// obadUpc : null
/// objcRstAmt : null
/// objcIrsdAmt : null
/// objcAdjdcDt : null
/// objcLdgmntPrrgDe : null
List cstmrcardObstObjcDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = CstmrcardObstObjcDatasourceModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

CstmrcardObstObjcDatasourceModel cstmrcardObstObjcDatasourceModelFromJson(String str) => CstmrcardObstObjcDatasourceModel.fromJson(json.decode(str));
String cstmrcardObstObjcDatasourceModelToJson(CstmrcardObstObjcDatasourceModel data) => json.encode(data.toJson());
class CstmrcardObstObjcDatasourceModel {
  CstmrcardObstObjcDatasourceModel({
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
      this.cmpnstnThingKndDtls, 
      this.obstDivCd, 
      this.acqsPrpDivNm, 
      this.obstDivNm, 
      this.obstStrctStndrdInfo, 
      this.dtaPrcsSittnCtnt, 
      this.cmpnstnQtyAraVu, 
      this.cmpnstnThingUnitDivCd, 
      this.cmpnstnThingUnitDivNm, 
      this.objcLdgmntDe, 
      this.objcLdgmntAmt, 
      this.obadUpc, 
      this.objcRstAmt, 
      this.objcIrsdAmt, 
      this.objcAdjdcDt, 
      this.objcLdgmntPrrgDe,});

  CstmrcardObstObjcDatasourceModel.fromJson(dynamic json) {
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
    cmpnstnThingKndDtls = json['cmpnstnThingKndDtls'];
    obstDivCd = json['obstDivCd'];
    acqsPrpDivNm = json['acqsPrpDivNm'];
    obstDivNm = json['obstDivNm'];
    obstStrctStndrdInfo = json['obstStrctStndrdInfo'];
    dtaPrcsSittnCtnt = json['dtaPrcsSittnCtnt'];
    cmpnstnQtyAraVu = json['cmpnstnQtyAraVu'];
    cmpnstnThingUnitDivCd = json['cmpnstnThingUnitDivCd'];
    cmpnstnThingUnitDivNm = json['cmpnstnThingUnitDivNm'];
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
  String? cmpnstnThingKndDtls;
  String? obstDivCd;
  String? acqsPrpDivNm;
  String? obstDivNm;
  dynamic obstStrctStndrdInfo;
  dynamic dtaPrcsSittnCtnt;
  num? cmpnstnQtyAraVu;
  String? cmpnstnThingUnitDivCd;
  String? cmpnstnThingUnitDivNm;
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
    map['cmpnstnThingKndDtls'] = cmpnstnThingKndDtls;
    map['obstDivCd'] = obstDivCd;
    map['acqsPrpDivNm'] = acqsPrpDivNm;
    map['obstDivNm'] = obstDivNm;
    map['obstStrctStndrdInfo'] = obstStrctStndrdInfo;
    map['dtaPrcsSittnCtnt'] = dtaPrcsSittnCtnt;
    map['cmpnstnQtyAraVu'] = cmpnstnQtyAraVu;
    map['cmpnstnThingUnitDivCd'] = cmpnstnThingUnitDivCd;
    map['cmpnstnThingUnitDivNm'] = cmpnstnThingUnitDivNm;
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