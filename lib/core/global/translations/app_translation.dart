
import 'en_US/en.dart';
import 'fr_CA/fr.dart';

abstract class AppTranslation {
  static Map<String, Map<String, String>> translationKeys = {
    "en": en,
    "fr": fr,
  };
}