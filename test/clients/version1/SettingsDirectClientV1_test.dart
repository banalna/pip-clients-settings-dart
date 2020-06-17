import 'package:pip_clients_settings/pip_clients_settings.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services_settings/pip_services_settings.dart';
import 'package:test/test.dart';

import 'SettingsClientFixtureV1.dart';

void main() {
  group('SettingsDirectClientV1', () {
    SettingsMemoryPersistence persistence;
    SettingsController controller;
    SettingsDirectClientV1 client;
    SettingsClientFixtureV1 fixture;

    setUp(() async {
      persistence = SettingsMemoryPersistence();
      persistence.configure(ConfigParams());

      controller = SettingsController();
      controller.configure(ConfigParams());

      client = SettingsDirectClientV1();

      var references = References.fromTuples([
        Descriptor(
            'pip-services-settings', 'persistence', 'memory', 'default', '1.0'),
        persistence,
        Descriptor(
            'pip-services-settings', 'controller', 'default', 'default', '1.0'),
        controller,
        Descriptor(
            'pip-services-settings', 'client', 'direct', 'default', '1.0'),
        client
      ]);

      controller.setReferences(references);
      client.setReferences(references);

      fixture = SettingsClientFixtureV1(client);

      await persistence.open(null);
    });

    tearDown(() async {
      await persistence.close(null);
    });

    test('CRUD Operations', () async {
      fixture.testCrudOperations();
    });
  });
}
