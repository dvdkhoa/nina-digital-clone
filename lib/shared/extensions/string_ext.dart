import 'dart:ui';

import 'package:intl/intl.dart';

extension StringUtil on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }

  String decodeHtml() {
    return replaceAll('&lt;', '<')
        .replaceAll('&gt;', '>')
        .replaceAll('&quot;', '"')
        .replaceAll('&amp;', '&');
  }

  Color get toColor {
    String data = replaceAll('#', '');
    if (data.length == 6) {
      data = 'FF$data';
    }
    return Color(int.parse('0x$data'));
  }

  String maxLength(int length) {
    if (length > length) {
      return this;
    } else {
      return '${substring(0, length)}...';
    }
  }

  int? toInt({int? defaultValue}) {
    try {
      return int.parse(this);
    } catch (e) {
      return defaultValue;
    }
  }

  double toDouble({double defaultValue = 0}) {
    try {
      return double.parse(this);
    } catch (e) {
      return defaultValue;
    }
  }

  String capitalizeWords() {
    if (trim().isEmpty) {
      return '';
    }
    return split(' ')
        .map((element) =>
            '${element[0].toUpperCase()}${element.substring(1).toLowerCase()}')
        .join(' ');
  }

  bool get isValidEmail {
    final emailRegExp = RegExp(r"^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    return emailRegExp.hasMatch(this);
  }

  bool get isValidName {
    final nameRegExp =
        new RegExp(r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$");
    return nameRegExp.hasMatch(this);
  }

  bool get isValidPassword {
    final passwordRegExp = RegExp(
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\><*~]).{8,}/pre>');
    return passwordRegExp.hasMatch(this);
  }

  bool get isNotNull {
    return this != null;
  }

  bool get isValidPhone {
    final phoneRegExp = RegExp(r"^\+?0[0-9]{9}$");
    return phoneRegExp.hasMatch(this);
  }
}

extension DoubleUtil on double {
  String formattedVNDCustom() {
    // Format VND with default locale settings (may not be optimal for Vietnam)
    final vndFormatter = NumberFormat.currency(locale: 'vi_VN');
    String formattedVND =
        vndFormatter.format(1234567.89); // Outputs: ₫1.234.567,89

// For better formatting, customize with thousands separator (,) and no decimal separator
    final customVNDFormatter = NumberFormat.currency(
      locale: 'vi_VN',
      customPattern:
          '#,###₫', // Uses comma as thousand separator and adds "₫" symbol
      decimalDigits: 0, // No decimal places for VND typically
    );
    String formattedVNDCustom = customVNDFormatter.format(this);
    return formattedVNDCustom;
  }
}
