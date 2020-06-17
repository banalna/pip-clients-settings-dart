import 'dart:async';
import 'dart:convert';

import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_grpc/pip_services3_grpc.dart';

import 'SettingsSectionV1.dart';
import 'ISettingsClientV1.dart';

class SettingsCommandableGrpcClientV1 extends CommandableGrpcClient
    implements ISettingsClientV1 {
  SettingsCommandableGrpcClientV1([config]) : super('v1/settings') {
    if (config != null) configure(ConfigParams.fromValue(config));
  }

  @override
  Future<DataPage<String>> getSectionIds(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var result = await callCommand(
      'get_section_ids',
      correlationId,
      {'filter': filter, 'paging': paging},
    );

    return DataPage<String>.fromJson(
        json.decode(result), (item) => item.toString());
  }

  @override
  Future<DataPage<SettingsSectionV1>> getSections(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var result = await callCommand(
      'get_sections',
      correlationId,
      {'filter': filter, 'paging': paging},
    );

    return DataPage<SettingsSectionV1>.fromJson(json.decode(result), (item) {
      var section = SettingsSectionV1();
      section.fromJson(item);
      return section;
    });
  }

  @override
  Future<ConfigParams> getSectionById(String correlationId, String id) async {
    var params = await callCommand(
      'get_section_by_id',
      correlationId,
      {'id': id},
    );

    return ConfigParams.fromValue(params);
  }

  @override
  Future<ConfigParams> setSection(
      String correlationId, String id, ConfigParams parameters) async {
    var params = await callCommand(
      'set_section',
      correlationId,
      {'id': id, 'parameters': parameters},
    );

    return ConfigParams.fromValue(params);
  }

  @override
  Future<ConfigParams> modifySection(String correlationId, String id,
      ConfigParams updateParams, ConfigParams incrementParams) async {
    var params = await callCommand(
      'modify_section',
      correlationId,
      {
        'id': id,
        'update_parameters': updateParams,
        'increment_parameters': incrementParams
      },
    );

    return ConfigParams.fromValue(params);
  }
}
