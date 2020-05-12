import 'package:pip_clients_settings/pip_clients_settings.dart';
import 'package:pip_services3_commons/pip_services3_commons.dart';
import 'package:test/test.dart';

class TestModel
{
	static SettingsSectionV1 createSettingsSection()
	{
		var section = SettingsSectionV1();
		section.fromJson(
		{
			'id' : IdGenerator.nextLong(),
      'parameters': ConfigParams.fromTuples([
                        'key1', 'value11',
                        'key2', 'value12'
                        ]),
			'update_time' : RandomDateTime.nextDateTime(new DateTime(2010, 1, 1), DateTime.now()).toIso8601String(),
		});
		return section;
	}

  static ConfigParams createConfigParams({int keysCount = 5})
  {
      var params = ConfigParams();
      for (var i = 0; i < keysCount; i++) {
        params[IdGenerator.nextLong()] = RandomText.text(10);
      }
      return params;
  }

	static void assertEqual(SettingsSectionV1 expected, SettingsSectionV1 actual)
	{
		expect(expected, isNotNull);
		expect(actual, isNotNull);
		expect(actual.id, expected.id);
		expect(actual.update_time, expected.update_time);

		asserEqualConfigParams(expected.parameters, actual.parameters);
	}

  static void asserEqualConfigParams(ConfigParams expected, ConfigParams actual)
  {
    expect(actual.toString(), expected.toString());
  }
}
