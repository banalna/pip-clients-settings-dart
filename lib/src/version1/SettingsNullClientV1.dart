import 'dart:async';

import 'package:pip_services3_commons/pip_services3_commons.dart';

import 'SettingsSectionV1.dart';
import "ISettingsClientV1.dart" show ISettingsClientV1;

class SettingsNullClientV1 implements ISettingsClientV1 {
  Future<DataPage<String>> getSectionIds(
      String correlationId, FilterParams filter, PagingParams paging) async {
    return await Future.value(DataPage<String>([], 0));
  }

  Future<DataPage<SettingsSectionV1>> getSections(
      String correlationId, FilterParams filter, PagingParams paging) async {
    return await Future.value(DataPage<SettingsSectionV1>([], 0));
  }

  Future<ConfigParams> getSectionById(String correlationId, String id) async {
    return await Future.value(ConfigParams());
  }

  Future<ConfigParams> setSection(
      String correlationId, String id, ConfigParams parameters) async {
    return await Future.value(parameters);
  }

  Future<ConfigParams> modifySection(String correlationId, String id,
      ConfigParams updateParams, ConfigParams incrementParams) async {
    updateParams = updateParams ?? ConfigParams();
    incrementParams = incrementParams ?? ConfigParams();
    updateParams = updateParams.override(incrementParams);
    return await Future.value(updateParams);
  }
}
