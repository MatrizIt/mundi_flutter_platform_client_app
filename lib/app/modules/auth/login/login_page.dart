import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;
import 'package:mundi_flutter_platform_client_app/app/core/ui/extension/size_screen_extension.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/colors_app.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/styles/text_styles.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/app_button.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/app_text_field.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/default_padding.dart';
import 'package:mundi_flutter_platform_client_app/app/core/ui/widgets/mundi_app_bar.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/login/cubit/login_cubit.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/login/cubit/login_state.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/login/widgets/gradient_divider.dart';
import 'package:mundi_flutter_platform_client_app/app/modules/auth/login/widgets/login_method.dart';
import 'package:validatorless/validatorless.dart';

import '../../../core/ui/helpers/messages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Messages<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
        state.status.matchAny(
          success: () {
            showSuccess("Login Efetuado com sucesso");
            Modular.to.navigate('/home');
          },
          error: () {
            showError(state.errorMessage ?? "Erro não informado");
          },
          any: () {},
        );
      },
      builder: (context, state) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: const Color.fromRGBO(6, 14, 39, 1),
          body: DefaultPadding(
            bgImagePath: 'assets/images/ellipses/login/loginEllipses.png',
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  MundiAppBar(
                    showButton: true,
                    onButtonPress: () {
                      Modular.to.pop();
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                    child: BlurryContainer(
                      width: 1.sw,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 40),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40),
                      ),
                      blur: 20,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Bem-vindo de volta!",
                            style: context.textStyles.titleBold.copyWith(
                              fontSize: 25,
                              color: Colors.white,
                            ),
                          ),
                          Text(
                            "Vamos trabalhar?",
                            style: context.textStyles.textRegular.copyWith(
                              fontSize: 14.33,
                              color: const Color.fromRGBO(164, 164, 164, 1),
                            ),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          AppTextField(
                            label: 'E-mail ou CPF',
                            controller: _emailCtrl,
                            hintText: 'exemplo@exemplo.com',
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          AppTextField(
                            label: 'Senha',
                            obscureText: true,
                            validator: Validatorless.multiple([
                              Validatorless.required("Senha é obrigatória"),
                              Validatorless.min(4, "Senha muito curta"),
                            ]),
                            controller: _passwordCtrl,
                            hintText: '************',
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          InkWell(
                            child: Text("Esqueceu a senha?", style: context.textStyles.titleBold.copyWith(
                              fontSize: 14.33,
                              color: const Color.fromRGBO(164, 164, 164, 1),
                              fontWeight: FontWeight.w300,
                            ),),
                            onTap: (){
                              Modular.to.pushNamed("/auth/recovery",);
                            },
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: AppButton(
                              text: 'Entre',
                              loading: state.status == LoginStateStatus.loading,
                              onPressed: () async {
                                if (_formKey.currentState?.validate() ??
                                    false) {
                                  await context.read<LoginCubit>().login(
                                      _emailCtrl.text, _passwordCtrl.text);
                                }
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const GradientDivider(
                                colors: [
                                  Colors.transparent,
                                  Color.fromRGBO(217, 217, 217, 1),
                                ],
                              ),
                              Text(
                                "Ou continue com",
                                style: context.textStyles.textLight.copyWith(
                                  color: const Color.fromRGBO(182, 182, 182, 1),
                                  fontSize: 12,
                                ),
                              ),
                              const GradientDivider(
                                colors: [
                                  Color.fromRGBO(217, 217, 217, 1),
                                  Colors.transparent,
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              LoginMethod(
                                onPressed: () {},
                                borderColor:
                                    const Color.fromRGBO(25, 118, 210, 1),
                                imagePath: 'assets/images/facebook.png',
                                iconWidth: 12.79,
                                iconHeight: 24.63,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              LoginMethod(
                                onPressed: () {},
                                borderColor: context.colors.decorationPrimary,
                                imagePath: 'assets/images/google.png',
                                iconWidth: 19.39,
                                iconHeight: 19.39,
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              LoginMethod(
                                onPressed: () {},
                                borderColor: Colors.white,
                                imagePath: 'assets/images/apple.png',
                                iconWidth: 16.34,
                                iconHeight: 19.39,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Center(
                            child: Text.rich(
                              TextSpan(
                                text: "Esqueceu a senha? Só ",
                                style: context.textStyles.textLight.copyWith(
                                  color: const Color.fromRGBO(182, 182, 182, 1),
                                  fontSize: 13,
                                ),
                                children: [
                                  TextSpan(
                                    text: "clicar aqui",
                                    style:
                                        context.textStyles.textLight.copyWith(
                                      color: context.colors.decorationPrimary,
                                      fontSize: 13,
                                      decoration: TextDecoration.underline,
                                    ),
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () {},
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
