import 'package:flutter_modular/flutter_modular.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/profile/modules/details/details_profile_module.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/profile/profile_page.dart';


class ProfileModule extends Module {
  @override
  void exportedBinds(Injector i) {
  }

  @override
  void binds(Injector i) {
  }

  @override
  void routes(RouteManager r) {
    super.routes(r);
    r.child(
      '/',
        child: (context) =>  const ProfilePage(),
    );
    r.module(
      "/details",
      module: DetailsProfileModule(),
    );
  }
}
