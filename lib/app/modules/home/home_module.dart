import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/core/rest/rest_client.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/cubit/home_cubit.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/chat/chat_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/entrepreneur/entrepreneur_module.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/profile/profile_module.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/schedules/cubit/schedules_cubit.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/entrepeneur/entrepreneur_repository.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/entrepeneur/i_entrepreneur_repository.dart';
import 'package:mundi_flutter_platform_client_app/app/repository/schedule/i_schedule_repository.dart';

import '../../repository/schedule/schedule_repository.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  void binds(Injector i) {
    i.addInstance<IScheduleRepository>(
      ScheduleRepository(
        rest: Modular.get<RestClient>(),
      ),
    );
    i.addInstance<IEntrepreneurRepository>(
      EntrepreneurRepository(
        rest: Modular.get<RestClient>(),
      ),
    );
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      '/',
      child: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeCubit(
              schedulesRepository: Modular.get<IScheduleRepository>(),
              repository: Modular.get<IEntrepreneurRepository>(),
            )..loadData(),
          ),
          BlocProvider(
            create: (context) => ScheduleCubit(
              scheduleRepository: Modular.get<IScheduleRepository>(),
            )..loadSchedule(),
          )
        ],
        child: const HomePage(currentPage: 0,),
      ),
    );
    r.module(
      '/entrepreneur',
      module: EntrepreneurModule(),
    );
    r.module('/chat', module: ChatModule());
    r.module("/profile", module: ProfileModule());
  }
}
