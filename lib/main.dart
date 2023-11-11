import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/pag_ini.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';

import 'bloc/auth_bloc.dart'; // Importe a página inicial aqui

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey:"AIzaSyDbNG0ZRSC0DOKkxCmcKYi_Bw3UYE5Bx3k" , 
      appId: "1:375735349487:web:6e67bbc4721b2b17252b1a", 
      messagingSenderId: "375735349487",
      authDomain: "mercadovirtual-6196d.firebaseapp.com",
      projectId:"mercadovirtual-6196d",
      storageBucket: "mercadovirtual-6196d.appspot.com"
      )
    
    );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(create: (context) => AuthBloc()),
        // Outros Blocs que você deseja fornecer...
      ],
      child: MaterialApp(
        title: 'Mercado Virtual',
        theme: ThemeData(
          primarySwatch: Colors.red,
        ),
        home: const PaginaInicial(),
      ),
    );
  }
}
