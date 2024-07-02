/// TM_LP20040 (LP_실태조사기본소유자정보)

class OwnerDataSourceModel {

  int? no;
  String? ownerNo; // 소유자번호
  String? ladLdgrOwnerNm; // 토지대장소유자명
  String? ladLdgrPosesnDivCd; // 소유자구분코드
  String? ownerRegisterNo;
  String? ownerTelNo;
  String? ownerPhoneNo;

  OwnerDataSourceModel({
    this.no,
    this.ownerNo,
    this.ladLdgrOwnerNm,
    this.ladLdgrPosesnDivCd,
    this.ownerRegisterNo,
    this.ownerTelNo,
    this.ownerPhoneNo,
  });

  OwnerDataSourceModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    ownerNo = json['ownerNo'];
    ladLdgrOwnerNm = json['ladLdgrOwnerNm'];
    ladLdgrPosesnDivCd = json['ladLdgrPosesnDivCd'];
    ownerRegisterNo = json['ownerRegisterNo'];
    ownerTelNo = json['ownerTelNo'];
    ownerPhoneNo = json['ownerPhoneNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['ownerNo'] = ownerNo;
    data['ladLdgrOwnerNm'] = ladLdgrOwnerNm;
    data['ladLdgrPosesnDivCd'] = ladLdgrPosesnDivCd;
    data['ownerRegisterNo'] = ownerRegisterNo;
    data['ownerTelNo'] = ownerTelNo;
    data['ownerPhoneNo'] = ownerPhoneNo;
    return data;
  }

  @override
  String toString() {
    return toJson().toString().replaceAll(',', ',\n');
  }

}