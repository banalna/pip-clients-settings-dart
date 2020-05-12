import 'dart:async';
import 'package:pip_services3_commons/pip_services3_commons.dart';

import 'SettingsSectionV1.dart';

abstract class ISettingsClientV1 {
  Future<DataPage<String>> getSectionIds(String correlationId, FilterParams filter, PagingParams paging);
  Future<DataPage<SettingsSectionV1>> getSections(String correlationId, FilterParams filter, PagingParams paging);
  Future<ConfigParams> getSectionById(String correlationId, String id);
  Future<ConfigParams> setSection(String correlationId, String id, ConfigParams parameters);
  Future<ConfigParams> modifySection(String correlationId, String id, ConfigParams updateParams, ConfigParams incrementParams);
}
