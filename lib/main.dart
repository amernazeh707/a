import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home:Login() ,
));
class Login extends StatefulWidget {


  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailController = TextEditingController();

  var PasswordController= TextEditingController();

  var formKey = GlobalKey<FormState>();

  bool passwordVisible=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: SingleChildScrollView(
          child:Form(
            key:formKey,
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Login',
                      style:TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      )),
                  Center(
                    child: Image(
                        image: AssetImage('assets/images/user.png',),

                        height:100,
                        //width:100,
                        fit: BoxFit.cover),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(

                      labelText: 'Email Address',
                      prefixIcon: Icon(Icons.email),
                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(15),
                          borderSide: BorderSide(color:Colors.blue,width:2)
                      ),
                      focusedBorder:OutlineInputBorder(

                        borderRadius:BorderRadius.circular(15),
                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(15),
                          borderSide:BorderSide(color:Colors.red,width: 2)

                      ),

                    ),

                    onFieldSubmitted: (value) {
                      print(value);
                    },
                    onChanged: (value)
                    {print(value);},
                    validator:(value)
                    {
                      if(value!.isEmpty)
                      {
                        return'Email musn\'t be empty';
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.visiblePassword,
                    controller: PasswordController,
                    obscureText: passwordVisible,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon:  IconButton (
                        icon:Icon(passwordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,

                        ),
                        onPressed: () {
                          passwordVisible =! passwordVisible;
                          setState((){
                            PasswordController;
                          });
                        },
                      ),

                      enabledBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(15),
                          borderSide: BorderSide(color: Colors.blue,width: 2)
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius:BorderRadius.circular(15),

                      ),
                      errorBorder: OutlineInputBorder(
                          borderRadius:BorderRadius.circular(15),
                          borderSide:BorderSide(color:Colors.red,width: 2)

                      ),
                    ),

                    onFieldSubmitted: (value) {
                      print(value);
                    },

                    validator:(value)
                    {
                      if(value!.isEmpty)
                      {
                        return'password musn\'t be empty';
                      }
                      return null;
                    },

                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    width: double.infinity,

                    child: MaterialButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
                          print(emailController.text);
                          print(PasswordController.text);
                        };
                      },
                      child: Text('LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                        ),),

                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15,),
                      color: Colors.blue,
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),

    );
  }
}
