// ignore_for_file: use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_password_secrity_app/screens/splash_page.dart';

import '../core/secure_storage.dart';

class PinAddPage extends StatefulWidget {
  const PinAddPage({super.key});

  @override
  State<PinAddPage> createState() => _PinAddPageState();
}

class _PinAddPageState extends State<PinAddPage> {

  TextEditingController pinController = TextEditingController();
  TextEditingController pin2Controller = TextEditingController();
  String? password;
  bool _isPasswordVisible = false;
  GlobalKey<FormState> globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      appBar: AppBar(title: const Text("Pin Belirleme"),),
      body: Center(child: Form(
        key: globalKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            TextFormField
                (
                  controller: pinController,
                  onSaved: (value) => password = value,
                  validator: (value) 
                  {
                    if(value!.isEmpty)
                    {
                      return "Lütfen Boş Bırakmayın";
                    }
                    if(value.length != 4)
                    {
                      return 'Lütfen 4 haneli bir sayı girin';
                    }

                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  obscureText: !_isPasswordVisible,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration
                  (
                    labelText: "Pin giriniz",
                    border: OutlineInputBorder
                    (
                      borderRadius: BorderRadius.circular(10.0)
                    ),
                                        suffixIcon: IconButton(
                      onPressed: () 
                      {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      }, 
                      icon: Icon(_isPasswordVisible
                      ?Icons.visibility_off
                      :Icons.visibility ),
                       )
                  ),
                ),
                const SizedBox(height: 10,),
                TextFormField
                (
                  controller: pin2Controller,
                  validator: (value) 
                  {
                    if(value!.isEmpty)
                    {
                      return "Lütfen Boş Bırakmayın";
                    }
                    if(value.length != 4)
                    {
                      return 'Lütfen 4 haneli bir sayı girin';
                    }
                    if(value != value)
                    {
                      return 'Şifreler Eşleşmiyor';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  obscureText: !_isPasswordVisible,
                  // ignore: prefer_const_constructors
                  decoration: InputDecoration
                  (
                    labelText: "Pini Tekrar giriniz",
                    border: OutlineInputBorder
                    (
                      borderRadius: BorderRadius.circular(10.0),
                      
                    ),
                    suffixIcon: IconButton(
                      onPressed: () 
                      {
                        setState(() {
                          _isPasswordVisible = !_isPasswordVisible;
                        });
                      }, 
                      icon: Icon(_isPasswordVisible
                      ?Icons.visibility_off
                      :Icons.visibility ),
                       )
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(
                  onPressed: () async
                  {
                    if(globalKey.currentState!.validate())
                    {
                                          final SecureStorage secureStorage = SecureStorage();
                    await secureStorage.writeSecureData("pin", pinController.text);
                    AwesomeDialog(
                    context: context,
                    animType: AnimType.scale,
                    dialogType: DialogType.success,
                    //body: Text('İşlem Başarılı Bir Şekilde Gerçekleşti',style: TextStyle(fontStyle: FontStyle.italic),),
                    title: 'Başarılı',
                    desc:   'Pin Başarılı Bir Şekilde Oluşturuldu',
                    btnOkOnPress: () 
                    {
                      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) =>  const SplashPage()), (route) => false);
                    },
                    btnOkText: "Tamam"
                    ).show();
                  }
                    },

                  child: const Text("Kaydet"))
          ],
        ),
      ),
      ),
    );
  }
}