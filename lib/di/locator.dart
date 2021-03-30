import 'package:get_it/get_it.dart';
import '../data/hive/hive_service.dart';
import '../data/net/net_service.dart';

GetIt locator = GetIt.instance;

Future<void> locatorSetup() async {
  locator.registerSingleton(HiveService());
  await locator.get<HiveService>().init();
  locator.registerFactory(() => NetService());
}
