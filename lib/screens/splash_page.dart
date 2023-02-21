// ignore_for_file: unused_local_variable, use_build_context_synchronously

import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_password_secrity_app/screens/pin_add_page.dart';

import '../core/secure_storage.dart';
import 'home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
GlobalKey<FormState> globalKey = GlobalKey();
bool _isPasswordVisible = false;
  TextEditingController pinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return  Scaffold
    (
      appBar: AppBar(title: const Text("Giriş Ekranı"),),
      body: Center
      (
        child: Column
        (
          mainAxisAlignment: MainAxisAlignment.center,
          children: 
          [
            SizedBox
            (
              width: MediaQuery.of(context).size.width /1.3 ,
              height: MediaQuery.of(context).size.height / 3.5,
              child: Image.asset("assets/bir.png" , fit: BoxFit.fill,),
            ),
            Container(
              padding: const EdgeInsets.all(7),
              child: Form(
                autovalidateMode: AutovalidateMode.disabled,
                key:globalKey ,
                child: TextFormField
                (
                  validator: (value) {
                              return value!.isEmpty ? "Bu Alan Boş Geçilemez" : null ;
                            },
                  controller: pinController,
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
              ),
            ),
            const SizedBox(height: 10,),
            ElevatedButton(
              onPressed: () async
              {
                if(globalKey.currentState!.validate())
                {
                                  final SecureStorage secureStorage = SecureStorage();
                String? password = await secureStorage.readSecureData("pin");

                if(password == null )
                {
                  AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.info,
                  //body: Text('İşlem Başarılı Bir Şekilde Gerçekleşti',style: TextStyle(fontStyle: FontStyle.italic),),
                  title: 'Sakin Ol Şampiyon',
                  desc:   "Öncelikle Pin Belirlemen Lazım",
                  btnOkOnPress: () 
                  {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const PinAddPage(),));
                  },
                  btnOkText: "Tamam"
                  ).show();
                }
                else 
                {
                if(password == pinController.text)
                {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) =>  const HomePage()), (route) => false);
                }
                else 
                {
                  AwesomeDialog(
                  context: context,
                  animType: AnimType.scale,
                  dialogType: DialogType.error,
                  //body: Text('İşlem Başarılı Bir Şekilde Gerçekleşti',style: TextStyle(fontStyle: FontStyle.italic),),
                  title: 'Opss!!',
                  desc:   'Bir Şeyler Ters Gitti',
                  btnOkOnPress: () 
                  {
                    
                  },
                  btnOkText: "Tamam"
                  ).show();
                }
                }
                }



              }, 
              child: const Text("Giriş")
              ),
            const SizedBox(height: 10,),
            Row
            (
              mainAxisAlignment: MainAxisAlignment.center,
              children: 
              [
                ElevatedButton(
              onPressed: () 
              {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const PinAddPage(),));
              }, 
              child: const Text("İlk Giriş"),
              ),
              const SizedBox(width: 10,),


              ElevatedButton(
              onPressed: () 
              {
                showDeleteAlertDialog(context);
              }, 
              child: const Text("Pin'i Unuttum"))
              ],
            )
          ],
        ),
      ),
    );
  }
}

showDeleteAlertDialog(BuildContext context  ) {
  final SecureStorage secureStorage = SecureStorage();
  Widget cancelButton = ElevatedButton(
    style: ButtonStyle
    (
      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
    ),
    child: const Text("İptal", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = ElevatedButton(
    style: ButtonStyle
    (
      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    ),
    child: const Text("Sil" , style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
    onPressed:  () async {
      secureStorage.deleteSecureData("pin");
      Navigator.push(context, MaterialPageRoute(builder: (context) => const PinAddPage(),));
      
      //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    },
  );
  AlertDialog alert = AlertDialog(
    title: const Text("Uyarı"),
    content: const Text("Pini Sıfırlamak İstediğine Emin Misin?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
