import 'common.dart';
import 'loc_test.dart' as location;
import 'notification_test.dart' as notification;
import 'wifi_test.dart' as wifi;

Future<void> main() async {
  setUpAll(() {
    // Todo:(Amit) Add here your intial setup if any needed.
  });
  location.main();
  notification.main();
  wifi.main();
}
