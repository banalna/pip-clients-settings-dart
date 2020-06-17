import 'package:pip_clients_settings/pip_clients_settings.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:test/test.dart';

import '../../data/TestModel.dart';

class SettingsClientFixtureV1 {
  SettingsSectionV1 SECTION1 = TestModel.createSettingsSection();
  SettingsSectionV1 SECTION2 = TestModel.createSettingsSection();

  ISettingsClientV1 _client;

  SettingsClientFixtureV1(ISettingsClientV1 client) {
    expect(client, isNotNull);
    _client = client;
  }

  void testCrudOperations() async {
    // Create one section
    var parameters = await _client.setSection(null, 'test.1',
        ConfigParams.fromTuples(['key1', 'value11', 'key2', 'value12']));

    expect(parameters, isNotNull);
    expect(parameters['key1'], 'value11');

    // Create another section
    parameters = await _client.modifySection(
        null,
        'test.2',
        ConfigParams.fromTuples(['key1', 'value21']),
        ConfigParams.fromTuples(['key2', 1]));

    expect(parameters, isNotNull);

    expect(parameters['key1'], 'value21');
    expect(parameters['key2'], '1');

    // Get second section
    parameters = await _client.getSectionById(null, 'test.2');

    expect(parameters, isNotNull);

    expect(parameters['key1'], 'value21');
    expect(parameters['key2'], '1');

    // Get all sections
    var sectionsPage = await _client.getSections(null, null, null);

    expect(sectionsPage, isNotNull);
    expect(sectionsPage.data.length, 2);

    // Get all section ids
    var sectionIdsPage = await _client.getSectionIds(null, null, null);

    expect(sectionIdsPage, isNotNull);
    expect(sectionIdsPage.data.length, 2);
  }
}
