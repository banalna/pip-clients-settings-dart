
import 'package:pip_clients_settings/pip_clients_settings.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_components/pip_services3_components.dart';
import 'package:pip_services_settings/pip_services_settings.dart';
import 'package:test/test.dart';

import 'SettingsClientFixtureV1.dart';

var httpConfig = ConfigParams.fromTuples([
    "connection.protocol", "http",
    "connection.host", "localhost",
    "connection.port", 3000
]);

void main() {
group('SettingsHttpClientV1', () {
    SettingsHttpServiceV1 service;
    SettingsHttpClientV1 client;
    SettingsClientFixtureV1 fixture;

    setUp(() async {
        var logger = new ConsoleLogger();
        var persistence = new SettingsMemoryPersistence();
        var controller = new SettingsController();

        service = SettingsHttpServiceV1();
        service.configure(httpConfig);

        var references = References.fromTuples([
            Descriptor('pip-services', 'logger', 'console', 'default', '1.0'), logger,
            Descriptor('pip-services-settings', 'persistence', 'memory', 'default', '1.0'), persistence,
            Descriptor('pip-services-settings', 'controller', 'default', 'default', '1.0'), controller,
            Descriptor('pip-services-settings', 'service', 'http', 'default', '1.0'), service
        ]);
        controller.setReferences(references);
        service.setReferences(references);

        client = SettingsHttpClientV1();
        client.setReferences(references);
        client.configure(httpConfig);

        fixture = new SettingsClientFixtureV1(client);

        await service.open(null);
        await client.open(null);
    });
    
    tearDown(() async {
        client.close(null);
        service.close(null);
    });

    test('CRUD Operations', () async {
        fixture.testCrudOperations();
    });

});
}