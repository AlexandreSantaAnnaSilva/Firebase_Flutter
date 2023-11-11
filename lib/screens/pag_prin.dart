import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/pag_ini.dart';

class PaginaPrincipal extends StatelessWidget {
  const PaginaPrincipal({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Página Principal'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const PaginaInicial(),
                ),
              );
            },
            tooltip:
                'Deslogar', // Texto que será exibido quando o usuário tocar e segurar o botão
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Pagina principal do Mercado Aberto',
              style: TextStyle(fontSize: 24),
            ),
            Container(
              width: 150,
              margin: const EdgeInsets.all(20.0),
              child: Image.asset('assets/images/mercado.png',
                  height: 200,
                ),
            ),
          ],
        ),
      ),
    );
  }
}
