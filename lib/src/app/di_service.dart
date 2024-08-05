import 'package:get_it/get_it.dart';
import 'package:next_match/src/core/api/network_service.dart';
import 'package:next_match/src/core/services/prefs_service.dart';

final di = GetIt.instance;

class DiService {
  static init() async {
    // PrefsService
    di.registerLazySingleton(() => PrefsService());
    await di<PrefsService>().init();

    // NetworkService
    di.registerLazySingleton(
      () => NetworkService(
        prefsService: di(),
      ),
    );

    // splashScreen
    // di.registerLazySingleton(
    //   () => AppVersionRemoteDataSource(
    //     networkService: di(),
    //   ),
    // );
    // di.registerLazySingleton(
    //   () => AppVersionRepository(
    //     appVersionRemoteDataSource: di(),
    //   ),
    // );
    // di.registerLazySingleton(
    //   () => SplashCubitDartCubit(
    //     appVersionRepository: di(),
    //   ),
    // );

    // // selectCountryScreen
    // di.registerLazySingleton(
    //   () => SelectCountryRemoteDataSource(
    //     networkService: di(),
    //   ),
    // );
    // di.registerLazySingleton(
    //   () => SelectCountryRepository(
    //     selectCountryRepository: di(),
    //   ),
    // );
    // di.registerLazySingleton(
    //   () => SelectCountryCubit(
    //     selectCountryRepository: di(),
    //   ),
    // );

    // // selectLanguageScreen
    // di.registerLazySingleton(
    //   () => SelectlanguageRemoteDataSource(
    //     networkService: di(),
    //   ),
    // );
    // di.registerLazySingleton(
    //   () => SelectLanguageRepository(
    //     selectLanguageRepository: di(),
    //   ),
    // );
    // di.registerLazySingleton(
    //   () => SelectLanguageCubit(
    //     selectLanguageRepository: di(),
    //   ),
    // );

    // // LandingScreen
    // di.registerLazySingleton(
    //   () => LandingScreenRemoteDataSource(
    //     networkService: di(),
    //   ),
    // );
    // di.registerLazySingleton(
    //   () => LandingScreenRepository(
    //     landingRepository: di(),
    //   ),
    // );
    // di.registerLazySingleton(
    //   () => LandingScreenCubit(
    //     landingRepository: di(),
    //   ),
    // );
  }
}
