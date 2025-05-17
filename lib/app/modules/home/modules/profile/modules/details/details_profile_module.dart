import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/core/storage/local_storage.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/profile/modules/details/cubit/details_profile_cubit.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/profile/modules/details/details_profile_page.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/auth/auth_repository.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/auth/i_auth_repository.dart';

class DetailsProfileModule extends Module {
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
    r.child(
      '/',
      child: (context) => BlocProvider(
        create: (context) =>
            DetailProfileCubit(authRepository: Modular.get<IAuthRepository>())
              ..findOneById(r.args.data['userId']),
        child: DetailsProfilePage(name: r.args.data['name'], userId: r.args.data['userId']),
      ),
    );
  }
}
