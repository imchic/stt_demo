import 'dart:convert';
/// issNo : "1"
/// isuDt : 1424790000000
/// bondIsuDe : null
/// prchasCnfrmnIsuDivCd : "01"
/// prchasCnfrmnIsuDivNm : "취득세면제용"
/// pymntSumAmt : null
/// prchasCnfrmnIssAmt : null
/// delamt : 0
/// janamt : 0


List cstmrcardConfirmDataSourceKeyValue(dynamic str, List<dynamic> list, int length) {
  for (int i = 0; i < length; i++) {
    var data = CstmrcardConfirmDatasourceModel.fromJson(str[i]);
    list.add(data);
  }
  return list;
}

CstmrcardConfirmDatasourceModel cstmrcardConfirmDatasourceModelFromJson(String str) => CstmrcardConfirmDatasourceModel.fromJson(json.decode(str));
String cstmrcardConfirmDatasourceModelToJson(CstmrcardConfirmDatasourceModel data) => json.encode(data.toJson());
class CstmrcardConfirmDatasourceModel {
  CstmrcardConfirmDatasourceModel({
      this.issNo, 
      this.isuDt, 
      this.bondIsuDe, 
      this.prchasCnfrmnIsuDivCd, 
      this.prchasCnfrmnIsuDivNm, 
      this.pymntSumAmt, 
      this.prchasCnfrmnIssAmt, 
      this.delamt, 
      this.janamt,});

  CstmrcardConfirmDatasourceModel.fromJson(dynamic json) {
    issNo = json['issNo'];
    isuDt = json['isuDt'];
    bondIsuDe = json['bondIsuDe'];
    prchasCnfrmnIsuDivCd = json['prchasCnfrmnIsuDivCd'];
    prchasCnfrmnIsuDivNm = json['prchasCnfrmnIsuDivNm'];
    pymntSumAmt = json['pymntSumAmt'];
    prchasCnfrmnIssAmt = json['prchasCnfrmnIssAmt'];
    delamt = json['delamt'];
    janamt = json['janamt'];
  }
  String? issNo;
  num? isuDt;
  dynamic bondIsuDe;
  String? prchasCnfrmnIsuDivCd;
  String? prchasCnfrmnIsuDivNm;
  dynamic pymntSumAmt;
  dynamic prchasCnfrmnIssAmt;
  num? delamt;
  num? janamt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['issNo'] = issNo;
    map['isuDt'] = isuDt;
    map['bondIsuDe'] = bondIsuDe;
    map['prchasCnfrmnIsuDivCd'] = prchasCnfrmnIsuDivCd;
    map['prchasCnfrmnIsuDivNm'] = prchasCnfrmnIsuDivNm;
    map['pymntSumAmt'] = pymntSumAmt;
    map['prchasCnfrmnIssAmt'] = prchasCnfrmnIssAmt;
    map['delamt'] = delamt;
    map['janamt'] = janamt;
    return map;
  }

}