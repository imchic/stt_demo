import 'dart:convert';
/// lgdongNm : "경상북도 군위군 고로면 양지리"
/// lcrtsDivCd : "2"
/// mlnoLtno : "2"
/// slnoLtno : "0"
/// '공부지목구분코드x' : "공부지목구분코드x"
/// '현황지목구분코드x' : "현황지목구분코드x"
/// cmpnstnStepDivCd : "49"
/// acqsPrpDivCd : "D09"
/// '공부면적x' : "공부면적x"
/// '편입면적x'--실태조사 : "편입면적x"
/// "cmpnstnObstNo": 3,
/// "obstDivCd": "03",
/// "obstDivNm": "과수 등",
/// "cmpnstnThingKndDtls": "지주(포도나무용)",
/// "obstStrctStndrdInfo": "철파이프(높이2m)",
/// "dtaPrcsSittnCtnt": null,
/// "cmpnstnQtyAraVu": 13,
/// "cmpnstnThingUnitDivCd": "034",
/// "cmpnstnThingUnitDivMm": "개",
/// "spcitm": null,
/// rqestNo : "2860"
/// '수용,사용x' : "수용,사용x"
/// invstgDe : "20070608"
/// accdtInvstgSqnc : 11
/// ownerNo : "1000026143"
/// posesnDivCd : "03"
/// ownerNm : "박두현"
/// ownerRgsbukAddr : "경상북도 군위군 고로면 석산리 916-1"
/// posesnShreNmrtrInfo : "1"
/// posesnShreDnmntrInfo : "1"
/// apasmtReqestDivCd : "01"
/// apasmtSqnc : 1
/// prcPnttmDe : "20070608"
/// apasmtInsttNm1 : "1"
/// apasmtInsttEvlUpc1 : 3190000
/// apasmtInsttEvamt1 : 3190000
/// apasmtInsttNm2 : "B 평가기관"
/// apasmtInsttEvlUpc2 : null
/// apasmtInsttEvamt2 : null
/// apasmtInsttNm3 : "C 평가기관"
/// apasmtInsttEvlUpc3 : null
/// apasmtInsttEvamt3 : null
/// cmpnstnCmptnUpc : 3190000
/// cpsmnCmptnAmt : 3190000
/// caPymntRequstDe : "20100428"
/// cmpnstnDscssUpc : 3190000
/// cmpnstnDscssTotAmt : 3190000
/// '등기일x'--수용재결 : "등기일x"
/// dcsUpc : null
/// dcsAmt : null
/// dcsDt : null
/// aceptncUseBeginDe : null
/// ldPymntRequstDe : "20100428"
/// '등기일x' : "등기일x"
/// ldCpsmnPymntLdgmntDivCd : "01"
/// proUpc : null
/// proAmt : null
/// proDt : null
/// proPymntRequstDe : "20100428"
/// proCpsmnPymntLdgmntDivCd : "01"
///

List obstSttusInqireDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = ObstSttusInqireModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

ObstSttusInqireModel obstSttusInqireModelFromJson(String str) => ObstSttusInqireModel.fromJson(json.decode(str));
String obstSttusInqireModelToJson(ObstSttusInqireModel data) => json.encode(data.toJson());
class ObstSttusInqireModel {
  ObstSttusInqireModel({
      this.lgdongNm,
      this.lcrtsDivCd,
      this.lcrtsDivNm,
      this.mlnoLtno,
      this.slnoLtno,
      this.cmpnstnStepDivCd,
      this.cmpnstnStepDivNm,
      this.acqsPrpDivCd,
      this.acqsPrpDivNm,
      this.cmpnstnObstNo,
      this.obstDivCd,
      this.obstDivNm,
      this.cmpnstnThingKndDtls,
      this.obstStrctStndrdInfo,
      this.dtaPrcsSittnCtnt,
      this.cmpnstnQtyAraVu,
      this.cmpnstnThingUnitDivCd,
      this.cmpnstnThingUnitDivMm,
      this.spcitm,
      this.rqestNo,
      this.invstgDe,
      this.accdtInvstgSqnc,
      this.ownerNo,
      this.posesnDivCd,
      this.posesnDivNm,
      this.ownerNm,
      this.ownerRgsbukAddr,
      this.posesnShreNmrtrInfo,
      this.posesnShreDnmntrInfo,
      this.apasmtReqestDivCd,
      this.apasmtReqestDivNm,
      this.apasmtSqnc,
      this.prcPnttmDe,
      this.apasmtInsttNm1,
      this.apasmtInsttEvlUpc1,
      this.apasmtInsttEvamt1,
      this.apasmtInsttNm2,
      this.apasmtInsttEvlUpc2,
      this.apasmtInsttEvamt2,
      this.apasmtInsttNm3,
      this.apasmtInsttEvlUpc3,
      this.apasmtInsttEvamt3,
      this.cmpnstnCmptnUpc,
      this.cpsmnCmptnAmt,
      this.caPymntRequstDe,
      this.cmpnstnDscssUpc,
      this.cmpnstnDscssTotAmt,
      this.dcsUpc,
      this.dcsAmt,
      this.dcsDt,
      this.aceptncUseBeginDe,
      this.ldPymntRequstDe,
      this.ldCpsmnPymntLdgmntDivCd,
      this.ldCpsmnPymntLdgmntDivNm,
      this.proUpc,
      this.proAmt,
      this.proDt,
      this.proPymntRequstDe,
      this.proCpsmnPymntLdgmntDivCd,
      this.proCpsmnPymntLdgmntDivNm,
  });

  ObstSttusInqireModel.fromJson(dynamic json) {
    lgdongNm = json['lgdongNm'];
    lcrtsDivCd = json['lcrtsDivCd'];
    lcrtsDivNm = json['lcrtsDivNm'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    cmpnstnStepDivCd = json['cmpnstnStepDivCd'];
    cmpnstnStepDivNm = json['cmpnstnStepDivNm'];
    acqsPrpDivCd = json['acqsPrpDivCd'];
    acqsPrpDivNm = json['acqsPrpDivNm'];
    cmpnstnObstNo = json['cmpnstnObstNo'].toString();
    obstDivCd = json['obstDivCd'];
    obstDivNm = json['obstDivNm'];
    cmpnstnThingKndDtls = json['cmpnstnThingKndDtls'];
    obstStrctStndrdInfo = json['obstStrctStndrdInfo'];
    dtaPrcsSittnCtnt = json['dtaPrcsSittnCtnt'];
    cmpnstnQtyAraVu = json['cmpnstnQtyAraVu'];
    cmpnstnThingUnitDivCd = json['cmpnstnThingUnitDivCd'];
    cmpnstnThingUnitDivMm = json['cmpnstnThingUnitDivMm'];
    spcitm = json['spcitm'];
    rqestNo = json['rqestNo'];
    invstgDe = json['invstgDe'];
    accdtInvstgSqnc = json['accdtInvstgSqnc'];
    ownerNo = json['ownerNo'];
    posesnDivCd = json['posesnDivCd'];
    posesnDivNm = json['posesnDivNm'];
    ownerNm = json['ownerNm'];
    ownerRgsbukAddr = json['ownerRgsbukAddr'];
    posesnShreNmrtrInfo = json['posesnShreNmrtrInfo'];
    posesnShreDnmntrInfo = json['posesnShreDnmntrInfo'];
    apasmtReqestDivCd = json['apasmtReqestDivCd'];
    apasmtReqestDivNm = json['apasmtReqestDivNm'];
    apasmtSqnc = json['apasmtSqnc'];
    prcPnttmDe = json['prcPnttmDe'];
    apasmtInsttNm1 = json['apasmtInsttNm1'];
    apasmtInsttEvlUpc1 = json['apasmtInsttEvlUpc1'];
    apasmtInsttEvamt1 = json['apasmtInsttEvamt1'];
    apasmtInsttNm2 = json['apasmtInsttNm2'];
    apasmtInsttEvlUpc2 = json['apasmtInsttEvlUpc2'];
    apasmtInsttEvamt2 = json['apasmtInsttEvamt2'];
    apasmtInsttNm3 = json['apasmtInsttNm3'];
    apasmtInsttEvlUpc3 = json['apasmtInsttEvlUpc3'];
    apasmtInsttEvamt3 = json['apasmtInsttEvamt3'];
    cmpnstnCmptnUpc = json['cmpnstnCmptnUpc'];
    cpsmnCmptnAmt = json['cpsmnCmptnAmt'];
    caPymntRequstDe = json['caPymntRequstDe'];
    cmpnstnDscssUpc = json['cmpnstnDscssUpc'];
    cmpnstnDscssTotAmt = json['cmpnstnDscssTotAmt'];
    dcsUpc = json['dcsUpc'];
    dcsAmt = json['dcsAmt'];
    dcsDt = json['dcsDt'];
    aceptncUseBeginDe = json['aceptncUseBeginDe'];
    ldPymntRequstDe = json['ldPymntRequstDe'];
    ldCpsmnPymntLdgmntDivCd = json['ldCpsmnPymntLdgmntDivCd'];
    ldCpsmnPymntLdgmntDivNm = json['ldCpsmnPymntLdgmntDivNm'];
    proUpc = json['proUpc'];
    proAmt = json['proAmt'];
    proDt = json['proDt'];
    proPymntRequstDe = json['proPymntRequstDe'];
    proCpsmnPymntLdgmntDivCd = json['proCpsmnPymntLdgmntDivCd'];
    proCpsmnPymntLdgmntDivNm = json['proCpsmnPymntLdgmntDivNm'];
  }

  String? lgdongNm;
  String? lcrtsDivCd;
  String? lcrtsDivNm;
  String? mlnoLtno;
  String? slnoLtno;
  String? cmpnstnStepDivCd;
  String? cmpnstnStepDivNm;
  String? acqsPrpDivCd;
  String? acqsPrpDivNm;
  String? cmpnstnObstNo;
  String? obstDivCd;
  String? obstDivNm;
  String? cmpnstnThingKndDtls;
  String? obstStrctStndrdInfo;
  dynamic dtaPrcsSittnCtnt;
  num? cmpnstnQtyAraVu;
  String? cmpnstnThingUnitDivCd;
  String? cmpnstnThingUnitDivMm;
  dynamic spcitm;
  String? rqestNo;
  String? invstgDe;
  num? accdtInvstgSqnc;
  String? ownerNo;
  String? posesnDivCd;
  String? posesnDivNm;
  String? ownerNm;
  String? ownerRgsbukAddr;
  String? posesnShreNmrtrInfo;
  String? posesnShreDnmntrInfo;
  String? apasmtReqestDivCd;
  String? apasmtReqestDivNm;
  num? apasmtSqnc;
  String? prcPnttmDe;
  String? apasmtInsttNm1;
  num? apasmtInsttEvlUpc1;
  num? apasmtInsttEvamt1;
  String? apasmtInsttNm2;
  dynamic apasmtInsttEvlUpc2;
  dynamic apasmtInsttEvamt2;
  String? apasmtInsttNm3;
  dynamic apasmtInsttEvlUpc3;
  dynamic apasmtInsttEvamt3;
  num? cmpnstnCmptnUpc;
  num? cpsmnCmptnAmt;
  String? caPymntRequstDe;
  num? cmpnstnDscssUpc;
  num? cmpnstnDscssTotAmt;
  dynamic dcsUpc;
  dynamic dcsAmt;
  dynamic dcsDt;
  dynamic aceptncUseBeginDe;
  String? ldPymntRequstDe;
  String? ldCpsmnPymntLdgmntDivCd;
  String? ldCpsmnPymntLdgmntDivNm;
  dynamic proUpc;
  dynamic proAmt;
  dynamic proDt;
  String? proPymntRequstDe;
  String? proCpsmnPymntLdgmntDivCd;
  String? proCpsmnPymntLdgmntDivNm;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lgdongNm'] = lgdongNm;
    map['lcrtsDivCd'] = lcrtsDivCd;
    map['lcrtsDivNm'] = lcrtsDivNm;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['cmpnstnStepDivCd'] = cmpnstnStepDivCd;
    map['acqsPrpDivCd'] = acqsPrpDivCd;
    map['acqsPrpDivNm'] = acqsPrpDivNm;
    map['cmpnstnObstNo'] = cmpnstnObstNo;
    map['obstDivCd'] = obstDivCd;
    map['obstDivNm'] = obstDivNm;
    map['cmpnstnThingKndDtls'] = cmpnstnThingKndDtls;
    map['obstStrctStndrdInfo'] = obstStrctStndrdInfo;
    map['dtaPrcsSittnCtnt'] = dtaPrcsSittnCtnt;
    map['cmpnstnQtyAraVu'] = cmpnstnQtyAraVu;
    map['cmpnstnThingUnitDivCd'] = cmpnstnThingUnitDivCd;
    map['cmpnstnThingUnitDivMm'] = cmpnstnThingUnitDivMm;
    map['spcitm'] = spcitm;
    map['rqestNo'] = rqestNo;
    map['invstgDe'] = invstgDe;
    map['accdtInvstgSqnc'] = accdtInvstgSqnc;
    map['ownerNo'] = ownerNo;
    map['posesnDivCd'] = posesnDivCd;
    map['posesnDivNm'] = posesnDivNm;
    map['ownerNm'] = ownerNm;
    map['ownerRgsbukAddr'] = ownerRgsbukAddr;
    map['posesnShreNmrtrInfo'] = posesnShreNmrtrInfo;
    map['posesnShreDnmntrInfo'] = posesnShreDnmntrInfo;
    map['apasmtReqestDivCd'] = apasmtReqestDivCd;
    map['apasmtReqestDivNm'] = apasmtReqestDivNm;
    map['apasmtSqnc'] = apasmtSqnc;
    map['prcPnttmDe'] = prcPnttmDe;
    map['apasmtInsttNm1'] = apasmtInsttNm1;
    map['apasmtInsttEvlUpc1'] = apasmtInsttEvlUpc1;
    map['apasmtInsttEvamt1'] = apasmtInsttEvamt1;
    map['apasmtInsttNm2'] = apasmtInsttNm2;
    map['apasmtInsttEvlUpc2'] = apasmtInsttEvlUpc2;
    map['apasmtInsttEvamt2'] = apasmtInsttEvamt2;
    map['apasmtInsttNm3'] = apasmtInsttNm3;
    map['apasmtInsttEvlUpc3'] = apasmtInsttEvlUpc3;
    map['apasmtInsttEvamt3'] = apasmtInsttEvamt3;
    map['cmpnstnCmptnUpc'] = cmpnstnCmptnUpc;
    map['cpsmnCmptnAmt'] = cpsmnCmptnAmt;
    map['caPymntRequstDe'] = caPymntRequstDe;
    map['cmpnstnDscssUpc'] = cmpnstnDscssUpc;
    map['cmpnstnDscssTotAmt'] = cmpnstnDscssTotAmt;
    map['dcsUpc'] = dcsUpc;
    map['dcsAmt'] = dcsAmt;
    map['dcsDt'] = dcsDt;
    map['aceptncUseBeginDe'] = aceptncUseBeginDe;
    map['ldPymntRequstDe'] = ldPymntRequstDe;
    map['ldCpsmnPymntLdgmntDivCd'] = ldCpsmnPymntLdgmntDivCd;
    map['ldCpsmnPymntLdgmntDivNm'] = ldCpsmnPymntLdgmntDivNm;
    map['proUpc'] = proUpc;
    map['proAmt'] = proAmt;
    map['proDt'] = proDt;
    map['proPymntRequstDe'] = proPymntRequstDe;
    map['proCpsmnPymntLdgmntDivCd'] = proCpsmnPymntLdgmntDivCd;
    map['proCpsmnPymntLdgmntDivNm'] = proCpsmnPymntLdgmntDivNm;
    return map;
  }

}