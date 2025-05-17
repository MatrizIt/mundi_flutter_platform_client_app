import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/register/cubit/register_cubit.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/register/register_page.dart';

import '../../../models/user.dart';

class RegisterModule extends Module {
  @override
  void binds(Injector i) {
    i.addSingleton<User>(User.new);
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      '/',
      child: (context) => BlocProvider(
        create: (context) => RegisterCubit(repository: Modular.get()),
        child: const RegisterPage(),
      ),
    );
  }
}
