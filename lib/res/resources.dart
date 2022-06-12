import 'package:flutter/material.dart';

import 'colors/base_colors.dart';
import 'dimentions/dimensions.dart';
import 'strings/strings.dart';

class Resources {
  final BuildContext? _context;

  const Resources([this._context]);

  Strings get strings {
    late final Locale locale;
    if (_context != null) {
      // It could be from the user preferences or even from the current locale
      locale = Localizations.localeOf(_context!);
    } else {
      locale = const Locale('en');
    }

    switch (locale.languageCode) {
      case 'tr':
        return TurkishStrings();
      default:
        return EnglishStrings();
    }
  }

  BaseColors get color {
    // Will give us flexibility of using different color palletes without touching main codes of the app
    return AppColors();
  }

  Dimensions get dimension {
    // Will give us flexibility of using different dimensions for different screen sizes without touching main codes of the app
    return AppDimension();
  }

  static Resources of([BuildContext? context]) {
    return Resources(context);
  }
}
