import 'dart:math';

import 'package:flutter/services.dart';

const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
Random _rnd = Random();
const ext = 0;

String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
    length, (_) => _chars.codeUnitAt(_rnd.nextInt(_chars.length))));


extension ImagePath on String {
  String get svg => 'assets/svg/$this.svg';

  String get png => 'assets/png/$this.png';

  String get jpg => 'assets/png/$this.jpg';
}

extension NumExtensions on int {
  num addPercentage(num v) => this + ((v / 100) * this);

  num getPercentage(num v) => ((v / 100) * this);
}


String trimPhone(String? phone) {
  if (phone![4] == "0") {
    List v = phone.split("").toList();
    v.removeAt(4);
    return v.join("").toString();
  } else {
    return phone;
  }
}

String transformPhoneNumber(String num) {
  if(num.isNotEmpty){
    // Check if the phone number starts with "+2340"
    if (num.startsWith("0")) {
      // Remove the "0" after "+234"
      return num.substring(1);
    }
  }
  // Return the original number if no transformation is needed
  return num;
}

String formatPhoneNumber(String phoneNumber) {
  // Remove the country code (assuming it's always +234 for Nigeria)
  String withoutCountryCode = phoneNumber.substring(4);

  // If the number starts with '0', remove it
  if (withoutCountryCode.startsWith('0')) {
    withoutCountryCode = withoutCountryCode.substring(1);
  }

  return "0$withoutCountryCode";
}


class NumericTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    // Use a regular expression to remove non-numeric characters
    final filteredValue = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    return TextEditingValue(
      text: filteredValue,
      selection: TextSelection.collapsed(offset: filteredValue.length),
    );
  }
}
