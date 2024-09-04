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
/// acqsPrpDivNm : "송수관로"
/// cmpnstnThingKndDtls : "스프링쿨러타이머"
/// obstDivCd : "02"
/// obstDivNm : "공작물"
/// obstStrctStndrdInfo : null
/// dtaPrcsSittnCtnt : null
/// cmpnstnQtyAraVu : 1
/// cmpnstnThingUnitDivCd : "182"
/// cmpnstnThingUnitDivNm : "식"
/// lwstApelStepDivCd : null
/// lwstApelStepDivNm : null
/// trl01LwstPymamt : null
/// trl01LwstSlipNo : null
/// judmnPymntDe : null
List cstmrcardObstLwstDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = CstmrcardObstLwstDatasourceModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

CstmrcardObstLwstDatasourceModel cstmrcardObstLwstDatasourceModelFromJson(String str) => CstmrcardObstLwstDatasourceModel.fromJson(json.decode(str));
String cstmrcardObstLwstDatasourceModelToJson(CstmrcardObstLwstDatasourceModel data) => json.encode(data.toJson());
class CstmrcardObstLwstDatasourceModel {
  CstmrcardObstLwstDatasourceModel({
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
      this.lwstApelStepDivCd, 
      this.lwstApelStepDivNm, 
      this.trl01LwstPymamt, 
      this.trl01LwstSlipNo, 
      this.judmnPymntDe,});

  CstmrcardObstLwstDatasourceModel.fromJson(dynamic json) {
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
    lwstApelStepDivCd = json['lwstApelStepDivCd'];
    lwstApelStepDivNm = json['lwstApelStepDivNm'];
    trl01LwstPymamt = json['trl01LwstPymamt'];
    trl01LwstSlipNo = json['trl01LwstSlipNo'];
    judmnPymntDe = json['judmnPymntDe'];
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
  dynamic lwstApelStepDivCd;
  dynamic lwstApelStepDivNm;
  dynamic trl01LwstPymamt;
  dynamic trl01LwstSlipNo;
  dynamic judmnPymntDe;

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
    map['lwstApelStepDivCd'] = lwstApelStepDivCd;
    map['lwstApelStepDivNm'] = lwstApelStepDivNm;
    map['trl01LwstPymamt'] = trl01LwstPymamt;
    map['trl01LwstSlipNo'] = trl01LwstSlipNo;
    map['judmnPymntDe'] = judmnPymntDe;
    return map;
  }

}