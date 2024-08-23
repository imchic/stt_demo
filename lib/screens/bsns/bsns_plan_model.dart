import 'dart:convert';
/// bsnsNo : "2502"
/// bsnsNm : "(임시)경인운하사업 5,6공구-김포터미널 수몰용지"
/// bsnsDivLclsCd : "D"
/// bsnsDivMclsCd : "B"
/// bsnsDivSclsCd : null
/// bsnsStrtDe : null
/// bsnsEndDe : null
/// competDe : null
/// bsnsPlanAprvRqstDe : null
/// aprvDe : null
/// gztNtfcDe : null
/// enfcMthDtls : "test"
/// bsnsPurpsDtls : "test"
/// bsnsLcinfo : "test"
/// bsnsScaleInfo : "test"
/// lotCnt : 1000
/// bsnsAra : 451000
/// bsnsAmt : 451000000
/// gztNtfcNoDtls : "test"
/// mngdeptCd : "10950061"
/// reltDeptCd1 : null
/// reltDeptCd2 : null
/// reltDeptCd3 : null
/// reltDeptCd4 : null
/// reltDeptCd5 : null
/// gisDtaYn : "N"
/// bsnsSqnc : 1
/// bsnsBasisLawordInfo : "test"
/// oldMngdeptCd : null
/// bsnsCnfmInsttNm : "환경부"
/// delYn : "N"
/// frstRgstrId : "60004049"
/// frstRegistDt : 1652753925000
/// lastUpdusrId : "19921538"
/// lastUpdtDt : 1652755544000
/// conectIp : "172.20.215.212"
/// bsnsDivLclsNm : "댐"
/// bsnsDivMclsNm : "건설"
/// bsnsDivSclsNm : null
/// head : null
/// dept : null
/// team : null
/// bgroup : null
/// affcd : null
/// plans : null
/// korname : null

BsnsPlanModel bsnsPlanModelFromJson(String str) => BsnsPlanModel.fromJson(json.decode(str));
String bsnsPlanModelToJson(BsnsPlanModel data) => json.encode(data.toJson());
class BsnsPlanModel {
  BsnsPlanModel({
      this.bsnsNo, 
      this.bsnsNm, 
      this.bsnsDivLclsCd, 
      this.bsnsDivMclsCd, 
      this.bsnsDivSclsCd, 
      this.bsnsStrtDe, 
      this.bsnsEndDe, 
      this.competDe, 
      this.bsnsPlanAprvRqstDe, 
      this.aprvDe, 
      this.gztNtfcDe, 
      this.enfcMthDtls, 
      this.bsnsPurpsDtls, 
      this.bsnsLcinfo, 
      this.bsnsScaleInfo, 
      this.lotCnt, 
      this.bsnsAra, 
      this.bsnsAmt, 
      this.gztNtfcNoDtls, 
      this.mngdeptCd, 
      this.reltDeptCd1, 
      this.reltDeptCd2, 
      this.reltDeptCd3, 
      this.reltDeptCd4, 
      this.reltDeptCd5, 
      this.gisDtaYn, 
      this.bsnsSqnc, 
      this.bsnsBasisLawordInfo, 
      this.oldMngdeptCd, 
      this.bsnsCnfmInsttNm, 
      this.delYn, 
      this.frstRgstrId, 
      this.frstRegistDt, 
      this.lastUpdusrId, 
      this.lastUpdtDt, 
      this.conectIp, 
      this.bsnsDivLclsNm, 
      this.bsnsDivMclsNm, 
      this.bsnsDivSclsNm, 
      this.head, 
      this.dept, 
      this.team, 
      this.bgroup, 
      this.affcd, 
      this.plans, 
      this.korname,});

  BsnsPlanModel.fromJson(dynamic json) {
    bsnsNo = json['bsnsNo'];
    bsnsNm = json['bsnsNm'];
    bsnsDivLclsCd = json['bsnsDivLclsCd'];
    bsnsDivMclsCd = json['bsnsDivMclsCd'];
    bsnsDivSclsCd = json['bsnsDivSclsCd'];
    bsnsStrtDe = json['bsnsStrtDe'];
    bsnsEndDe = json['bsnsEndDe'];
    competDe = json['competDe'];
    bsnsPlanAprvRqstDe = json['bsnsPlanAprvRqstDe'];
    aprvDe = json['aprvDe'];
    gztNtfcDe = json['gztNtfcDe'];
    enfcMthDtls = json['enfcMthDtls'];
    bsnsPurpsDtls = json['bsnsPurpsDtls'];
    bsnsLcinfo = json['bsnsLcinfo'];
    bsnsScaleInfo = json['bsnsScaleInfo'];
    lotCnt = json['lotCnt'];
    bsnsAra = json['bsnsAra'];
    bsnsAmt = json['bsnsAmt'];
    gztNtfcNoDtls = json['gztNtfcNoDtls'];
    mngdeptCd = json['mngdeptCd'];
    reltDeptCd1 = json['reltDeptCd1'];
    reltDeptCd2 = json['reltDeptCd2'];
    reltDeptCd3 = json['reltDeptCd3'];
    reltDeptCd4 = json['reltDeptCd4'];
    reltDeptCd5 = json['reltDeptCd5'];
    gisDtaYn = json['gisDtaYn'];
    bsnsSqnc = json['bsnsSqnc'];
    bsnsBasisLawordInfo = json['bsnsBasisLawordInfo'];
    oldMngdeptCd = json['oldMngdeptCd'];
    bsnsCnfmInsttNm = json['bsnsCnfmInsttNm'];
    delYn = json['delYn'];
    frstRgstrId = json['frstRgstrId'];
    frstRegistDt = json['frstRegistDt'];
    lastUpdusrId = json['lastUpdusrId'];
    lastUpdtDt = json['lastUpdtDt'];
    conectIp = json['conectIp'];

    bsnsDivLclsNm = json['bsnsDivLclsNm'];
    bsnsDivMclsNm = json['bsnsDivMclsNm'];
    bsnsDivSclsNm = json['bsnsDivSclsNm'];
    head = json['head'];
    dept = json['dept'];
    team = json['team'];
    bgroup = json['bgroup'];
    affcd = json['affcd'];
    plans = json['plans'];
    korname = json['korname'];
  }
  String? bsnsNo;
  String? bsnsNm;
  String? bsnsDivLclsCd;
  String? bsnsDivMclsCd;
  dynamic bsnsDivSclsCd;
  dynamic bsnsStrtDe;
  dynamic bsnsEndDe;
  dynamic competDe;
  dynamic bsnsPlanAprvRqstDe;
  dynamic aprvDe;
  dynamic gztNtfcDe;
  String? enfcMthDtls;
  String? bsnsPurpsDtls;
  String? bsnsLcinfo;
  String? bsnsScaleInfo;
  num? lotCnt;
  num? bsnsAra;
  num? bsnsAmt;
  String? gztNtfcNoDtls;
  String? mngdeptCd;
  dynamic reltDeptCd1;
  dynamic reltDeptCd2;
  dynamic reltDeptCd3;
  dynamic reltDeptCd4;
  dynamic reltDeptCd5;
  String? gisDtaYn;
  num? bsnsSqnc;
  String? bsnsBasisLawordInfo;
  dynamic oldMngdeptCd;
  String? bsnsCnfmInsttNm;
  String? delYn;
  String? frstRgstrId;
  num? frstRegistDt;
  String? lastUpdusrId;
  num? lastUpdtDt;
  String? conectIp;
  String? bsnsDivLclsNm;
  String? bsnsDivMclsNm;
  dynamic bsnsDivSclsNm;
  dynamic head;
  dynamic dept;
  dynamic team;
  dynamic bgroup;
  dynamic affcd;
  dynamic plans;
  dynamic korname;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bsnsNo'] = bsnsNo;
    map['bsnsNm'] = bsnsNm;
    map['bsnsDivLclsCd'] = bsnsDivLclsCd;
    map['bsnsDivMclsCd'] = bsnsDivMclsCd;
    map['bsnsDivSclsCd'] = bsnsDivSclsCd;
    map['bsnsStrtDe'] = bsnsStrtDe;
    map['bsnsEndDe'] = bsnsEndDe;
    map['competDe'] = competDe;
    map['bsnsPlanAprvRqstDe'] = bsnsPlanAprvRqstDe;
    map['aprvDe'] = aprvDe;
    map['gztNtfcDe'] = gztNtfcDe;
    map['enfcMthDtls'] = enfcMthDtls;
    map['bsnsPurpsDtls'] = bsnsPurpsDtls;
    map['bsnsLcinfo'] = bsnsLcinfo;
    map['bsnsScaleInfo'] = bsnsScaleInfo;
    map['lotCnt'] = lotCnt;
    map['bsnsAra'] = bsnsAra;
    map['bsnsAmt'] = bsnsAmt;
    map['gztNtfcNoDtls'] = gztNtfcNoDtls;
    map['mngdeptCd'] = mngdeptCd;
    map['reltDeptCd1'] = reltDeptCd1;
    map['reltDeptCd2'] = reltDeptCd2;
    map['reltDeptCd3'] = reltDeptCd3;
    map['reltDeptCd4'] = reltDeptCd4;
    map['reltDeptCd5'] = reltDeptCd5;
    map['gisDtaYn'] = gisDtaYn;
    map['bsnsSqnc'] = bsnsSqnc;
    map['bsnsBasisLawordInfo'] = bsnsBasisLawordInfo;
    map['oldMngdeptCd'] = oldMngdeptCd;
    map['bsnsCnfmInsttNm'] = bsnsCnfmInsttNm;
    map['delYn'] = delYn;
    map['frstRgstrId'] = frstRgstrId;
    map['frstRegistDt'] = frstRegistDt;
    map['lastUpdusrId'] = lastUpdusrId;
    map['lastUpdtDt'] = lastUpdtDt;
    map['conectIp'] = conectIp;
    map['bsnsDivLclsNm'] = bsnsDivLclsNm;
    map['bsnsDivMclsNm'] = bsnsDivMclsNm;
    map['bsnsDivSclsNm'] = bsnsDivSclsNm;
    map['head'] = head;
    map['dept'] = dept;
    map['team'] = team;
    map['bgroup'] = bgroup;
    map['affcd'] = affcd;
    map['plans'] = plans;
    map['korname'] = korname;
    return map;
  }

}