import 'package:flutter/material.dart';

class loginpage extends StatelessWidget{

  late Color myColor;
  late Size mediaSize;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();


  @override
   Widget build(BuildContext context){

    myColor = Theme.of(context).primaryColor;
    mediaSize = MediaQuery.of(context).size;

     return Container(
        decoration: BoxDecoration(
          color: myColor,
          image: DecorationImage(image: AssetImage("assets/images/bg.png"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(myColor.withOpacity(0.3), BlendMode.dstATop)
        )
      ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Stack(children: [
            Positioned(top:80,child: _buildTop()),
            Positioned(bottom:0,child: _buildBottom())
          ],),
      ),
    );
  }

  Widget _buildTop() {
    return SizedBox(
      width: mediaSize.width,
      child: const Column(
        mainAxisSize: MainAxisSize.min,
        children: [
            Icon(
              Icons.accessible_forward_rounded,
              size: 100,
              color: Colors.black,
            ),
            Text(
              "ElderLink",
              style: TextStyle(
                color: Colors.black,
                fontSize: 40,
                fontWeight: FontWeight.w500,
                letterSpacing: 2
              ),
            )
        ],
      ),
    );
  }

  Widget _buildBottom(){
      return SizedBox(
        width: mediaSize.width,
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
               )
                ),
            child: Padding(
              padding: const EdgeInsets.all(34.0),
              child: _buildForm(),
            ),
        ),
      );
  }

  Widget _buildForm(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome",
        style: TextStyle(
          color: Colors.black,
          fontSize: 32,
          fontWeight: FontWeight.w500
        ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text("Please login with your information",style: TextStyle(color: Colors.grey),),
        ),
        const SizedBox(height: 30,),
        Text("Email Address",style: TextStyle(fontSize: 15),),
        _buildInputField(emailController),
        const SizedBox(height: 10),
        Text("Password",style: TextStyle(fontSize: 15),),
        _buildInputField(passwordController,isPassword: true),
        const SizedBox(height: 10,),
        _buildRememberForgot(),
        const SizedBox(height: 10,),
        _buildLoginButton(),
        const SizedBox(height: 10,),
        _buildicons(),
    ]
    );
  }

  Widget _buildInputField(TextEditingController controller,{isPassword = false}){
    return TextField(
        controller: controller,
        decoration: InputDecoration(
          suffixIcon: isPassword ? Icon(Icons.remove_red_eye) : Icon(Icons.done),
        ),
      obscureText: isPassword,
    );
  }

  Widget _buildRememberForgot(){
    return TextButton(onPressed: (){}, child: Text("Forgot Password"));
  }
  
  Widget _buildLoginButton(){
    return ElevatedButton(onPressed: (){
      debugPrint("Email : ${emailController.text}");
      debugPrint("Password : ${passwordController.text}");
    },
        style: ElevatedButton.styleFrom(
          shape: const StadiumBorder(),
          elevation: 20,
          shadowColor: myColor,
          minimumSize: const Size.fromHeight(60)
        ),
        child: const Text("Login",style: TextStyle(fontSize: 22),));
  }

  Widget _buildicons(){
    return Center(
      child: Column(
        children: [
          Text("or Login with",style: TextStyle(color: Colors.grey),),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(
                icon: Image.asset("assets/images/fb.png"),
              ),
              Tab(
                icon: Image.asset("assets/images/google.png"),
              ),
            ],
          )

        ],
      ),
    );
  }
}