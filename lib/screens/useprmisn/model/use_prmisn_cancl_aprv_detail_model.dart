import 'dart:convert';
/// plotUseNo : "202302582"
/// ladSeq : 66266
/// rqstSeq : 1
/// usePrmisnYn : "Y"
/// prmisnRqstAra : 100
/// useAprvAra : 100
/// rqstUsePrpPrmisnTyDtls : null
/// rntfeeCmpnsFreeDivCd : "02"
/// rntfeeCmpnsFreeDivNm : "무상"
/// oflndvalDivCd : null
/// oflndvalDivNm : null
/// oflndvalAmt : null
/// rntfeeRtInfo : null
/// useStrtDe : "20230224"
/// useEndDe : "20271231"
/// usePrmisnPurpsLclsCd : "1000"
/// usePrmisnPurpsLclsNm : "토지사용"
/// usePrmisnPurpsMclsCd : "1300"
/// usePrmisnPurpsMclsNm : "주차장"
/// usePrmisnPurpsSclsCd : "1301"
/// usePrmisnPurpsSclsNm : "임시주차장"
/// rntfeeCmptnComptYn : "N"
/// rntfeeNpyYn : "N"
/// srcwtsupPznYn : "N"
/// evrfrndYn : "N"
/// ocpatUseDscssDivCd : null
/// ocpatUseDscssDivNm : null
/// prmisnTyCd : "D04"
/// prmisnTyNm : "공공및공익사업용"
/// usePrmisnKndDtlDtls : null
/// prmisnThingPrpDivCd : null
/// prmisnThingPrpDivNm : null
/// ocpatPdInfo : null
/// usePurpsDtlDtls : null
/// prmisnRqstRm : null
/// freeLgsltArtclNo : null
/// frstRgstrId : "20202669"
/// frstRegistDt : "20230223"
/// lastUpdusrId : "20202669"
/// lastUpdtDt : "20230223"
/// conectIp : "172.20.3.116"
/// locNm : "경상북도 청송군 안덕면 성재리"
/// lgdongCd : "4775035044"
/// lcrtsDivCd : "2"
/// mlnoLtno : "88"
/// slnoLtno : "2"
/// ofcbkLndcgrDivCd : "15"
/// ofcbkLndcgrDivNm : "구거"
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
      this.rntfeeCmpnsFreeDivNm, 
      this.oflndvalDivCd, 
      this.oflndvalDivNm, 
      this.oflndvalAmt, 
      this.rntfeeRtInfo, 
      this.useStrtDe, 
      this.useEndDe, 
      this.usePrmisnPurpsLclsCd, 
      this.usePrmisnPurpsLclsNm, 
      this.usePrmisnPurpsMclsCd, 
      this.usePrmisnPurpsMclsNm, 
      this.usePrmisnPurpsSclsCd, 
      this.usePrmisnPurpsSclsNm, 
      this.rntfeeCmptnComptYn, 
      this.rntfeeNpyYn, 
      this.srcwtsupPznYn, 
      this.evrfrndYn, 
      this.ocpatUseDscssDivCd, 
      this.ocpatUseDscssDivNm, 
      this.prmisnTyCd, 
      this.prmisnTyNm, 
      this.usePrmisnKndDtlDtls, 
      this.prmisnThingPrpDivCd, 
      this.prmisnThingPrpDivNm, 
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
      this.ofcbkLndcgrDivNm, 
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
    rntfeeCmpnsFreeDivNm = json['rntfeeCmpnsFreeDivNm'];
    oflndvalDivCd = json['oflndvalDivCd'];
    oflndvalDivNm = json['oflndvalDivNm'];
    oflndvalAmt = json['oflndvalAmt'];
    rntfeeRtInfo = json['rntfeeRtInfo'];
    useStrtDe = json['useStrtDe'];
    useEndDe = json['useEndDe'];
    usePrmisnPurpsLclsCd = json['usePrmisnPurpsLclsCd'];
    usePrmisnPurpsLclsNm = json['usePrmisnPurpsLclsNm'];
    usePrmisnPurpsMclsCd = json['usePrmisnPurpsMclsCd'];
    usePrmisnPurpsMclsNm = json['usePrmisnPurpsMclsNm'];
    usePrmisnPurpsSclsCd = json['usePrmisnPurpsSclsCd'];
    usePrmisnPurpsSclsNm = json['usePrmisnPurpsSclsNm'];
    rntfeeCmptnComptYn = json['rntfeeCmptnComptYn'];
    rntfeeNpyYn = json['rntfeeNpyYn'];
    srcwtsupPznYn = json['srcwtsupPznYn'];
    evrfrndYn = json['evrfrndYn'];
    ocpatUseDscssDivCd = json['ocpatUseDscssDivCd'];
    ocpatUseDscssDivNm = json['ocpatUseDscssDivNm'];
    prmisnTyCd = json['prmisnTyCd'];
    prmisnTyNm = json['prmisnTyNm'];
    usePrmisnKndDtlDtls = json['usePrmisnKndDtlDtls'];
    prmisnThingPrpDivCd = json['prmisnThingPrpDivCd'];
    prmisnThingPrpDivNm = json['prmisnThingPrpDivNm'];
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
    ofcbkLndcgrDivNm = json['ofcbkLndcgrDivNm'];
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
  String? rntfeeCmpnsFreeDivNm;
  dynamic oflndvalDivCd;
  dynamic oflndvalDivNm;
  dynamic oflndvalAmt;
  dynamic rntfeeRtInfo;
  String? useStrtDe;
  String? useEndDe;
  String? usePrmisnPurpsLclsCd;
  String? usePrmisnPurpsLclsNm;
  String? usePrmisnPurpsMclsCd;
  String? usePrmisnPurpsMclsNm;
  String? usePrmisnPurpsSclsCd;
  String? usePrmisnPurpsSclsNm;
  String? rntfeeCmptnComptYn;
  String? rntfeeNpyYn;
  String? srcwtsupPznYn;
  String? evrfrndYn;
  dynamic ocpatUseDscssDivCd;
  dynamic ocpatUseDscssDivNm;
  String? prmisnTyCd;
  String? prmisnTyNm;
  dynamic usePrmisnKndDtlDtls;
  dynamic prmisnThingPrpDivCd;
  dynamic prmisnThingPrpDivNm;
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
  String? ofcbkLndcgrDivNm;
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
    map['rntfeeCmpnsFreeDivNm'] = rntfeeCmpnsFreeDivNm;
    map['oflndvalDivCd'] = oflndvalDivCd;
    map['oflndvalDivNm'] = oflndvalDivNm;
    map['oflndvalAmt'] = oflndvalAmt;
    map['rntfeeRtInfo'] = rntfeeRtInfo;
    map['useStrtDe'] = useStrtDe;
    map['useEndDe'] = useEndDe;
    map['usePrmisnPurpsLclsCd'] = usePrmisnPurpsLclsCd;
    map['usePrmisnPurpsLclsNm'] = usePrmisnPurpsLclsNm;
    map['usePrmisnPurpsMclsCd'] = usePrmisnPurpsMclsCd;
    map['usePrmisnPurpsMclsNm'] = usePrmisnPurpsMclsNm;
    map['usePrmisnPurpsSclsCd'] = usePrmisnPurpsSclsCd;
    map['usePrmisnPurpsSclsNm'] = usePrmisnPurpsSclsNm;
    map['rntfeeCmptnComptYn'] = rntfeeCmptnComptYn;
    map['rntfeeNpyYn'] = rntfeeNpyYn;
    map['srcwtsupPznYn'] = srcwtsupPznYn;
    map['evrfrndYn'] = evrfrndYn;
    map['ocpatUseDscssDivCd'] = ocpatUseDscssDivCd;
    map['ocpatUseDscssDivNm'] = ocpatUseDscssDivNm;
    map['prmisnTyCd'] = prmisnTyCd;
    map['prmisnTyNm'] = prmisnTyNm;
    map['usePrmisnKndDtlDtls'] = usePrmisnKndDtlDtls;
    map['prmisnThingPrpDivCd'] = prmisnThingPrpDivCd;
    map['prmisnThingPrpDivNm'] = prmisnThingPrpDivNm;
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
    map['ofcbkLndcgrDivNm'] = ofcbkLndcgrDivNm;
    map['ofcbkAra'] = ofcbkAra;
    map['natpblndLdgrNo'] = natpblndLdgrNo;
    return map;
  }

}