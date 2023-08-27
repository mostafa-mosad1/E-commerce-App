import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_app/ShareReference/ShareReference.dart';
import 'package:shop_app/main.dart';

import 'package:shop_app/pages/Home/HomeLayOut.dart';
import 'package:shop_app/pages/auth/Register.dart';
import '../../compant.dart';
import 'cubit/cubit.dart';
import 'cubit/states.dart';

class logIn extends StatelessWidget {
  const logIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    var formKey = GlobalKey<FormState>();

    return BlocProvider(
        create: (context) => logInCubit(),
    child:BlocConsumer<logInCubit,shopStates>(
    listener: (context, state) {
      if(state is shopScuesslogIn){
        if(state.logInModel.status == true)
        {
         print(state.logInModel.message);
         print(state.logInModel.status);
          ShowToast(text: state.logInModel.message,stutes: toastStutes.suess);
         CachHelper.saveData(key: "token", value: state.logInModel.data.token.toString()).then((value) {
           Navigator.pushReplacement(context,PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => HomeLayOut()));
         });
         token = state.logInModel.data.token.toString();
        }else
        {
            print(state.logInModel!.message);
            print(state.logInModel!.status);
            ShowToast(text: state.logInModel!.message,stutes: toastStutes.error);
        }

      }

    },
    builder: (context, state) => SafeArea(
      child: Scaffold(

        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("LOG_IN",
                        style: (Theme.of(context)
                            .textTheme
                            .headline4!
                            .copyWith(color: Colors.black))),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "login now to browse your hot offers",
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey),
                    ),
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
                        prefixIcon: Icon(Icons.lock_open_outlined),
                        validatorPostion: true,
                        Textvalidator: "please sure your password",
                        labelText: " enter password",
                        lock: true,
                        suffixIcon: Icon(Icons.remove_red_eye),
                        hintText: " enter password",
                        circular: 10),
                    SizedBox(
                      height: 15,
                    ),
                    Button(
                        text: "LOG_IN",
                        textColor: Colors.white,
                        onPressed: (){
                          if(formKey.currentState!.validate())
                          {
                            logInCubit.get(context).logIN(
                                email:emailController.text,
                                password:passwordController.text);

                          }
                        }),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: () {
                            Navigator.push(context, PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => Register(),));
                          },
                          child: Text("register now".toUpperCase(),
                              style: (Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(color: Colors.blue))),
                        ),
                      ],
                    ),
                  ],
                ),),
            ),
          ),
        ),
      ),
    ),
    ),);
  }
}
