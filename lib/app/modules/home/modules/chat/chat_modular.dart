import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/chat/cubit/chat_cubit.dart';
import 'chat_page.dart';

class ChatModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    super.routes(r);

    r.child(
      '/',
      child: (context) => BlocProvider(
        create: (context) => ChatCubit()
          ..initChannel(
              entrepreneurId: r.args.data.entrepreneurId,
              userId: r.args.data.userId),
        child: ChatPage(
            entrepreneurId: r.args.data.entrepreneurId,
            userId: r.args.data.userId),
      ),
    );
  }
}
