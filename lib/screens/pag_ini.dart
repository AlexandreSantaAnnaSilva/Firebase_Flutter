import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/login.dart';
import 'package:flutter_application_1/screens/cadastro.dart';

class PaginaInicial extends StatelessWidget {
  const PaginaInicial({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Inicial'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Mercado Aberto',
              style: TextStyle(fontSize: 24),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              child: Image.asset(
                'assets/images/mercado2.png',
                height: 200,
              ),
            ),
            const Text(
              'A pagina de pesquisa perfeita para você você encontrar seus produtos',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 50),
            ),
            const Text(
              'Faça seu Login:',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Login(),
                  ),
                );
              },
              child: const Text('Clique Aqui'),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
            ),
            const Text(
              'Cadastre-se:',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => Cadastro(),
                  ),
                );
              },
              child: const Text('Clique Aqui'),
            ),
          ],
        ),
      ),
    );
  }
}
