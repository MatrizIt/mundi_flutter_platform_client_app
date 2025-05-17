import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/extension/size_screen_extension.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/app_button.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/app_text_field.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/profile/modules/details/cubit/details_profile_cubit.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/profile/modules/details/cubit/details_profile_state.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/home/modules/profile/widgets/profile_tile.dart';
import 'package:validatorless/validatorless.dart';

import '../../../../../../core/ui/helpers/messages.dart';


class DetailsProfilePage extends StatefulWidget {
  final String name;
  final int userId;

  const DetailsProfilePage({required this.name, required this.userId, super.key});

  @override
  State<DetailsProfilePage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsProfilePage> with Messages<DetailsProfilePage>{
  final name = TextEditingController();
  final email = TextEditingController();
  final telefone = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ProfileTile(name: widget.name,),
            Image.asset(
              'assets/images/dark_logo.png',
              height: 25,
            ),
          ],
        ),
      ),
      body: BlocConsumer<DetailProfileCubit, DetailProfileState>(
        listener: (context, state) {
          print("Usuario state > ${state.user.toString()}");
          name.text = state.user!.name;
          email.text = state.user!.email;
          telefone.text = state.user!.phone;

          // TODO: implement listener
        },
        builder: (context, state) {
          print("Usuario state > ${state.user.toString()}");

          return BlurryContainer(
            color: const Color.fromRGBO(6, 14, 39, 1),
            width: 1.sw,
            padding: const EdgeInsets.symmetric(
                horizontal: 30, vertical: 40),
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            blur: 20,
            child: Column(
              children: [
                AppTextField(
                  hintText: 'Nome',
                  label: 'Nome',
                  controller: name,
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  hintText: 'Email',
                  label: 'Email',
                  controller: email,
                  validator: Validatorless.multiple([
                    Validatorless.email("E-mail inválido")
                  ]),
                ),
                const SizedBox(
                  height: 15,
                ),
                AppTextField(
                  hintText: 'Telefone',
                  label: 'Telefone',
                  controller: telefone,
                  formatters: [
                    MaskTextInputFormatter(mask: "(##) #####-####"),
                  ],
                ),
                const SizedBox(
                  height: 45,
                ),
                Center(
                  child: AppButton(
                    text: 'Alterar',
                    onPressed: () async {
                      BlocProvider.of<DetailProfileCubit>(context).updateUser(widget.userId, name.text, email.text, telefone.text);
                      showSuccess("Alterado com Sucesso !");

                      Modular.to.navigate('/home/');

                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
