import 'package:flutter/material.dart';

void main(){
  runApp(new MyApp());
}

class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
    home: new LoginPage(),
      theme: new ThemeData(
        primarySwatch: Colors.green,
        accentColor: Colors.red,
        brightness: Brightness.light,
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;


  @override
  void initState(){
    super.initState();
    _iconAnimationController = new AnimationController(
        vsync: this, duration: new Duration(seconds: 1)
    );
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.easeInCubic,);
    _iconAnimation.addListener(()=> this.setState((){}));
    _iconAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.blue,
      body: new Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
              image: AssetImage("assets/hospital.jpg"),
      fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.hardLight,
          ),
          new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new FlutterLogo(
                size: _iconAnimation.value * 100,
              ),
              new  Form(

                child: Theme(
                  data: new ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.teal,

                  ),
                  child: new TextFormField(
                    decoration: new InputDecoration(
                      labelText: "Enter Email"
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
              ),
              new Form(
                child: Theme(
                  data: ThemeData(
                    primarySwatch: Colors.teal,
                    brightness: Brightness.dark,
                  ),


                  child: new TextFormField(
                    decoration: new InputDecoration(
                        labelText: "Password"
                    ),
                    keyboardType: TextInputType.text,
                    obscureText: true,
                  ),
                ),

              ),
              new MaterialButton(
                color: Colors.teal,
                textColor: Colors.white,
                child: new Text("Login"),
                onPressed: ()=>{},

              )
            ],
          )
        ],
      ),
    );
  }
}
