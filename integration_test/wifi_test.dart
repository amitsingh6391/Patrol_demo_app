import 'common.dart';

void main() {
  patrolTest('disables and enables airplane mode twice', nativeAutomation: true,
      ($) async {
    await createApp($);

    await $.native.disableWifi();
    await $.native.enableWifi();
    await $.native.disableWifi();
    await $.native.enableWifi();
  });
}
