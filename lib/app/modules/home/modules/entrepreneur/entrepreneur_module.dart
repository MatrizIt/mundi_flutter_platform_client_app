import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/entrepreneur/cubit/entrepreneur_cubit.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/entrepreneur/entrepreneur_page.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/entrepreneur/modules/reserve/reserve_module.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/entrepeneur/i_entrepreneur_repository.dart';

class EntrepreneurModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {

    r.child(
      '/',
      child: (context) => BlocProvider(
        create: (context) => EntrepreneurCubit(
            repository: Modular.get<IEntrepreneurRepository>())
          ..loadData(r.args.data),
        child: EntrepreneurPage(entrepreneurId: r.args.data),
      ),
    );
    r.module(
      '/reserve',
      module: ReserveModule(),
    );
    super.routes(r);
  }
}
