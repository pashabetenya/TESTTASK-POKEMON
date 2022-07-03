import 'package:application/core/services/navigation_service.dart';
import 'package:get_it/get_it.dart';

final _getIt = GetIt.I;

NavigationService get navigationService => _getIt.get<NavigationService>();

class DependencyService {
  static void registerDependencyService() {
    _getIt.registerLazySingleton(() => NavigationService());
  }
}
