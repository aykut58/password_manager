// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_password_secrity_app/core/secure_storage.dart';
import 'package:flutter_password_secrity_app/models/password_model.dart';

import '../data/db_helper.dart';
import 'home_page.dart';

class PasswordAdd extends StatefulWidget {
  const PasswordAdd({super.key});

  @override
  State<PasswordAdd> createState() => _PasswordAddState();
}

class _PasswordAddState extends State<PasswordAdd> {
 GlobalKey<FormState> globalKey = GlobalKey();

  TextEditingController passwordTitle = TextEditingController();
  TextEditingController password = TextEditingController();

  final dbHelper = DbHelper.instance;
  PasswordModel? passwordModel;
 void initState()
 {
   super.initState();
   passwordModel = PasswordModel();
 }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Şifre Ekleme")),
      body: Center(child: Form(
        autovalidateMode: AutovalidateMode.disabled,
        key: globalKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            Container(
              padding: const EdgeInsets.all(5),
              child: TextFormField
              (
                controller: passwordTitle,
                validator: (value) {
                return value!.isEmpty ? "Bu Alan Boş Geçilemez" : null ;
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                labelText: "Şifre Başlığı Giriniz",
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
                ),
                ),
              ),
            ),
            const SizedBox(height: 10,),
            Container(
              padding: const EdgeInsets.all(5),
              child: TextFormField
              (
                controller: password,
                validator: (value) {
                return value!.isEmpty ? "Bu Alan Boş Geçilemez" : null ;
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                textCapitalization: TextCapitalization.sentences,
                decoration: InputDecoration(
                labelText: "Şifre Giriniz",
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0)
                ),
                ),
              ),
            ),
            const SizedBox(height: 15,),
            ElevatedButton(
              onPressed: () 
              async {
                if(globalKey.currentState!.validate())
                {
                    final SecureStorage secureStorage = SecureStorage();
                    await secureStorage.writeSecureData(passwordTitle.text, password.text);
                    // passwordModel!.name = passwordTitle.text;
                    // passwordModel!.password = password.text;
          
                  AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.success,
                  //body: Text('İşlem Başarılı Bir Şekilde Gerçekleşti',style: TextStyle(fontStyle: FontStyle.italic),),
                  title: 'Başarılı',
                  desc:   'İşlem Başarılı Bir Şekilde Gerçekleşti',
                  btnOkOnPress: () 
                  {
                    Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) =>  const HomePage()), (route) => false);
                  },
                  btnOkText: "Tamam"
                  ).show();
                }

      
            
         
              },
              child: const Text("Ekle"))
          ]
          ),
      ),
        ),
    );
  }
}

