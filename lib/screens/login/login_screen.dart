import 'package:lojavirtual/models/user_manager.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

import '../../helpers/validators.dart';
import '../../models/user.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formKey,
            child: Consumer<UserManager>(
              builder: (_,userManager, __) {
                return ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(30.0),
                      child: Image(image: AssetImage('assets/images/ecommerce.png'), width: 120),
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    TextFormField(
                      decoration: const InputDecoration(hintText: 'Email'),
                      controller: emailController,
                      enabled: !userManager.loading,
                      keyboardType: TextInputType.emailAddress,
                      autocorrect: false,
                      validator: (email) {
                        if(!emailValid(email!)){
                          return "E-mail inválido";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    TextFormField(
                      controller: passwordController,
                      enabled: !userManager.loading,
                      decoration: const InputDecoration(hintText: 'Senha'),
                      autocorrect: false,
                      obscureText: true,
                      validator: (password) {
                        if(password != null){
                          if (password.isEmpty || password.length < 6) {
                            return "Senha inválida";
                          }
                          return null;
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: const Text('Esqueci minha senha'),
                      ),
                    ),
                    SizedBox(
                      height: 44,
                      child: ElevatedButton(
                        onPressed: userManager.loading ? null : () {
                          final validate = formKey.currentState?.validate();
                          if(validate != null && validate){
                            userManager.signIn(
                              user: SignInUser(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                              onSuccess: (user) {
                                // TODO: FECHAR TELA DE LOGIN
                              },
                              onFail: (message) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    backgroundColor: Colors.redAccent,
                                    content: Text(message),
                                  ),
                                );
                              },
                            );
                          }
                        },
                        style:  ElevatedButton.styleFrom(
                          primary: Theme.of(context).primaryColor,
                          onSurface: Theme.of(context).primaryColor.withAlpha(100),
                        ),
                        child: userManager.loading ?
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                             ),
                          ) :
                           const Text(
                          'Entrar',
                          style: TextStyle(
                            fontSize: 18,
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }
            ),
          ),
        ),
      ),
    );
  }
}
