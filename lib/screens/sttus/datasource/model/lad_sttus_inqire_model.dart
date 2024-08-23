import 'dart:convert';
/// lgdongNm : "충청북도 충주시 종민동"
/// lcrtsDivCd : "1"
/// mlnoLtno : "647"
/// slnoLtno : "0"
/// ofcbkLndcgrDivCd : "16"
/// sttusLndcgrDivCd : "16"
/// cmpnstnStepDivCd : "29"
/// acqsPrpDivCd : "D18"
/// ofcbkAra : 1349
/// incrprAra : 144
/// rqestNo : "0"
/// aceptncUseDivCd : null
/// invstgDt : "20150311"
/// accdtInvstgSqnc : 1
/// ownerNo : "1000053978"
/// posesnDivCd : "01"
/// ownerNm : "국토교통부"
/// ownerRgsbukAddr : "!"
/// posesnShreNmrtrInfo : "1"
/// posesnShreDnmntrInfo : "1"
/// apasmtReqestDivCd : "01"
/// apasmtSqnc : 1
/// prcPnttmDe : null
/// apasmtInsttNm1 : "1001"
/// apasmtInsttEvlUpc1 : null
/// apasmtInsttEvamt1 : null
/// apasmtInsttNm2 : "1002"
/// apasmtInsttEvlUpc2 : null
/// apasmtInsttEvamt2 : null
/// apasmtInsttNm3 : "1003"
/// apasmtInsttEvlUpc3 : null
/// apasmtInsttEvamt3 : null
/// cmpnstnCmptnUpc : null
/// cpsmnCmptnAmt : null
/// caPymntRequstDe : null
/// cmpnstnDscssUpc : null
/// cmpnstnDscssTotAmt : null
/// caRgistDt : null
/// aceptncAdjdcUpc : null
/// aceptncAdjdcAmt : null
/// aceptncAdjdcDt : null
/// aceptncUseBeginDe : null
/// ldPymntRequstDe : null
/// ldRgistDt : null
/// ldCpsmnPymntLdgmntDivCd : null
/// obadUpc : null
/// objcRstAmt : null
/// objcAdjdcDt : null
/// proPymntRequstDe : null
/// proCpsmnPymntLdgmntDivCd : null

LadSttusInqireModel ladSttusInqireModelFromJson(String str) => LadSttusInqireModel.fromJson(json.decode(str));
String ladSttusInqireModelToJson(LadSttusInqireModel data) => json.encode(data.toJson());
class LadSttusInqireModel {
  LadSttusInqireModel({
      this.lgdongNm, 
      this.lcrtsDivCd, 
      this.mlnoLtno, 
      this.slnoLtno, 
      this.ofcbkLndcgrDivCd, 
      this.sttusLndcgrDivCd, 
      this.cmpnstnStepDivCd, 
      this.acqsPrpDivCd, 
      this.ofcbkAra, 
      this.incrprAra, 
      this.rqestNo, 
      this.aceptncUseDivCd, 
      this.invstgDt, 
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
      this.caRgistDt, 
      this.aceptncAdjdcUpc, 
      this.aceptncAdjdcAmt, 
      this.aceptncAdjdcDt, 
      this.aceptncUseBeginDe, 
      this.ldPymntRequstDe, 
      this.ldRgistDt, 
      this.ldCpsmnPymntLdgmntDivCd, 
      this.obadUpc, 
      this.objcRstAmt, 
      this.objcAdjdcDt, 
      this.proPymntRequstDe, 
      this.proCpsmnPymntLdgmntDivCd,});

  LadSttusInqireModel.fromJson(dynamic json) {
    lgdongNm = json['lgdongNm'];
    lcrtsDivCd = json['lcrtsDivCd'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    ofcbkLndcgrDivCd = json['ofcbkLndcgrDivCd'];
    sttusLndcgrDivCd = json['sttusLndcgrDivCd'];
    cmpnstnStepDivCd = json['cmpnstnStepDivCd'];
    acqsPrpDivCd = json['acqsPrpDivCd'];
    ofcbkAra = json['ofcbkAra'];
    incrprAra = json['incrprAra'];
    rqestNo = json['rqestNo'];
    aceptncUseDivCd = json['aceptncUseDivCd'];
    invstgDt = json['invstgDt'];
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
    caRgistDt = json['caRgistDt'];
    aceptncAdjdcUpc = json['aceptncAdjdcUpc'];
    aceptncAdjdcAmt = json['aceptncAdjdcAmt'];
    aceptncAdjdcDt = json['aceptncAdjdcDt'];
    aceptncUseBeginDe = json['aceptncUseBeginDe'];
    ldPymntRequstDe = json['ldPymntRequstDe'];
    ldRgistDt = json['ldRgistDt'];
    ldCpsmnPymntLdgmntDivCd = json['ldCpsmnPymntLdgmntDivCd'];
    obadUpc = json['obadUpc'];
    objcRstAmt = json['objcRstAmt'];
    objcAdjdcDt = json['objcAdjdcDt'];
    proPymntRequstDe = json['proPymntRequstDe'];
    proCpsmnPymntLdgmntDivCd = json['proCpsmnPymntLdgmntDivCd'];
  }
  String? lgdongNm;
  String? lcrtsDivCd;
  String? mlnoLtno;
  String? slnoLtno;
  String? ofcbkLndcgrDivCd;
  String? sttusLndcgrDivCd;
  String? cmpnstnStepDivCd;
  String? acqsPrpDivCd;
  num? ofcbkAra;
  num? incrprAra;
  String? rqestNo;
  dynamic aceptncUseDivCd;
  String? invstgDt;
  num? accdtInvstgSqnc;
  String? ownerNo;
  String? posesnDivCd;
  String? ownerNm;
  String? ownerRgsbukAddr;
  String? posesnShreNmrtrInfo;
  String? posesnShreDnmntrInfo;
  String? apasmtReqestDivCd;
  num? apasmtSqnc;
  dynamic prcPnttmDe;
  String? apasmtInsttNm1;
  dynamic apasmtInsttEvlUpc1;
  dynamic apasmtInsttEvamt1;
  String? apasmtInsttNm2;
  dynamic apasmtInsttEvlUpc2;
  dynamic apasmtInsttEvamt2;
  String? apasmtInsttNm3;
  dynamic apasmtInsttEvlUpc3;
  dynamic apasmtInsttEvamt3;
  dynamic cmpnstnCmptnUpc;
  dynamic cpsmnCmptnAmt;
  dynamic caPymntRequstDe;
  dynamic cmpnstnDscssUpc;
  dynamic cmpnstnDscssTotAmt;
  dynamic caRgistDt;
  dynamic aceptncAdjdcUpc;
  dynamic aceptncAdjdcAmt;
  dynamic aceptncAdjdcDt;
  dynamic aceptncUseBeginDe;
  dynamic ldPymntRequstDe;
  dynamic ldRgistDt;
  dynamic ldCpsmnPymntLdgmntDivCd;
  dynamic obadUpc;
  dynamic objcRstAmt;
  dynamic objcAdjdcDt;
  dynamic proPymntRequstDe;
  dynamic proCpsmnPymntLdgmntDivCd;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lgdongNm'] = lgdongNm;
    map['lcrtsDivCd'] = lcrtsDivCd;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['ofcbkLndcgrDivCd'] = ofcbkLndcgrDivCd;
    map['sttusLndcgrDivCd'] = sttusLndcgrDivCd;
    map['cmpnstnStepDivCd'] = cmpnstnStepDivCd;
    map['acqsPrpDivCd'] = acqsPrpDivCd;
    map['ofcbkAra'] = ofcbkAra;
    map['incrprAra'] = incrprAra;
    map['rqestNo'] = rqestNo;
    map['aceptncUseDivCd'] = aceptncUseDivCd;
    map['invstgDt'] = invstgDt;
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
    map['caRgistDt'] = caRgistDt;
    map['aceptncAdjdcUpc'] = aceptncAdjdcUpc;
    map['aceptncAdjdcAmt'] = aceptncAdjdcAmt;
    map['aceptncAdjdcDt'] = aceptncAdjdcDt;
    map['aceptncUseBeginDe'] = aceptncUseBeginDe;
    map['ldPymntRequstDe'] = ldPymntRequstDe;
    map['ldRgistDt'] = ldRgistDt;
    map['ldCpsmnPymntLdgmntDivCd'] = ldCpsmnPymntLdgmntDivCd;
    map['obadUpc'] = obadUpc;
    map['objcRstAmt'] = objcRstAmt;
    map['objcAdjdcDt'] = objcAdjdcDt;
    map['proPymntRequstDe'] = proPymntRequstDe;
    map['proCpsmnPymntLdgmntDivCd'] = proCpsmnPymntLdgmntDivCd;
    return map;
  }

}