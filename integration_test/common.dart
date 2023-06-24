import 'package:flutter_test/flutter_test.dart';
import 'package:patrol/patrol.dart';
import 'package:patrol_app/main.dart';

export 'package:flutter_test/flutter_test.dart';
export 'package:patrol/patrol.dart';

final _patrolTesterConfig = PatrolTesterConfig();
final _nativeAutomatorConfig = NativeAutomatorConfig();

Future<void> createApp(PatrolTester $) async {
  // await setUpTimezone();
  await $.pumpWidget(const ExampleApp());
}

void patrol(
  String description,
  Future<void> Function(PatrolTester) callback, {
  bool? skip,
}) {
  patrolTest(
    description,
    config: _patrolTesterConfig,
    nativeAutomatorConfig: _nativeAutomatorConfig,
    nativeAutomation: true,
    skip: skip,
    callback,
  );
}
