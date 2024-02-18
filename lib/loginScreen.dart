import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class loginScreen extends StatelessWidget {

var emailController= TextEditingController();
var passwordController= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),

        body: Padding(
          padding: const EdgeInsets.all(8.0),
        
          child :Column(
            crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          
            Text(
              'Login'

            ),
          
            SizedBox(
              height: 40,
            ),

            
            TextFormField(
              controller: emailController,
              onFieldSubmitted: (value) 
              {
        print(value);
              },
            decoration: InputDecoration(
            
            labelText: 'email address',
            prefixIcon: Icon(
              Icons.email,
            ),
            border: OutlineInputBorder(),
          ),
            ),
            
            SizedBox(
              height:15 ,
            ),

           
            TextFormField(
              controller: passwordController,

              onFieldSubmitted: (value)
              {
                print(value);
              },
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'password',
                suffix: Icon(
                  Icons.lock,
                ),
                prefixIcon:Icon(
                  
                  Icons.password,
                ),
                border: OutlineInputBorder(),

              ),
            ),
        
         SizedBox(
          height: 15,
         ),

            Container(
              width: double.infinity,
              color: Colors.blue,
              child: MaterialButton(
                onPressed:() 
                {
                  print(emailController.text);
                  print(passwordController.text);
                },
                
              child:  Text ('login',
              style: TextStyle
              (
                color:Colors.white
                ),
              ),
              
              
              
              ),
            ),
         
          ],


        ),
        ),
        
      
    );
  }
}