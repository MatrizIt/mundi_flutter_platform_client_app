import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/core/storage/local_storage.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/login/cubit/login_cubit.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/login/login_page.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/recovery/cubit/recovery_password_cubit.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/recovery/recovery_password_page.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/auth/auth_repository.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/auth/i_auth_repository.dart';

class RecoveryPasswordModule extends Module {
  @override
  void binds(Injector i) {
    i.addLazySingleton<IAuthRepository>(
          () => AuthRepository(
          rest: Modular.get(),
          LocalStorage: Modular.get<LocalStorage>()
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      '/',
      child: (context) => BlocProvider(
        create: (context) => RecoveryPasswordCubit(
          authRepository: Modular.get<IAuthRepository>(),
          localStorage: Modular.get<LocalStorage>(),
        ),
        child: const RecoveryPasswordPage(),
      ),
    );
  }
}
