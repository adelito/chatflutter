import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ChatProject',
      theme: ThemeData.light(),
      initialRoute: MyHomePage.id,
      routes: {
          MyHomePage.id: (context)=>MyHomePage(),
          Registro.id: (context)=> Registro(),
          Login.id: (context)=>Login(),
      },

    );
  }
}

class MyHomePage extends StatelessWidget {
  static const String id = "HomeScreen";
  @override
  Widget build (BuildContext context){
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Hero(
                  tag: 'logo', 
                  child: Container(
                    width: 100.0,
                    child: Image.asset("images/logo.png"),
                  ),
                  ),
                  Text(
                    "ChatFlutter",
                    style: TextStyle(fontSize: 40.0),
                  ),
              ],
            ),
            SizedBox(
              height: 50.0,
            ),
            CustomButton(
              text: "Entrar",
              callback:(){
                  Navigator.of(context).pushNamed(Login.id);
              }
            ),
            CustomButton(
              text: "Novo Usuário",
              callback:(){
                Navigator.of(context).pushNamed(Registro.id);
              }
            )
          ],)
      );
  }

}

class CustomButton extends StatelessWidget{
    final VoidCallback callback;
    final String text;

    const CustomButton({Key key, this.callback, this.text}) : super (key: key);
    @override
    Widget build(BuildContext context){
      return Container(
        padding: const EdgeInsets.all(8.0),
        child: Material(
          color: Colors.blueGrey,
          elevation: 6.0,
          borderRadius: BorderRadius.circular(30.0),
          child: MaterialButton(
            onPressed: callback,
            minWidth: 200.0,
            height: 45.0,
            child: Text(text),
            ),

        ),
      );
    }
}

class Registro extends StatefulWidget{
 static const String id = "Registro";
 @override
 _Registro createState()=> _Registro();

}
class _Registro extends State<Registro>{
    String phone;
    String name;
    String password;
    // Conexão com API Rest!!!!!!!!!
    
    /*
    APOS RETORNO DA API COM O NAME_USER, DIRECIONA PARA O CHAT.
    Navigator.push(
      context,
      MaterialPageRoute(Builder: (context)=>Chat(
        user: user,)
        ),
    ),*/
    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Cadastro novo usuário"),
        ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
               child: Image.asset("images/logo.png"),
              ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
          TextField(
            keyboardType: TextInputType.text,
            onChanged: (value) => name = value,
            decoration: InputDecoration(
              hintText: "Informe seu nome",
              border: const OutlineInputBorder(),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) => phone = value,
            decoration: InputDecoration(
              hintText: "Informe numero telefone",
              border: const OutlineInputBorder(),
            ),
          ),
           SizedBox(
            height: 40.0,
          ),
           TextField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => password = value,
            decoration: InputDecoration(
              hintText: "Informe sua senha",
              border: const OutlineInputBorder(),
            ),
          ),
          CustomButton(
            text: "Novo Usuário",
            callback: () async{
              //await registerUser(); METODO PARA REGISTRAR O USUÁRIO IMPLEMENTAÇÃO NA API REST
            },
          )
        ],),
      );

    }
}

class Login extends StatefulWidget{
   static const String id = "Login";
   @override
   _LoginState createState() => _LoginState();
}
class _LoginState extends State<Login>{

  String phone;
  String password;
   // Conexão com API Rest!!!!!!!!!
    
    /*
    APOS RETORNO DA API COM O NAME_USER, DIRECIONA PARA O CHAT.
    Navigator.push(
      context,
      MaterialPageRoute(Builder: (context)=>Chat(
        user: user,)
        ),
    ),*/

    @override
    Widget build(BuildContext context){
      return Scaffold(
        appBar: AppBar(
          title: Text("Acessar chat"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Hero(
              tag: 'logo',
              child: Container(
                child: Image.asset("images/logo.png"),
              ),
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            TextField(
            keyboardType: TextInputType.number,
            onChanged: (value) => phone = value,
            decoration: InputDecoration(
              hintText: "Informe numero telefone",
              border: const OutlineInputBorder(),
            ),
          ),
           SizedBox(
            height: 40.0,
          ),
           TextField(
            keyboardType: TextInputType.text,
            autocorrect: false,
            obscureText: true,
            onChanged: (value) => password = value,
            decoration: InputDecoration(
              hintText: "Informe sua senha",
              border: const OutlineInputBorder(),
            ),
           ),
            CustomButton(
            text: "Entrar Chat",
            callback: () async{
              //await LoginUser(); METODO PARA REGISTRAR O USUÁRIO IMPLEMENTAÇÃO NA API REST
            },
          )
        ],
        ),
      );
    }
}

/*
  1 - Tela principal
  2 - Login
  3 - Tela cadastro 
  4 - Tela do Chat
  MVP - 1 versão
  100% - on-line
  Segundo Plano
*/