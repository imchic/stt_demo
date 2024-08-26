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

ObstSttusInqireModel obstSttusInqireModelFromJson(String str) => ObstSttusInqireModel.fromJson(json.decode(str));
String obstSttusInqireModelToJson(ObstSttusInqireModel data) => json.encode(data.toJson());
class ObstSttusInqireModel {
  ObstSttusInqireModel({
      this.lgdongNm,
      this.lcrtsDivCd,
      this.mlnoLtno,
      this.slnoLtno,
      this.cmpnstnStepDivCd,
      this.acqsPrpDivCd,
      this.rqestNo,
      this.invstgDe,
      this.accdtInvstgSqnc,
      this.ownerNo,
      this.posesnDivCd,
      this.ownerNm,
      this.ownerRgsbukAddr,
      this.posesnShreNmrtrInfo,
      this.posesnShreDnmntrInfo,
      this.apasmtReqestDivCd,
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
      this.proUpc,
      this.proAmt,
      this.proDt,
      this.proPymntRequstDe,
      this.proCpsmnPymntLdgmntDivCd,});

  ObstSttusInqireModel.fromJson(dynamic json) {
    lgdongNm = json['lgdongNm'];
    lcrtsDivCd = json['lcrtsDivCd'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    cmpnstnStepDivCd = json['cmpnstnStepDivCd'];
    acqsPrpDivCd = json['acqsPrpDivCd'];
    rqestNo = json['rqestNo'];
    invstgDe = json['invstgDe'];
    accdtInvstgSqnc = json['accdtInvstgSqnc'];
    ownerNo = json['ownerNo'];
    posesnDivCd = json['posesnDivCd'];
    ownerNm = json['ownerNm'];
    ownerRgsbukAddr = json['ownerRgsbukAddr'];
    posesnShreNmrtrInfo = json['posesnShreNmrtrInfo'];
    posesnShreDnmntrInfo = json['posesnShreDnmntrInfo'];
    apasmtReqestDivCd = json['apasmtReqestDivCd'];
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
    proUpc = json['proUpc'];
    proAmt = json['proAmt'];
    proDt = json['proDt'];
    proPymntRequstDe = json['proPymntRequstDe'];
    proCpsmnPymntLdgmntDivCd = json['proCpsmnPymntLdgmntDivCd'];
  }
  String? lgdongNm;
  String? lcrtsDivCd;
  String? mlnoLtno;
  String? slnoLtno;
  String? cmpnstnStepDivCd;
  String? acqsPrpDivCd;
  String? rqestNo;
  String? invstgDe;
  num? accdtInvstgSqnc;
  String? ownerNo;
  String? posesnDivCd;
  String? ownerNm;
  String? ownerRgsbukAddr;
  String? posesnShreNmrtrInfo;
  String? posesnShreDnmntrInfo;
  String? apasmtReqestDivCd;
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
  dynamic proUpc;
  dynamic proAmt;
  dynamic proDt;
  String? proPymntRequstDe;
  String? proCpsmnPymntLdgmntDivCd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lgdongNm'] = lgdongNm;
    map['lcrtsDivCd'] = lcrtsDivCd;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['cmpnstnStepDivCd'] = cmpnstnStepDivCd;
    map['acqsPrpDivCd'] = acqsPrpDivCd;
    map['rqestNo'] = rqestNo;
    map['invstgDe'] = invstgDe;
    map['accdtInvstgSqnc'] = accdtInvstgSqnc;
    map['ownerNo'] = ownerNo;
    map['posesnDivCd'] = posesnDivCd;
    map['ownerNm'] = ownerNm;
    map['ownerRgsbukAddr'] = ownerRgsbukAddr;
    map['posesnShreNmrtrInfo'] = posesnShreNmrtrInfo;
    map['posesnShreDnmntrInfo'] = posesnShreDnmntrInfo;
    map['apasmtReqestDivCd'] = apasmtReqestDivCd;
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
    map['proUpc'] = proUpc;
    map['proAmt'] = proAmt;
    map['proDt'] = proDt;
    map['proPymntRequstDe'] = proPymntRequstDe;
    map['proCpsmnPymntLdgmntDivCd'] = proCpsmnPymntLdgmntDivCd;
    return map;
  }

}