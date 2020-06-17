import 'dart:async';

import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_rpc/pip_services3_rpc.dart';

import 'ISettingsClientV1.dart';
import 'SettingsSectionV1.dart';

class SettingsDirectClientV1 extends DirectClient<dynamic>
    implements ISettingsClientV1 {
  SettingsDirectClientV1() : super() {
    dependencyResolver.put('controller',
        Descriptor('pip-services-settings', 'controller', '*', '*', '*'));
  }

  /// Retrieves settings section ids filtered by set of criteria
  ///
  /// - [correlation_id]    (optional) unique id that identifies distributed transaction
  /// - [filter]            data transfer object used to pass filter parameters as simple key-value pairs
  /// - [paging]            data transfer object to pass paging parameters for queries
  @override
  Future<DataPage<String>> getSectionIds(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var timing = instrument(correlationId, 'settings.get_section_ids');
    var page = await controller.getSectionIds(correlationId, filter, paging);
    timing.endTiming();
    return page;
  }

  /// Retrieves settings sections filtered by set of criteria
  ///
  /// - [correlation_id]    (optional) unique id that identifies distributed transaction
  /// - [filter]            data transfer object used to pass filter parameters as simple key-value pairs
  /// - [paging]            data transfer object to pass paging parameters for queries
  @override
  Future<DataPage<SettingsSectionV1>> getSections(
      String correlationId, FilterParams filter, PagingParams paging) async {
    var timing = instrument(correlationId, 'settings.get_sections');
    var page = await controller.getSections(correlationId, filter, paging);
    timing.endTiming();
    return page;
  }

  /// Gets settings section by its unique id
  ///
  /// - [correlation_id]    (optional) unique id that identifies distributed transaction
  /// - [id]                unique section id
  @override
  Future<ConfigParams> getSectionById(String correlationId, String id) async {
    var timing = instrument(correlationId, 'settings.get_sections_by_id');
    var section = await controller.getSectionById(correlationId, id);
    timing.endTiming();
    return section;
  }

  /// Sets settings section by its unique id
  ///
  /// - [correlation_id]    (optional) unique id that identifies distributed transaction
  /// - [id]                unique section id
  /// - [parameters]        new section parameters
  @override
  Future<ConfigParams> setSection(
      String correlationId, String id, ConfigParams parameters) async {
    var timing = instrument(correlationId, 'settings.set_sections');
    var params = await controller.setSection(correlationId, id, parameters);
    timing.endTiming();
    return params;
  }

  /// Modify settings section, perform partial updates and increments
  ///
  /// - [correlation_id]        (optional) transaction id to trace execution through call chain.
  /// - [id]                    unique section id
  /// - [update_parameters]     section parameters for partial updates
  /// - [increment_parameters]  section parameters for increments
  @override
  Future<ConfigParams> modifySection(String correlationId, String id,
      ConfigParams updateParams, ConfigParams incrementParams) async {
    var timing = instrument(correlationId, 'settings.modify_sections');
    var params = await controller.modifySection(
        correlationId, id, updateParams, incrementParams);
    timing.endTiming();
    return params;
  }
}
