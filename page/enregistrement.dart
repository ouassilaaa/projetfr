import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SignupScreen extends StatefulWidget {

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {

  final GlobalKey <FormState> _formKey = GlobalKey ();
  TextEditingController _passwordController = new TextEditingController();

  void _submit()
  {
    if (_formKey.currentState!.validate()){
      _formKey.currentState!.save();
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign up'),
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
                height: 300,
                width: 300,
                padding: EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          decoration: InputDecoration(labelText: 'Email'),
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) {

                            //vérifier condition
                            if (value =="" ) {
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
                            controller: _passwordController,
                            validator: (value)
                            {

                              //vérifier condition
                              if(value == "" || value!.length<8)
                              {
                                return 'Invalid paseword';
                              }
                              return null;

                            },
                            onSaved: (value)
                            {}



                        ),
                        TextFormField(
                            decoration: InputDecoration(
                                labelText: 'Confirm password'),
                            obscureText: true,
                            validator: (value)
                            {

                              //vérifier condition
                              if(value!.isEmpty || value != _passwordController.text)
                              {
                                return 'Invalid password';
                              }
                              return null;

                            },
                            onSaved: (value)
                            {

                            },


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


