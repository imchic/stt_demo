import 'dart:convert';
/// bsnsNo : "3015"
/// bsnsZoneNo : 1
/// thingSerNo : "L-0000003015-0001-4420025325-1-0415-0011-000001"
/// ownerNo : "1000083467"
/// lgdongCd : "4420025325"
/// lgdongNm : "충청남도 아산시 배방읍 북수리"
/// lcrtsDivCd : "1"
/// mlnoLtno : "415"
/// slnoLtno : "11"
/// acqsPrpDivCd : "S03"
/// ofcbkLndcgrDivCd : "02"
/// sttusLndcgrDivCd : "02"
/// ofcbkAra : 556
/// incrprAra : 556
/// cmpnstnInvstgAra : 556
/// posesnShreNmrtrInfo : "1"
/// posesnShreDnmntrInfo : "1"
/// partcpntSeq : 1
/// cmpnstnPartcpntRsn : "근저당권"
/// partcpntNm : "배방농협"
/// partcpntAddr : null
/// partcpntMbtlnum : null
List cstmrcardObstPartcpntDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = CstmrcardObstPartcpntDatasourceModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

CstmrcardObstPartcpntDatasourceModel cstmrcardObstPartcpntFromJson(String str) => CstmrcardObstPartcpntDatasourceModel.fromJson(json.decode(str));
String cstmrcardObstPartcpntToJson(CstmrcardObstPartcpntDatasourceModel data) => json.encode(data.toJson());
class CstmrcardObstPartcpntDatasourceModel {
  CstmrcardObstPartcpntDatasourceModel({
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
    this.obstStrctStndrdInfo,
    this.dtaPrcsSittnCtnt,
    this.cmpnstnQtyAraVu,
    this.cmpnstnThingUnitDivCd,
    this.cmpnstnThingUnitDivNm,
    this.partcpntSeq,
    this.cmpnstnPartcpntRsn,
    this.partcpntNm,
    this.partcpntAddr,
    this.partcpntMbtlnum,
  });

  CstmrcardObstPartcpntDatasourceModel.fromJson(dynamic json) {
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
    obstStrctStndrdInfo = json['obstStrctStndrdInfo'];
    dtaPrcsSittnCtnt = json['dtaPrcsSittnCtnt'];
    cmpnstnQtyAraVu = json['cmpnstnQtyAraVu'];
    cmpnstnThingUnitDivCd = json['cmpnstnThingUnitDivCd'];
    cmpnstnThingUnitDivNm = json['cmpnstnThingUnitDivNm'];
    partcpntSeq = json['partcpntSeq'];
    cmpnstnPartcpntRsn = json['cmpnstnPartcpntRsn'];
    partcpntNm = json['partcpntNm'];
    partcpntAddr = json['partcpntAddr'];
    partcpntMbtlnum = json['partcpntMbtlnum'];
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
  String? obstStrctStndrdInfo;
  String? dtaPrcsSittnCtnt;
  String? cmpnstnQtyAraVu;
  String? cmpnstnThingUnitDivCd;
  String? cmpnstnThingUnitDivNm;
  String? partcpntSeq;
  String? cmpnstnPartcpntRsn;
  String? partcpntNm;
  dynamic partcpntAddr;
  dynamic partcpntMbtlnum;

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
    map['obstStrctStndrdInfo'] = obstStrctStndrdInfo;
    map['dtaPrcsSittnCtnt'] = dtaPrcsSittnCtnt;
    map['cmpnstnQtyAraVu'] = cmpnstnQtyAraVu;
    map['cmpnstnThingUnitDivCd'] = cmpnstnThingUnitDivCd;
    map['cmpnstnThingUnitDivNm'] = cmpnstnThingUnitDivNm;
    map['partcpntSeq'] = partcpntSeq;
    map['cmpnstnPartcpntRsn'] = cmpnstnPartcpntRsn;
    map['partcpntNm'] = partcpntNm;
    map['partcpntAddr'] = partcpntAddr;
    map['partcpntMbtlnum'] = partcpntMbtlnum;
    return map;
  }

}