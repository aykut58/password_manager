// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:flutter_password_secrity_app/data/db_helper.dart';

import '../core/secure_storage.dart';
import 'password_add.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isActive = false;
  bool _isHidden = false;
  SecureStorage secureStorage = SecureStorage();
  GlobalKey<RefreshIndicatorState>? _refreshKey;
  late DbHelper dbHelper;
   // ignore: prefer_collection_literals
   Map<String, String> allPassword = Map();
    @override
  void initState() {
    super.initState();
  readAllPassword(); 
   
    /// [2]
    dbHelper = DbHelper.instance;
   
  }
    void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
 Future<void>  readAllPassword() async 
  {
    Map<String, String> allValues = await secureStorage.readAllData();
    setState(() {
      allPassword = allValues;
    });
  }
   _refreshData() async {
  // Verilerinizi burada yenileyin ve bekleyin.
  await Future.delayed(Duration(seconds: 2));
}

  void deletePassword(key) async 
  {
    setState(() {
      secureStorage.deleteSecureData(key);
      Navigator.of(context).pop();
    });
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton:FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () 
        {
          Navigator.push(context, MaterialPageRoute(builder: (context) => PasswordAdd(),));
        },
        ) ,
      appBar: AppBar(title: Text("Şifreleriniz"),
      actions: 
      [
        IconButton(
                      onPressed: () 
                      {
                        setState(() {
                          _isHidden = !_isHidden;
                        });
                      }, 
                      icon: Icon(_isHidden
                      ?Icons.visibility_off
                      :Icons.visibility ),
                       )
      ],
      ),
       body: RefreshIndicator(
        key: _refreshKey,
        onRefresh: readAllPassword,
          child: Padding(
              padding: const EdgeInsets.all(5.0,),
              child: ListView.builder(
                itemCount: allPassword.length,
                itemBuilder: (BuildContext context, int index) {
                String key = allPassword.keys.elementAt(index);
                return ListTile
                (
                  title: Text(key, style: TextStyle(fontSize: 18),),
                  subtitle: Visibility(
                    visible: _isHidden,
                    child: Text(allPassword[key].toString(), style: TextStyle(fontSize: 18))),/*Text(allPassword[key].toString(), style: TextStyle(fontSize: 18),),*/
                  trailing: IconButton(
                    icon: Icon(Icons.delete), 
                    onPressed: ()
                    {
                      showDeleteAlertDialog(context , key);      
                    }, 
                    color: Colors.red,),
                  onTap: () 
                  {
                    showUpdateAlertDialog(context,key,allPassword,readAllPassword);
                  },
                );
         },),
             ),
           
       ));
  }
  showDeleteAlertDialog(BuildContext context , key ) {
  final SecureStorage secureStorage = SecureStorage();
  Widget cancelButton = ElevatedButton(
    style: ButtonStyle
    (
      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
    ),
    child: Text("İptal", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = ElevatedButton(
    style: ButtonStyle
    (
      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    ),
    child: Text("Sil" , style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
    onPressed:  () async {
      deletePassword(key);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (BuildContext context) =>  const HomePage()), (route) => false);
      //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    },
  );
  AlertDialog alert = AlertDialog(
    title: Text("Uyarı"),
    content: Text("Silmek İstediğinize Emin Misiniz?"),
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
}







showUpdateAlertDialog(BuildContext context , key , allPassword , readAllPassword) {
  TextEditingController passwordTitleController = TextEditingController(text: key);
  TextEditingController passwordController = TextEditingController(text: allPassword[key].toString());
  final SecureStorage secureStorage = SecureStorage();
  Widget cancelButton = ElevatedButton(
    style: ButtonStyle
    (
      backgroundColor: MaterialStateProperty.all<Color>(Colors.red),
    ),
    child: Text("İptal", style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
    onPressed:  () {
      Navigator.of(context).pop();
    },
  );
  Widget continueButton = ElevatedButton(
    style: ButtonStyle
    (
      backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
    ),
    child: Text("Güncelle" , style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
    onPressed:  () async {
      secureStorage.writeSecureData(passwordTitleController.text, passwordController.text);
      readAllPassword();
      Navigator.of(context).pop();
      //Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),));
    },
  );
  AlertDialog alert = AlertDialog(
    title: TextFormField
    (
      controller: passwordTitleController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration
      (
        labelText: "Şifre Başlığı Giriniz",
        border: OutlineInputBorder
        (
          borderRadius: BorderRadius.circular(10.0),
        )
      ),
    ),
    content: TextFormField
    (
      controller: passwordController,
      textInputAction: TextInputAction.next,
      decoration: InputDecoration
      (
        labelText: "Şifre Giriniz",
        border: OutlineInputBorder
        (
          borderRadius: BorderRadius.circular(10.0),
        )
      ),
    ),
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