import 'package:note_files/isarCURD.dart';

class RequiredData {
  final IsarService _db = IsarService();
  bool _isRtl = false;
  Map<String, String> _locale = {};
  bool _isAmiri = false;/*TODO get it from the db*/
  get isAmiri => _isAmiri;
  set set_isAmiri (bool value) {
    _isAmiri = value;
    /*TODO store it in the db*/
  }
  set set_isRtl(bool value) {
    _isRtl = value;
  }

  get isRtl => _isRtl;

  get db => _db;
/*
  get priority => _priority;
  set set_priority (int value) => _priority = value;*/

  get locale => _locale;
  set set_locale(Map<String, String> value) {
    _locale = value;
  }
}

RequiredData requiredData = RequiredData();
