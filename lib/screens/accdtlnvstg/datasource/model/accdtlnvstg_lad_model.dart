/// [AccdtlnvstgLadModel] 실태조사서 > 토지내역

class AccdtlnvstgLadModel {

  String? col1;
  String? col2;
  String? col3;
  String? col4;
  String? col5;
  String? col6;
  String? col7;
  String? col8;
  String? col9;
  String? col10;
  String? col11;
  String? col12;
  String? col13;
  String? col14;
  String? col15;
  String? col16;
  String? col17;

  AccdtlnvstgLadModel({
    this.col1,
    this.col2,
    this.col3,
    this.col4,
    this.col5,
    this.col6,
    this.col7,
    this.col8,
    this.col9,
    this.col10,
    this.col11,
    this.col12,
    this.col13,
    this.col14,
    this.col15,
    this.col16,
    this.col17,
  });

  AccdtlnvstgLadModel.fromJson(Map<String, dynamic> json) {
    col1 = json['col1'];
    col2 = json['col2'];
    col3 = json['col3'];
    col4 = json['col4'];
    col5 = json['col5'];
    col6 = json['col6'];
    col7 = json['col7'];
    col8 = json['col8'];
    col9 = json['col9'];
    col10 = json['col10'];
    col11 = json['col11'];
    col12 = json['col12'];
    col13 = json['col13'];
    col14 = json['col14'];
    col15 = json['col15'];
    col16 = json['col16'];
    col17 = json['col17'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['col1'] = col1;
    data['col2'] = col2;
    data['col3'] = col3;
    data['col4'] = col4;
    data['col5'] = col5;
    data['col6'] = col6;
    data['col7'] = col7;
    data['col8'] = col8;
    data['col9'] = col9;
    data['col10'] = col10;
    data['col11'] = col11;
    data['col12'] = col12;
    data['col13'] = col13;
    data['col14'] = col14;
    data['col15'] = col15;
    data['col16'] = col16;
    data['col17'] = col17;
    return data;
  }


}