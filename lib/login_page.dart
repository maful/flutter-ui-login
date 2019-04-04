import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin {

  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController = new AnimationController(
      vsync: this,
      duration: new Duration(milliseconds: 500),
    );
    _iconAnimation = new CurvedAnimation(
      parent: _iconAnimationController,
      curve: Curves.easeOut,
    );
    _iconAnimation.addListener(() => this.setState(() {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          new Image(
            image: AssetImage("assets/girl.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.hardLight,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size: _iconAnimation.value * 100.0,
              ),
              Form(
                child: Theme(
                  data: ThemeData(
                    brightness: Brightness.dark,
                    primarySwatch: Colors.cyan,
                    inputDecorationTheme: InputDecorationTheme(
                      labelStyle: TextStyle(
                        color: Colors.cyan,
                        fontSize: 20.0,
                      ),
                    ),
                  ),
                  child: Container(
                    padding: EdgeInsets.all(40.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Enter Email",
                          ),
                          keyboardType: TextInputType.emailAddress,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Enter Password",
                          ),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 40.0),
                          child: MaterialButton(
                            color: Colors.cyan,
                            textColor: Colors.white,
                            child: Text("Login"),
                            onPressed: () {},
                            splashColor: Colors.redAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}