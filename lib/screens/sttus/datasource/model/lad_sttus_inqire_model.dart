import 'dart:convert';
/// lgdongNm : "세종특별자치시  소정면 대곡리"
/// lcrtsDivCd : "1"
/// lcrtsDivNm : "일반"
/// mlnoLtno : "80"
/// slnoLtno : "1"
/// ofcbkLndcgrDivCd : "01"
/// ofcbkLndcgrDivNm : "전"
/// sttusLndcgrDivCd : "01"
/// sttusLndcgrDivNm : "전"
/// cmpnstnStepDivCd : "49"
/// cmpnstnStepDivNm : "보상비지급"
/// acqsPrpDivCd : "S03"
/// acqsPrpDivNm : "도수관로"
/// ofcbkAra : 1977
/// incrprAra : 206
/// rqestNo : "315"
/// aceptncUseDivCd : "02"
/// aceptncUseDivNm : "사용"
/// invstgDt : "20140301"
/// accdtInvstgSqnc : 1
/// ownerNo : "1000083320"
/// posesnDivCd : "03"
/// posesnDivNm : "사유"
/// ownerNm : "김홍남"
/// ownerRgsbukAddr : "충청남도 천안시 동남구 다가말2길 87-1, (다가동)"
/// posesnShreNmrtrInfo : "1"
/// posesnShreDnmntrInfo : "1"
/// apasmtReqestDivCd : "01"
/// apasmtReqestDivNm : "평가"
/// apasmtSqnc : 8
/// prcPnttmDe : "20140815"
/// apasmtInsttNm1 : "0005400005"
/// apasmtInsttEvlUpc1 : 2300
/// apasmtInsttEvamt1 : 473800
/// apasmtInsttNm2 : "0001000007"
/// apasmtInsttEvlUpc2 : 2300
/// apasmtInsttEvamt2 : 473800
/// apasmtInsttNm3 : null
/// apasmtInsttEvlUpc3 : null
/// apasmtInsttEvamt3 : null
/// cmpnstnCmptnUpc : 2300
/// cpsmnCmptnAmt : 473800
/// caPymntRequstDe : "20140905"
/// cmpnstnDscssUpc : 2300
/// cmpnstnDscssTotAmt : 473800
/// caRgistDt : "20140905"
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

LadSttusInqireModel LadSttusInqireModelFromJson(String str) => LadSttusInqireModel.fromJson(json.decode(str));
String LadSttusInqireModelToJson(LadSttusInqireModel data) => json.encode(data.toJson());
class LadSttusInqireModel {
  LadSttusInqireModel({
      this.lgdongNm, 
      this.lcrtsDivCd, 
      this.lcrtsDivNm, 
      this.mlnoLtno, 
      this.slnoLtno, 
      this.ofcbkLndcgrDivCd, 
      this.ofcbkLndcgrDivNm, 
      this.sttusLndcgrDivCd, 
      this.sttusLndcgrDivNm, 
      this.cmpnstnStepDivCd, 
      this.cmpnstnStepDivNm, 
      this.acqsPrpDivCd, 
      this.acqsPrpDivNm, 
      this.ofcbkAra, 
      this.incrprAra, 
      this.rqestNo, 
      this.aceptncUseDivCd, 
      this.aceptncUseDivNm, 
      this.invstgDt, 
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
    lcrtsDivNm = json['lcrtsDivNm'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    ofcbkLndcgrDivCd = json['ofcbkLndcgrDivCd'];
    ofcbkLndcgrDivNm = json['ofcbkLndcgrDivNm'];
    sttusLndcgrDivCd = json['sttusLndcgrDivCd'];
    sttusLndcgrDivNm = json['sttusLndcgrDivNm'];
    cmpnstnStepDivCd = json['cmpnstnStepDivCd'];
    cmpnstnStepDivNm = json['cmpnstnStepDivNm'];
    acqsPrpDivCd = json['acqsPrpDivCd'];
    acqsPrpDivNm = json['acqsPrpDivNm'];
    ofcbkAra = json['ofcbkAra'];
    incrprAra = json['incrprAra'];
    rqestNo = json['rqestNo'];
    aceptncUseDivCd = json['aceptncUseDivCd'];
    aceptncUseDivNm = json['aceptncUseDivNm'];
    invstgDt = json['invstgDt'];
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
  String? lcrtsDivNm;
  String? mlnoLtno;
  String? slnoLtno;
  String? ofcbkLndcgrDivCd;
  String? ofcbkLndcgrDivNm;
  String? sttusLndcgrDivCd;
  String? sttusLndcgrDivNm;
  String? cmpnstnStepDivCd;
  String? cmpnstnStepDivNm;
  String? acqsPrpDivCd;
  String? acqsPrpDivNm;
  num? ofcbkAra;
  num? incrprAra;
  String? rqestNo;
  String? aceptncUseDivCd;
  String? aceptncUseDivNm;
  String? invstgDt;
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
  num? apasmtInsttEvlUpc2;
  num? apasmtInsttEvamt2;
  dynamic apasmtInsttNm3;
  dynamic apasmtInsttEvlUpc3;
  dynamic apasmtInsttEvamt3;
  num? cmpnstnCmptnUpc;
  num? cpsmnCmptnAmt;
  String? caPymntRequstDe;
  num? cmpnstnDscssUpc;
  num? cmpnstnDscssTotAmt;
  String? caRgistDt;
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
    map['lcrtsDivNm'] = lcrtsDivNm;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['ofcbkLndcgrDivCd'] = ofcbkLndcgrDivCd;
    map['ofcbkLndcgrDivNm'] = ofcbkLndcgrDivNm;
    map['sttusLndcgrDivCd'] = sttusLndcgrDivCd;
    map['sttusLndcgrDivNm'] = sttusLndcgrDivNm;
    map['cmpnstnStepDivCd'] = cmpnstnStepDivCd;
    map['cmpnstnStepDivNm'] = cmpnstnStepDivNm;
    map['acqsPrpDivCd'] = acqsPrpDivCd;
    map['acqsPrpDivNm'] = acqsPrpDivNm;
    map['ofcbkAra'] = ofcbkAra;
    map['incrprAra'] = incrprAra;
    map['rqestNo'] = rqestNo;
    map['aceptncUseDivCd'] = aceptncUseDivCd;
    map['aceptncUseDivNm'] = aceptncUseDivNm;
    map['invstgDt'] = invstgDt;
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