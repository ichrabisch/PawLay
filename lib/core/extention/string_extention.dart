import 'package:easy_localization/easy_localization.dart';

extension StringLocalization on String {
  String get locale =>
      this.tr(); //json dosyasındaki keyleri bulup getirir, translator
}
