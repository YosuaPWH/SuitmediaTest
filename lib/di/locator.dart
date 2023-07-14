import 'package:get_it/get_it.dart';
import 'package:suitmedia_test/data/services.dart';

final GetIt getItLocator = GetIt.instance;

void setupLocator() {
  getItLocator.registerSingletonAsync<Services>(() async {
    return Services();
  });
}