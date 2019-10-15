import 'package:dog_source/screen/home/HomePage.dart';
import 'package:dog_source/service/LoginService.dart';
import 'package:flutter/material.dart';
import 'package:dog_source/screen/PageBase.dart';

class LoginPage extends StatefulWidget{

  @override
  _LoginPageState createState() => _LoginPageState();

}

class _LoginPageState extends State<LoginPage>{
  final _formKey = GlobalKey<FormState>();
  final _service = LoginService();
  String _userForm = "";
  String _passwordForm = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) => Form(
          key: _formKey,
          child: Container(
            padding: EdgeInsets.only(top: 60, left: 40, right: 40),
            color: Colors.white,
            child: ListView(children: <Widget>[
              SizedBox(
                height: 128,
                width: 128,
                child: Image.asset(PageBase.LOGO_IMAGE),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: PageBase.generateDecorate("E-mail"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter your E-mail';
                    }
                    return null;
                  },
                  onSaved: (val) => setState(() => _userForm = val),
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: PageBase.generateDecorate("Password"),
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter your Password';
                  }
                  return null;
                },
                onSaved: (val) => setState(() => _passwordForm = val),
              ),
              Container(
                height: 40,
                alignment: Alignment.centerRight,
                child: FlatButton(
                  child: Text(
                    "Recupear Senha",
                    textAlign: TextAlign.right,
                  ),
                  onPressed: () {},
                ),
              ),
              SizedBox(height: 40),
              Container(
                height: 60,
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        stops: [0.3,1],
                        colors: [Color(0xFFF58524), Color(0XFFF92B7F),
                    ]),
                    borderRadius: BorderRadius.all(
                    Radius.circular(5)
                  )),
                child: SizedBox.expand(
                  child: FlatButton(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text("Login",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 20
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Container(
                          child: SizedBox(
                            child: Image.asset(PageBase.BONE_IMAGE),
                            height: 28,
                            width: 28,
                          ),
                        )
                      ],
                    ),
                    onPressed: () async{
                      final form = _formKey.currentState;
                      if (form.validate()) {
                        form.save();
                        _showDialog(context);
                         await _service.getAccess(_userForm, _passwordForm)
                         .then((onValue){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
                         })
                         .catchError((onError){
                            _showAlertDialog1(context);
                         });
                        
                      }
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: Color(0xFF3C5A99),
                  borderRadius: BorderRadius.all(Radius.circular(5))
                ),
                child:
                  SizedBox.expand(
                    child: FlatButton(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Login com Facebook",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 20),
                              textAlign: TextAlign.left,
                          ),
                          Container(
                            child: SizedBox(
                              child: Image.asset(PageBase.FACEBOOK_ICON_IMAGE),
                              height: 28,
                              width: 28,
                            ),
                          )
                        ],
                      ),
                      onPressed: (){},
                    ),
                  )
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  height: 40,
                  child: FlatButton(
                    child: Text(
                      "Cadastre-se",
                      textAlign: TextAlign.center,
                    ),
                    onPressed: (){},
                  ),
                )
            ])
          )  
        ),
      )
    );
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text('Waiting...'), duration: Duration(seconds: 7),));
  }

  _showAlertDialog1(BuildContext context) { 
    // configura o button
  Widget okButton = FlatButton(
    child: Text("OK"),
    onPressed: () { Navigator.of(context).pop();},
  );
  // configura o  AlertDialog
  AlertDialog alerta = AlertDialog(
    title: Text("Autenticação"),
    content: Text("Login ou Senha Inválida!"),
    actions: [
      okButton,
    ],
  );
  // exibe o dialog
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alerta;
    },
  );
}
}
