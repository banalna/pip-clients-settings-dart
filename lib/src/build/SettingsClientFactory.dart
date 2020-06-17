import 'package:pip_clients_settings/src/version1/version1.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:pip_services3_components/pip_services3_components.dart';

class SettingsClientFactory extends Factory {
  static final NullClientV1Descriptor = Descriptor('pip-services-settings', 'client', 'null', 'default', '1.0');
  static final DirectClientV1Descriptor = Descriptor('pip-services-settings', 'client', 'direct', 'default', '1.0');
  static final HttpClientV1Descriptor = Descriptor('pip-services-settings', 'client', 'http', 'default', '1.0');
  
  SettingsClientFactory() : super() {
    registerAsType(SettingsClientFactory.NullClientV1Descriptor, SettingsNullClientV1);
    registerAsType(SettingsClientFactory.DirectClientV1Descriptor, SettingsDirectClientV1);
    registerAsType(SettingsClientFactory.HttpClientV1Descriptor, SettingsHttpClientV1);
  }
}
