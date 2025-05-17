import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/core/storage/local_storage.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/recovery/recovery_password_module.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/register/register_module.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/auth/auth_repository.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/auth/i_auth_repository.dart';

import 'login/login_module.dart';
import 'options/options_module.dart';

class AuthModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton<IAuthRepository>(
      () => AuthRepository(
          rest: Modular.get(), LocalStorage: Modular.get<LocalStorage>()),
    );
  }

  @override
  void binds(Injector i) {
    i.addLazySingleton<IAuthRepository>(
      () => AuthRepository(
          rest: Modular.get(), LocalStorage: Modular.get<LocalStorage>()),
    );
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.module(
      "/login",
      module: LoginModule(),
    );
    r.module(
      "/register",
      module: RegisterModule(),
    );
    r.module(
      "/options",
      module: OptionsModule(),
    );
    r.module("/recovery", module: RecoveryPasswordModule());
  }
}
