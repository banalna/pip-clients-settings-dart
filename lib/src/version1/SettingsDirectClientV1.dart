import 'dart:async';

import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';

import 'ISettingsClientV1.dart';
import 'SettingsSectionV1.dart';

class SettingsDirectClientV1 extends DirectClient<dynamic>
    implements ISettingsClientV1 {
  SettingsDirectClientV1() : super() {
    this.dependencyResolver.put("controller",
        new Descriptor("pip-services-settings", "controller", "*", "*", "*"));
  }

  Future<DataPage<String>> getSectionIds(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var timing = this.instrument(correlationId, "settings.get_section_ids");
    var page =
        await this.controller.getSectionIds(correlationId, filter, paging);
    timing.endTiming();
    return page;
  }

  Future<DataPage<SettingsSectionV1>> getSections(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var timing = this.instrument(correlationId, "settings.get_sections");
    var page = await this.controller.getSections(correlationId, filter, paging);
    timing.endTiming();
    return page;
  }

  Future<ConfigParams> getSectionById(String correlationId, String id) async {
    var timing = this.instrument(correlationId, "settings.get_sections_by_id");
    var section = await this.controller.getSectionById(correlationId, id);
    timing.endTiming();
    return section;
  }

  Future<ConfigParams> setSection(
      String correlationId, String id, ConfigParams parameters) async {
    var timing = this.instrument(correlationId, "settings.set_sections");
    var params =
        await this.controller.setSection(correlationId, id, parameters);
    timing.endTiming();
    return params;
  }

  Future<ConfigParams> modifySection(String correlationId, String id,
      ConfigParams updateParams, ConfigParams incrementParams) async {
    var timing = this.instrument(correlationId, "settings.modify_sections");
    var params = await this
        .controller
        .modifySection(correlationId, id, updateParams, incrementParams);
    timing.endTiming();
    return params;
  }
}
