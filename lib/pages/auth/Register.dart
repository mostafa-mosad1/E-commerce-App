import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/ShareReference/ShareReference.dart';
import 'package:shop_app/main.dart';
import 'package:shop_app/pages/auth/cubit/states.dart';
import 'package:flutter/cupertino.dart';

import '../../compant.dart';
import '../Home/HomeLayOut.dart';
import 'cubit/cubit.dart';

class Register extends StatelessWidget {
  const Register({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController phoneController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController imageController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
      create: (context) => logInCubit(),
      child: BlocConsumer<logInCubit,shopStates>(
        listener: (context, state) {
          if(state is shopScuessRegister){
           if(state.registerModel.status ==true){
             ShowToast(text: logInCubit.get(context).registerModel!.message.toString(),stutes:toastStutes.suess );

              Navigator.pop(context);

           }else
           {
             ShowToast(text: logInCubit.get(context).registerModel!.message.toString(),stutes:toastStutes.error );

           }
          }
        },
        builder: (context, state) =>Material(
          child: Padding(
            padding:  EdgeInsets.all(10.0),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                Text("Register",style: TextStyle(fontSize: 30,),),
                  SizedBox(
                    height: 25,
                  ),
                DefultTextForm(
                    controller: nameController,
                    validatorPostion: true,
                    Textvalidator: "please enter name",
                    hintText: "please enter name",
                    labelText: "please enter name",
                    prefixIcon: Icon(Icons.email_outlined),
                    circular: 10),
                SizedBox(
                  height: 20,
                ),
                DefultTextForm(
                    controller: phoneController,
                    validatorPostion: true,
                    Textvalidator: "please enter phone",
                    hintText: "please enter phone",
                    labelText: "please enter phone",
                    prefixIcon: Icon(Icons.email_outlined),
                    circular: 10),
                SizedBox(
                  height: 20,
                ),
                DefultTextForm(
                    controller: emailController,
                    validatorPostion: true,
                    Textvalidator: "please enter email",
                    hintText: "please enter email",
                    labelText: "please enter email",
                    prefixIcon: Icon(Icons.email_outlined),
                    circular: 10),
                SizedBox(
                  height: 20,
                ),
                DefultTextForm(
                    controller: passwordController,
                    validatorPostion: true,
                    Textvalidator: "please enter password",
                    hintText: "please enter password",
                    labelText: "please enter password",
                    prefixIcon: Icon(Icons.email_outlined),
                    circular: 10),
                SizedBox(
                  height: 20,
                ),
                DefultTextForm(
                    controller: imageController,
                    validatorPostion: false,
                    Textvalidator: "please enter image",
                    hintText: "please enter image",
                    labelText: "please enter image",
                    prefixIcon: Icon(Icons.email_outlined),
                    circular: 10),
                SizedBox(
                  height: 20,
                ),
                  Button(
                      text: "Register",
                      textColor: Colors.white,
                      onPressed: (){
                        if(formKey.currentState!.validate())
                        {
                          logInCubit.get(context).getRegisterData(
                            name:nameController.text ,
                            phone: phoneController.text ,
                            email:emailController.text ,
                            password: passwordController.text,
                            image: imageController.text,
                          );

                        }
                      }),


              ],),
            ),
          ),
        ) ,
      ),
    );
  }
}
