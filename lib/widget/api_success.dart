// import 'package:flutter/material.dart';




// class ApiSuccess  extends StatelessWidget {
//     ApiSuccess ({Key? key,required this.result,}) : super(key: key);
// final List<Result>? result;
  
// final colors = [Colors.blue , Colors.pink];



//   @override
//  Widget build(BuildContext context) {
 
//     return MediaQuery.of(context).orientation == Orientation.portrait
//     ? ListView.builder(
//       itemCount: result!.length,
//       itemBuilder: (BuildContext context, int index) 
//       {
//         return Column
//         (
//           children: 
//           [
//             Row
//             (
//               children: 
//               [
//                 Container(
//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: colors[index],),
//                   margin: const EdgeInsets.only(left: 10, top: 15, bottom:3),
//                   alignment: Alignment.center,
//                   width: MediaQuery.of(context).size.width /3,
//                   height: 100,  
//                    child: Column
//                    (
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: 
//                     [
//                       Text(result![index].categoryName!, style: const TextStyle(color: Colors.white, fontSize: 20),),
//                       const SizedBox(height: 10,),
//                         Text(result![index].registrationStatus!, style: const TextStyle(color: Colors.white, fontSize: 10),),
//                     ],
//                    ) 
//               ),
//                  Container(
//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white,),
//                   margin: const EdgeInsets.only( top: 13, ),
//                   alignment: Alignment.center,
//                   width: MediaQuery.of(context).size.width /1.7,
//                   height: 100, 
//                   child: Text((result![index].oDisplaySessionDayTimeList!), style: TextStyle(color: Colors.blue.shade900, fontSize: 16),)
//                 )
//               ],
//             )
//           ],
//         );
//       }
//     )

//     //--------------------------
//     // Ekran Yatay Hali 
//     //--------------------------
//     : ListView.builder(
//       itemCount: result!.length,
//       itemBuilder: (BuildContext context, int index) 
//       {
//         return Column
//         (
//           children: 
//           [
//             Row
//             (
//               children: 
//               [
//                 Container(
//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color:colors[index]),
//                   margin: const EdgeInsets.only(left: 10, top: 15, bottom:3),
//                   alignment: Alignment.center,
//                   width: MediaQuery.of(context).size.width /2.8,
//                   height: MediaQuery.of(context).size.height / 3.8, 
//                   //  child: Text(result![index].categoryName!, style: TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20),),
//                   child: Column
//                   (
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: 
//                     [
//                       Text(result![index].categoryName!, style: const TextStyle(color: Colors.white, fontSize: 30),),
//                       const SizedBox(height: 5,),
                      
//                         Text(result![index].registrationStatus!, style: const TextStyle(color: Colors.white, fontSize: 15),),
//                     ],
//                   ),
//               ),
//                  Container(
//                   decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white,),
//                   margin: const EdgeInsets.only( top: 13, ),
//                   alignment: Alignment.center,
//                   width: MediaQuery.of(context).size.width /1.7,
//                   height: MediaQuery.of(context).size.height / 3.8, 
//                   child: Text((result![index].oDisplaySessionDayTimeList!), style: TextStyle(color: Colors.blue.shade900, fontSize: 20),)
//                 )
//               ],
//             )
//           ],
//         );
//       }
//     );
//  }
// }
//     ///
//     // return ListView.builder(
//     //   itemCount: result!.length,
//     //   itemBuilder: (BuildContext context, int index) {
//     //     return Column
//     //     (
//     //       children: 
//     //       [
//     //         Row(
//     //           children: 
//     //           [
//     //             Container(
//     //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.grey,),
//     //               margin: const EdgeInsets.only(left: 10, top: 15, bottom:3),
//     //               alignment: Alignment.center,
//     //               width: MediaQuery.of(context).size.width /3,
//     //               height: 100,  
//     //                child: Text(result![index].categoryName!, style: TextStyle(color: Colors.blue.shade900, fontSize: 20),),
//     //           ),
//     //             Container(
//     //               decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white,),
//     //               margin: EdgeInsets.only( top: 13, ),
//     //               alignment: Alignment.center,
//     //               width: MediaQuery.of(context).size.width /1.7,
//     //               height: 100, 
//     //               child: Text(method(result![index].oDisplaySessionDayTimeList!), style: TextStyle(color: Colors.blue.shade900, fontSize: 16),)
//     //             )
//     //           ],
//     //         ),
//     //       ],
//     //     );
