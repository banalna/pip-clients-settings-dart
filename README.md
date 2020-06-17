# Settings Microservice Client SDK for Dart

This is a Dart client SDK for [pip-services-settings](https://github.com/pip-services-infrastructure/pip-services-settings-dart) microservice.

## Download

Right now the only way to get the microservice is to check it out directly from github repository
```bash
git clone git@github.com:pip-services-infrastructure/pip-services-settings-dart.git
```

Pip.Service team is working to implement packaging and make stable releases available for your 
as zip downloadable archieves.

## Contract

Logical contract of the microservice is presented below. For physical implementation (HTTP/REST),
please, refer to documentation of the specific protocol.

```dart
class SettingsSectionV1 implements IStringIdentifiable {
  @override
  String id;
  ConfigParams parameters;
  DateTime update_time;

  SettingsSectionV1({String id, ConfigParams parameters, DateTime update_time});

  void fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson();
}


abstract class ISettingsClientV1 {
  Future<DataPage<String>> getSectionIds(String correlationId, FilterParams filter, PagingParams paging);
  Future<DataPage<SettingsSectionV1>> getSections(String correlationId, FilterParams filter, PagingParams paging);
  Future<ConfigParams> getSectionById(String correlationId, String id);
  Future<ConfigParams> setSection(String correlationId, String id, ConfigParams parameters);
  Future<ConfigParams> modifySection(String correlationId, String id, ConfigParams updateParams, ConfigParams incrementParams);
}
```

## Use

The easiest way to work with the microservice is to use client SDK. 

Define client configuration parameters that match the configuration of the microservice's external API
```dart
// Client configuration
var httpConfig = ConfigParams.fromTuples(
	"connection.protocol", "http",
	"connection.host", "localhost",
	"connection.port", 8080
);
```

Instantiate the client and open connection to the microservice
```dart
// Create the client instance
var client = SettingsHttpClientV1(config);

// Configure the client
client.configure(httpConfig);

// Connect to the microservice
try{
  await client.open(null)
}catch() {
  // Error handling...
}       
// Work with the microservice
// ...
```

Now the client is ready to perform operations
```dart
var parameters = ConfigParams.fromTuples([
                    'myapp', ConfigParams.fromTuples([
                      'theme', 'blue',
                      'language', 'en'
                    ])
                 ]);

// Sets section parameters
client.setSection(
    null,
    '123',
    parameters
);
```

```dart
// Get section parameters
var parameters = client.getSectionById(
    null,
    '123'
);
```    

## Acknowledgements

This microservice was created and currently maintained by
- **Sergey Seroukhov**.