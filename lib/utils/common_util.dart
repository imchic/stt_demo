import 'dart:ui';

class CommonUtil {

  /// [formatDate] DateTime yyyy-MM-dd로 변환
  static String formatDate(DateTime date) {
    return "${date.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
  }

  static String convertToDateTime(String date) {
    var length = date.length;
    if (length == 8) {
      return "${date.substring(0, 4)}-${date.substring(4, 6)}-${date.substring(6, 8)}";
    } else if (length == 6) {
      return "${date.substring(0, 4)}-${date.substring(4, 6)}";
    } else {
      return date;
    }
  }

  // 세자리 콤마
  static String comma3(num value) {
    if(value == null) return '';
    return value.toString().replaceAllMapped(RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'), (Match m) => '${m[1]},');
  }

  // 전화번호 하이픈
  static String phoneHyphen(String phone) {
    if (phone.length == 11) {
      return "${phone.substring(0, 3)}-${phone.substring(3, 7)}-${phone.substring(7, 11)}";
    } else if (phone.length == 10) {
      return "${phone.substring(0, 3)}-${phone.substring(3, 6)}-${phone.substring(6, 10)}";
    } else {
      return phone;
    }
  }

  static maskOwnerRegisterNo(String ownerRegisterNo) {
    if(ownerRegisterNo.length == 13) {
      return '${ownerRegisterNo.substring(0, 7)}-1${'*' * 6}';
    }
    return ownerRegisterNo;
  }

  static Color getBadgeColor(String value) {
    if (value.startsWith('감정')) {
      return Color(0xff102C57);
    } else if (value.startsWith('보상')) {
      return Color(0xff405D72);
    } else if (value.startsWith('수용')) {
      return Color(0xff295F98);
    } else if (value.startsWith('이의')) {
      return Color(0xffCDC2A5);
    } else if (value.startsWith('판결')) {
      return Color(0xffFCDE70);
    } else if (value.startsWith('소송')) {
      return Color(0xff185519);
    } else {
      return Color(0xff708871);
    }
  }

}