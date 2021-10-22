import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginScreen extends StatefulWidget {

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final GlobalKey <FormState> _formKey = GlobalKey ();

  void _submit()
  {

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.lightGreenAccent,
                      Colors.white
                    ]
                )
            ),
          ),
          
          Center(
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Container(
                height: 260,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                          //vérifier condition
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'invalid email';
                            }
                            return null;
                          },
                          onSaved: (value)
                            {},

                        ),
                        TextFormField(
                          decoration: InputDecoration(
                          labelText: 'Passeword'),
                          obscureText: true,
                          validator: (value)
                          {

                            //vérifier condition
                            if(value!.isEmpty || value.length<=8)
                              {
                                return 'invalid paseword';
                              }
                            return null;

                          },
                          onSaved: (value)
                          {}



                          ),
                        SizedBox (
                          height: 30,
                        ),
                        RaisedButton(
                          child: Text(
                              'Submit'
                          ),
                          onPressed: ()
                            {
                              _submit();
                            },
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)
                          ),
                          color:Colors.white,
                          textColor: Colors.green,
                        )


                      ],
                    ),
                  ),
                ),
              ),
              
            ),
          )

        ],
      ),

    );
  }
}



