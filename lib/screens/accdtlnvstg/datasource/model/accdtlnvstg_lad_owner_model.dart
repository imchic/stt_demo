class AccdtlnvstgLadOwnerModel {

  int no = 0;
  String? ownerNo;
  String? ownerName;
  String? ownerType;
  String? ownerTypeDetail;
  String? ownerDetail2;
  String? ownerRegisterNo;

  AccdtlnvstgLadOwnerModel({
    this.no = 0,
    this.ownerNo,
    this.ownerName,
    this.ownerType,
    this.ownerTypeDetail,
    this.ownerDetail2,
    this.ownerRegisterNo,
  });

  factory AccdtlnvstgLadOwnerModel.fromJson(Map<String, dynamic> json) {
    return AccdtlnvstgLadOwnerModel(
      ownerNo: json['ownerNo'],
      ownerName: json['ownerName'],
      ownerType: json['ownerType'],
      ownerTypeDetail: json['ownerTypeDetail'],
      ownerDetail2: json['ownerDetail2'],
      ownerRegisterNo: json['ownerRegisterNo'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['ownerNo'] = this.ownerNo;
    data['ownerName'] = this.ownerName;
    data['ownerType'] = this.ownerType;
    data['ownerTypeDetail'] = this.ownerTypeDetail;
    data['ownerDetail2'] = this.ownerDetail2;
    data['ownerRegisterNo'] = this.ownerRegisterNo;
    return data;
  }

}