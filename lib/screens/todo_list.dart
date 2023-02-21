import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_password_secrity_app/data/db_helper.dart';
import 'package:flutter_password_secrity_app/models/password_model.dart';
import 'package:flutter_password_secrity_app/widget/api_error.dart';

class TodoList extends StatefulWidget {
  const TodoList({
    Key? key,
    required this.dbHelper,
  }) : super(key: key);

  final DbHelper dbHelper;
  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
   late Future<List<PasswordModel>>? _future;

  @override
  void initState() {
    super.initState();
    _future = widget.dbHelper.getTodoList();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<PasswordModel>>
    (
      future: _future,
      builder: (context, snapshot) 
      {
         if (snapshot.hasError) {
          return const Text(
            'Hata',
          );
        } else if (snapshot.hasData) {
          return ListView.separated(
            itemCount: snapshot.data!.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 10.0,
            ),
            itemBuilder: (context, index) {
              return Ink(
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(
                    0.2,
                  ),
                  borderRadius: BorderRadius.circular(
                    8.0,
                  ),
                ),
                child: ListTile(
                  onTap: () {
                    
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      8.0,
                    ),
                  ),
                  /*
  trailing: Checkbox(
                    value: isCheck,
                    onChanged: (value) {
                      setState(() {
                        isCheck = value!;

                        /// 2) Güncellenecek Görev
                        var todo = Todo(
                          isCheck: isCheck,
                          id: snapshot.data![index].id!,
                        );
                        widget.dbHelper.update(todo);
                      });
                    },
                  ),
                */
                  title: Text(
                    snapshot.data![index].name!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
/*
                    style: isCheck
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          )
                        : null,
*/
                  ),
                  subtitle: Text(
                    snapshot.data![index].password!,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
/*
                    style: isCheck
                        ? const TextStyle(
                            decoration: TextDecoration.lineThrough,
                            color: Colors.grey,
                          )
                        : null,
*/
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(
            child: ApiError(
              /// veri alınamama anında geçerli bölüm.
              errorMessage: "Ders Programı Bulunamadı"
            ));
        }
      }
    );
  }
}