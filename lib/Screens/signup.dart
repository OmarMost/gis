import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:gis/Screens/home.dart';



class Sign_up extends StatefulWidget {
  const Sign_up({super.key, required void Function() onPressed});

  @override
  State<Sign_up> createState() => _Sign_upState();
}

class _Sign_upState extends State<Sign_up> {
    // final nameController = TextEditingController();
  //  final collegeIdController = TextEditingController();
   final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confpasswordController = TextEditingController();
  bool _isSecurePassword1 = true;
  bool _isSecurePassword2 = true;

   void signup() async {
    if (passwordController.text == confpasswordController.text) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(),
          ));
    } else {
      print('Password doesnt match');
    }
  }

  @override
 Widget build(BuildContext context)  {
    return Scaffold(
      appBar: AppBar(
        leading:const BackButton(),
        title:const Text("Back"),
        centerTitle: false,
        backgroundColor: Colors.white,),
      body : Padding(
        padding: const EdgeInsets.all(15.0),
        child : SingleChildScrollView(
       child :Column(
        children : 
        [
        Row(
          children: [
            const Text (
            'Sign up',
             
                   style: TextStyle(
            fontSize: 40.0,
            fontWeight: FontWeight.bold,
                   ),
                  ),
          ],
        ),
      const SizedBox(height:30.0 ,),
      TextFormField(
        //controller: nameController,
       decoration: const InputDecoration(
       labelText: 'Name',
       prefixIcon: Icon(Icons.person),
       enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.orange)
       )
       )
       ),
       const SizedBox(height: 20.0,),
       TextFormField(
        //controller: collegeIdController,
        keyboardType: TextInputType.phone,
         decoration:const InputDecoration(
          labelText: 'College Id',
          prefixIcon: Icon(Icons.credit_card),
          enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: Colors.orange))
         )
       ),
      const SizedBox(height: 20.0,),
       TextFormField(
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        decoration:const InputDecoration(
          labelText: 'Email',
          prefixIcon: Icon(Icons.email),
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange))
        )
       ),
     const SizedBox(height: 20.0,),
       TextFormField(
        controller: passwordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isSecurePassword1,
        decoration: InputDecoration(
          labelText: 'Password',
          prefixIcon: Icon(Icons.lock_open),
          suffixIcon: togglePassword(),
         
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange)) 
        
        )
        ),
         SizedBox(height: 20.0,),
       TextFormField(
        controller: confpasswordController,
        keyboardType: TextInputType.visiblePassword,
        obscureText: _isSecurePassword2,
        decoration: InputDecoration(
          labelText: 'Confirm Password',
          prefixIcon: Icon(Icons.lock),
          suffixIcon: togglePassword2(),
        
          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.orange) )
        ),
        ),
        SizedBox(height: 20.0,),
        Container(
          width: 320.0,
          color: Colors.orange,
          height: 50.0,
       child: MaterialButton(
          onPressed:() {
            Navigator.push(context,
             MaterialPageRoute(builder: (context) => Home()));
          },
          child: Text(
            'Sign Up',
            style: TextStyle(
              fontSize: 20.0,
              color: Colors.white,
            ),
          ),
          ),
        ),
        SizedBox(height: 10.0,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'I have read & agreed to DayTask',
              style: TextStyle(
                fontSize: 11.5,
                color: Colors.blueAccent,
                     
              ),

              ),
            
            TextButton(
              onPressed: () {},
            child: Text(
              'Privacy Policy" Terms & Condition',
              style: TextStyle(
                fontSize: 11.5,
                color: Colors.orange,
              ),
             ),
            )
          ],
        )
        ]
    ),
        ),
    ),
    );
  }
  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
            _isSecurePassword1 = !_isSecurePassword1;
      });
    }, icon:_isSecurePassword1 ?Icon(Icons.visibility):Icon(Icons.visibility_off),
    color: Colors.grey, );
  }
   Widget togglePassword2(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword2 = !_isSecurePassword2; 
      }); 
    }, icon:_isSecurePassword2 ?Icon(Icons.visibility):Icon(Icons.visibility_off),
    color: Colors.grey, );
}
}