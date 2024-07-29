class AccdtlnvstgLadPartcpntModel {

  String? ownerNo;
  String? ladLdgrOwnerNm;
  String? ladLdgrPosesnDivCd;
  String? ownerTypeDetail;
  String? ownerDetail2;
  String? ownerRegisterNo;

  AccdtlnvstgLadPartcpntModel({
    this.ownerNo,
    this.ladLdgrOwnerNm, // 소유자 명
    this.ladLdgrPosesnDivCd, // 관계구분
    this.ownerTypeDetail, // 성명
    this.ownerDetail2,
    this.ownerRegisterNo,
  });

  factory AccdtlnvstgLadPartcpntModel.fromJson(Map<String, dynamic> json) {
    return AccdtlnvstgLadPartcpntModel(
      ownerNo: json['ownerNo'],
      ladLdgrOwnerNm: json['ladLdgrOwnerNm'],
      ladLdgrPosesnDivCd: json['ladLdgrPosesnDivCd'],
      ownerTypeDetail: json['ownerTypeDetail'],
      ownerDetail2: json['ownerDetail2'],
      ownerRegisterNo: json['ownerRegisterNo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ownerNo'] = this.ownerNo;
    data['ladLdgrOwnerNm'] = this.ladLdgrOwnerNm;
    data['ladLdgrPosesnDivCd'] = this.ladLdgrPosesnDivCd;
    data['ownerTypeDetail'] = this.ownerTypeDetail;
    data['ownerDetail2'] = this.ownerDetail2;
    data['ownerRegisterNo'] = this.ownerRegisterNo;
    return data;
  }

}