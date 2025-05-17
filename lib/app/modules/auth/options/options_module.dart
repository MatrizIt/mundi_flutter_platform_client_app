import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/options/options_page.dart';

class OptionsModule extends Module {
  @override
  void binds(Injector i) {}

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      '/',
      child: (context) => const OptionsPage(),
    );
  }
}
