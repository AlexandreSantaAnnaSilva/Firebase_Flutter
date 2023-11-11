import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/cadastro.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth_bloc.dart';

class Login extends StatelessWidget {
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  Login({super.key});

  @override
  Widget build(BuildContext context) {
    final authBloc = BlocProvider.of<AuthBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Campo de texto para o "Usuário"
            TextField(
              controller: _usernameController, // Adicionado controller
              decoration: InputDecoration(
                labelText: 'Usuário',
              ),
            ),
            SizedBox(height: 20), // Espaçamento entre os campos de texto
            // Campo de texto para a "Senha"
            TextField(
              controller: _passwordController, // Adicionado controller
              decoration: InputDecoration(
                labelText: 'Senha',
              ),
              obscureText: true, // Para esconder a senha
            ),
            SizedBox(height: 20), // Espaçamento entre os campos de texto
            // Linha de botões
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    // Dispara o evento de login com os valores dos controllers
                    authBloc.add(AuthLoginEvent(
                      email: _usernameController.text, 
                      password: _passwordController.text
                    ));
                  },
                  child: Text('Login'),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Cadastro(),
                      ),
                    );
                  },
                  child: Text('Se registrar'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
