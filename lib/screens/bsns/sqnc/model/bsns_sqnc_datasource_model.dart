class BsnsSqncDatasourceModel {
  int? no;
  int? bsnsSqnc;
  String? bsnsStrtDe;
  String? bsnsEndDe;

  BsnsSqncDatasourceModel({
    this.no,
    this.bsnsSqnc,
    this.bsnsStrtDe,
    this.bsnsEndDe,
  });

  BsnsSqncDatasourceModel.fromJson(Map<String, dynamic> json) {
    no = json['no'];
    bsnsSqnc = json['bsnsSqnc'];
    bsnsStrtDe = json['bsnsStrtDe'];
    bsnsEndDe = json['bsnsEndDe'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['no'] = no;
    data['bsnsSqnc'] = bsnsSqnc;
    data['bsnsStrtDe'] = bsnsStrtDe;
    data['bsnsEndDe'] = bsnsEndDe;
    return data;
  }

  @override
  String toString() {
    return 'BsnsSqncDatasourceModel{no: $no, bsnsSqnc: $bsnsSqnc, bsnsStrtDe: $bsnsStrtDe, bsnsEndDe: $bsnsEndDe}';
  }

}