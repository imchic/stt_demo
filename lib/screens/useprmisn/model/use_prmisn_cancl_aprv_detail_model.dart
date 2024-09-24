import 'dart:convert';
/// plotUseNo : "202302581"
/// ladSeq : 66266
/// rqstSeq : 1
/// usePrmisnYn : "Y"
/// prmisnRqstAra : 100
/// useAprvAra : 100
/// rqstUsePrpPrmisnTyDtls : null
/// rntfeeCmpnsFreeDivCd : "02"
/// oflndvalDivCd : null
/// oflndvalAmt : null
/// rntfeeRtInfo : null
/// useStrtDe : "20230320"
/// useEndDe : "20271231"
/// usePrmisnPurpsLclsCd : "2000"
/// usePrmisnPurpsMclsCd : "2600"
/// usePrmisnPurpsSclsCd : "2603"
/// rntfeeCmptnComptYn : "N"
/// rntfeeNpyYn : "N"
/// srcwtsupPznYn : "N"
/// evrfrndYn : "N"
/// ocpatUseDscssDivCd : null
/// prmisnTyCd : "D05"
/// usePrmisnKndDtlDtls : null
/// prmisnThingPrpDivCd : null
/// ocpatPdInfo : null
/// usePurpsDtlDtls : null
/// prmisnRqstRm : null
/// freeLgsltArtclNo : null
/// frstRgstrId : "20202669"
/// frstRegistDt : "20230223"
/// lastUpdusrId : "20202669"
/// lastUpdtDt : "20230320"
/// conectIp : "172.20.3.116"
/// locNm : "경상북도 청송군 안덕면 성재리"
/// lgdongCd : "4775035044"
/// lcrtsDivCd : "2"
/// mlnoLtno : "88"
/// slnoLtno : "2"
/// ofcbkLndcgrDivCd : "15"
/// ofcbkAra : 117
/// natpblndLdgrNo : "18000873A1816182635"
List usePrmisnCanclAprvDetailDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = UsePrmisnCanclAprvDetailModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

UsePrmisnCanclAprvDetailModel usePrmisnCanclAprvDetailModelFromJson(String str) => UsePrmisnCanclAprvDetailModel.fromJson(json.decode(str));
String usePrmisnCanclAprvDetailModelToJson(UsePrmisnCanclAprvDetailModel data) => json.encode(data.toJson());
class UsePrmisnCanclAprvDetailModel {
  UsePrmisnCanclAprvDetailModel({
      this.plotUseNo, 
      this.ladSeq, 
      this.rqstSeq, 
      this.usePrmisnYn, 
      this.prmisnRqstAra, 
      this.useAprvAra, 
      this.rqstUsePrpPrmisnTyDtls, 
      this.rntfeeCmpnsFreeDivCd, 
      this.oflndvalDivCd, 
      this.oflndvalAmt, 
      this.rntfeeRtInfo, 
      this.useStrtDe, 
      this.useEndDe, 
      this.usePrmisnPurpsLclsCd, 
      this.usePrmisnPurpsMclsCd, 
      this.usePrmisnPurpsSclsCd, 
      this.rntfeeCmptnComptYn, 
      this.rntfeeNpyYn, 
      this.srcwtsupPznYn, 
      this.evrfrndYn, 
      this.ocpatUseDscssDivCd, 
      this.prmisnTyCd, 
      this.usePrmisnKndDtlDtls, 
      this.prmisnThingPrpDivCd, 
      this.ocpatPdInfo, 
      this.usePurpsDtlDtls, 
      this.prmisnRqstRm, 
      this.freeLgsltArtclNo, 
      this.frstRgstrId, 
      this.frstRegistDt, 
      this.lastUpdusrId, 
      this.lastUpdtDt, 
      this.conectIp, 
      this.locNm, 
      this.lgdongCd, 
      this.lcrtsDivCd, 
      this.mlnoLtno, 
      this.slnoLtno, 
      this.ofcbkLndcgrDivCd, 
      this.ofcbkAra, 
      this.natpblndLdgrNo,});

  UsePrmisnCanclAprvDetailModel.fromJson(dynamic json) {
    plotUseNo = json['plotUseNo'];
    ladSeq = json['ladSeq'];
    rqstSeq = json['rqstSeq'];
    usePrmisnYn = json['usePrmisnYn'];
    prmisnRqstAra = json['prmisnRqstAra'];
    useAprvAra = json['useAprvAra'];
    rqstUsePrpPrmisnTyDtls = json['rqstUsePrpPrmisnTyDtls'];
    rntfeeCmpnsFreeDivCd = json['rntfeeCmpnsFreeDivCd'];
    oflndvalDivCd = json['oflndvalDivCd'];
    oflndvalAmt = json['oflndvalAmt'];
    rntfeeRtInfo = json['rntfeeRtInfo'];
    useStrtDe = json['useStrtDe'];
    useEndDe = json['useEndDe'];
    usePrmisnPurpsLclsCd = json['usePrmisnPurpsLclsCd'];
    usePrmisnPurpsMclsCd = json['usePrmisnPurpsMclsCd'];
    usePrmisnPurpsSclsCd = json['usePrmisnPurpsSclsCd'];
    rntfeeCmptnComptYn = json['rntfeeCmptnComptYn'];
    rntfeeNpyYn = json['rntfeeNpyYn'];
    srcwtsupPznYn = json['srcwtsupPznYn'];
    evrfrndYn = json['evrfrndYn'];
    ocpatUseDscssDivCd = json['ocpatUseDscssDivCd'];
    prmisnTyCd = json['prmisnTyCd'];
    usePrmisnKndDtlDtls = json['usePrmisnKndDtlDtls'];
    prmisnThingPrpDivCd = json['prmisnThingPrpDivCd'];
    ocpatPdInfo = json['ocpatPdInfo'];
    usePurpsDtlDtls = json['usePurpsDtlDtls'];
    prmisnRqstRm = json['prmisnRqstRm'];
    freeLgsltArtclNo = json['freeLgsltArtclNo'];
    frstRgstrId = json['frstRgstrId'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdusrId = json['lastUpdusrId'];
    lastUpdtDt = json['lastUpdtDt'];
    conectIp = json['conectIp'];
    locNm = json['locNm'];
    lgdongCd = json['lgdongCd'];
    lcrtsDivCd = json['lcrtsDivCd'];
    mlnoLtno = json['mlnoLtno'];
    slnoLtno = json['slnoLtno'];
    ofcbkLndcgrDivCd = json['ofcbkLndcgrDivCd'];
    ofcbkAra = json['ofcbkAra'];
    natpblndLdgrNo = json['natpblndLdgrNo'];
  }
  String? plotUseNo;
  num? ladSeq;
  num? rqstSeq;
  String? usePrmisnYn;
  num? prmisnRqstAra;
  num? useAprvAra;
  dynamic rqstUsePrpPrmisnTyDtls;
  String? rntfeeCmpnsFreeDivCd;
  dynamic oflndvalDivCd;
  dynamic oflndvalAmt;
  dynamic rntfeeRtInfo;
  String? useStrtDe;
  String? useEndDe;
  String? usePrmisnPurpsLclsCd;
  String? usePrmisnPurpsMclsCd;
  String? usePrmisnPurpsSclsCd;
  String? rntfeeCmptnComptYn;
  String? rntfeeNpyYn;
  String? srcwtsupPznYn;
  String? evrfrndYn;
  dynamic ocpatUseDscssDivCd;
  String? prmisnTyCd;
  dynamic usePrmisnKndDtlDtls;
  dynamic prmisnThingPrpDivCd;
  dynamic ocpatPdInfo;
  dynamic usePurpsDtlDtls;
  dynamic prmisnRqstRm;
  dynamic freeLgsltArtclNo;
  String? frstRgstrId;
  String? frstRegistDt;
  String? lastUpdusrId;
  String? lastUpdtDt;
  String? conectIp;
  String? locNm;
  String? lgdongCd;
  String? lcrtsDivCd;
  String? mlnoLtno;
  String? slnoLtno;
  String? ofcbkLndcgrDivCd;
  num? ofcbkAra;
  String? natpblndLdgrNo;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['plotUseNo'] = plotUseNo;
    map['ladSeq'] = ladSeq;
    map['rqstSeq'] = rqstSeq;
    map['usePrmisnYn'] = usePrmisnYn;
    map['prmisnRqstAra'] = prmisnRqstAra;
    map['useAprvAra'] = useAprvAra;
    map['rqstUsePrpPrmisnTyDtls'] = rqstUsePrpPrmisnTyDtls;
    map['rntfeeCmpnsFreeDivCd'] = rntfeeCmpnsFreeDivCd;
    map['oflndvalDivCd'] = oflndvalDivCd;
    map['oflndvalAmt'] = oflndvalAmt;
    map['rntfeeRtInfo'] = rntfeeRtInfo;
    map['useStrtDe'] = useStrtDe;
    map['useEndDe'] = useEndDe;
    map['usePrmisnPurpsLclsCd'] = usePrmisnPurpsLclsCd;
    map['usePrmisnPurpsMclsCd'] = usePrmisnPurpsMclsCd;
    map['usePrmisnPurpsSclsCd'] = usePrmisnPurpsSclsCd;
    map['rntfeeCmptnComptYn'] = rntfeeCmptnComptYn;
    map['rntfeeNpyYn'] = rntfeeNpyYn;
    map['srcwtsupPznYn'] = srcwtsupPznYn;
    map['evrfrndYn'] = evrfrndYn;
    map['ocpatUseDscssDivCd'] = ocpatUseDscssDivCd;
    map['prmisnTyCd'] = prmisnTyCd;
    map['usePrmisnKndDtlDtls'] = usePrmisnKndDtlDtls;
    map['prmisnThingPrpDivCd'] = prmisnThingPrpDivCd;
    map['ocpatPdInfo'] = ocpatPdInfo;
    map['usePurpsDtlDtls'] = usePurpsDtlDtls;
    map['prmisnRqstRm'] = prmisnRqstRm;
    map['freeLgsltArtclNo'] = freeLgsltArtclNo;
    map['frstRgstrId'] = frstRgstrId;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrId'] = lastUpdusrId;
    map['lastUpdtDt'] = lastUpdtDt;
    map['conectIp'] = conectIp;
    map['locNm'] = locNm;
    map['lgdongCd'] = lgdongCd;
    map['lcrtsDivCd'] = lcrtsDivCd;
    map['mlnoLtno'] = mlnoLtno;
    map['slnoLtno'] = slnoLtno;
    map['ofcbkLndcgrDivCd'] = ofcbkLndcgrDivCd;
    map['ofcbkAra'] = ofcbkAra;
    map['natpblndLdgrNo'] = natpblndLdgrNo;
    return map;
  }

}