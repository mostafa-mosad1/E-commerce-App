import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/compant.dart';
import 'package:shop_app/pages/Home/Dio/CubitHome.dart';
import '../Home/Dio/StateHome.dart';

class editProfile extends StatelessWidget {
  const editProfile({super.key});

  @override
  Widget build(BuildContext context) {
    var image;
    GlobalKey<FormState> formKey =  GlobalKey<FormState>();
    TextEditingController nameController = TextEditingController();
    TextEditingController phonController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController imageController = TextEditingController();
    TextEditingController passwordController =TextEditingController();

    var cubit = homeCubit.get(context).profileModel;

    nameController.text =cubit!.data!.name.toString();
    phonController.text =cubit!.data!.phone.toString();
    emailController.text =cubit!.data!.email.toString();
    imageController.text =cubit!.data!.image.toString();

    return  Material(
      child: BlocConsumer<homeCubit,homeState>(
          listener: (context, state) {
            //
            //   if(homeCubit.get(context).editProfileModel?.status.toString() == true){
            //     print(homeCubit.get(context).editProfileModel?.status.toString());
            //     print(homeCubit.get(context)?.editProfileModel?.message.toString());
            //
            //     ShowToast(text: homeCubit.get(context).editProfileModel!.message.toString(),stutes:toastStutes.suess );
            //     Navigator.pop(context);
            //
            //
            // }else
            // {
            //   ShowToast(text: homeCubit.get(context).editProfileModel!.message.toString(),stutes:toastStutes.error );
            //
            // }
            },
          builder: (context, state) => Container(
            color: Colors.white38,
            child: Stack(
        children: [
            Image.asset(
              "assets/5.jpg",
              height: 180,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
            Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                      alignment: Alignment.topLeft,
                      child: IconButton(onPressed: (){

                      }, icon: Icon(Icons.arrow_back))),

                  Container(
                      alignment: Alignment.topRight,
                      child: IconButton(
                          onPressed: () async {


                            if (image != null) {

                              // uploadImage(image);
                            } else {
                              print("not valid");
                            }
                          },
                          icon: Icon(
                            Icons.task_alt_outlined,
                            size: 40,
                          ))),
                  Center(
                      child: Stack(
                        children: [
                          image == null
                              ? Container(
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage("assets/photo.jpg"),
                                      fit: BoxFit.cover),
                                  border:
                                  Border.all(color: Colors.black, width: 2),
                                  borderRadius:
                                  BorderRadius.all(Radius.circular(140))),
                              width: 190,
                              height: 190)
                              : CircleAvatar(
                            radius: 95,
                            backgroundImage: FileImage(image),
                          ),
                          Positioned(
                            bottom: 1,
                            top: 134,
                            left: 120,
                            child: IconButton(
                                onPressed: () {
                                  showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return Container(
                                          height: 200,
                                          child: Column(
                                            children: [
                                              Container(
                                                child: Text(
                                                  "Choose photo from",
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight: FontWeight.bold),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              MaterialButton(
                                                onPressed: () async {
                                                  var pickedImage =
                                                  await ImagePicker().pickImage(
                                                      source:
                                                      ImageSource.camera);
                                                  if (pickedImage != null) {

                                                    image =
                                                        File(pickedImage.path);

                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.camera),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      " camera",
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(
                                                height: 20,
                                              ),
                                              MaterialButton(
                                                onPressed: () async {
                                                  var pickedImage =
                                                  await ImagePicker().pickImage(
                                                      source:
                                                      ImageSource.gallery);
                                                  if (pickedImage != null) {

                                                    image = pickedImage;
                                                    // File(pickedImage.path);


                                                    Navigator.pop(context);
                                                  }
                                                },
                                                child: Row(
                                                  children: [
                                                    Icon(Icons.photo_outlined),
                                                    SizedBox(
                                                      width: 20,
                                                    ),
                                                    Text(
                                                      " gallery",
                                                      style: TextStyle(
                                                          fontSize: 25,
                                                          fontWeight:
                                                          FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        );
                                      });
                                },
                                icon: Icon(
                                  Icons.camera_alt,
                                  size: 43,
                                  color: Colors.white,
                                )),
                          ),
                        ],
                      )),
                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          DefultTextForm(
                            prefixIcon: Icon(Icons.person),
                            hintText:cubit?.data?.name,
                            controller: nameController,
                            circular: 10,
                            keyboardType: TextInputType.text,
                            validatorPostion:true,
                            Textvalidator: "please enter name"

                          ),
                          SizedBox(height: 15,),
                          DefultTextForm(
                              prefixIcon: Icon(Icons.email),
                              hintText:cubit?.data?.email,
                              controller: emailController,
                              circular: 10,
                              keyboardType: TextInputType.none,
                              validatorPostion:true,
                              Textvalidator: "please enter email"

                          ),
                          SizedBox(height: 15,),
                          DefultTextForm(
                              prefixIcon: Icon(Icons.email),
                              hintText:"please enter password",
                              controller: passwordController,
                              circular: 10,
                              keyboardType: TextInputType.none,
                          ),
                          SizedBox(height: 15,),
                          DefultTextForm(
                              prefixIcon: Icon(Icons.phone),
                              hintText:cubit?.data?.phone,
                              controller: phonController,
                              circular: 10,
                              keyboardType: TextInputType.phone,
                              validatorPostion:true,
                              Textvalidator: "please enter phon"

                          ),
                          SizedBox(height: 15,),
                          DefultTextForm(
                              prefixIcon: Icon(Icons.image),
                              controller: imageController,
                              circular: 10,
                              keyboardType: TextInputType.text,
                              validatorPostion:true,
                              Textvalidator: "please enter image"
                          ),
                          SizedBox(height: 15,),
                          Button(text: "Save",
                              textColor: Colors.white,
                              onPressed: (){
                            if(formKey.currentState!.validate() ){
                              // 01207124604


                                homeCubit.get(context).getEditProfileData(
                                 name:nameController.text ,
                                 email: emailController.text,
                                 phone: phonController.text,
                                 image: imageController.text,
                               );

                               homeCubit.get(context).getEditProfileData();
                               homeCubit.get(context).getProfileData();
                                Navigator.pop(context);
                                ShowToast(text: homeCubit.get(context).editProfileModel!.message.toString(),stutes:toastStutes.suess );
                              //     Navigator.pop(context);


                            }
                          })
                        ],
                      ),
                    ),
                  ),


                ],
              ),
            ),
        ],
      ),
          ),),
    );

  }
}
