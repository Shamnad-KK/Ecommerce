// import 'package:flutter/material.dart';

// class Hyy extends StatefulWidget {
//   const Hyy({super.key});

//   @override
//   State<Hyy> createState() => _HyyState();
// }

// class _HyyState extends State<Hyy> with TickerProviderStateMixin {
//   late TabController tabController;
//   @override
//   void initState() {
//     tabController = TabController(length: 6, vsync: this);
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color.fromARGB(255, 244, 246, 248),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Container(
//               padding: const EdgeInsets.only(
//                 top: 20,
//                 bottom: 20,
//                 left: 20,
//                 right: 20,
//               ),
//               decoration: const BoxDecoration(color: Colors.white),
//               child: Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: const [
//                       Text(
//                         "Homepage",
//                         style: TextStyle(
//                             color: Colors.black,
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold),
//                       ),
//                       CircleAvatar(
//                         radius: 15,
//                         backgroundImage: NetworkImage(
//                             "https://dm.henkel-dam.com/is/image/henkel/men_perfect_com_thumbnails_home_pack_400x400-wcms-international?scl=1&fmt=jpg"),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 20),
//                   SizedBox(
//                     height: 50,
//                     child: TabBar(
//                         padding: EdgeInsets.zero,
//                         indicator: BoxDecoration(
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.black54.withOpacity(0.2),
//                                 blurRadius: 12,
//                                 spreadRadius: 0.01,
//                                 offset: const Offset(
//                                   1.0,
//                                   1.0,
//                                 ), // changes position of shadow
//                               ),
//                             ],
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20)),
//                         labelColor: Colors.black,
//                         unselectedLabelColor: Colors.grey,
//                         isScrollable: true,
//                         controller: tabController,
//                         tabs: const [
//                           Tab(
//                             text: "Pizzas",
//                           ),
//                           Tab(
//                             text: 'Homeburguesas',
//                           ),
//                           Tab(
//                             text: "Sopas",
//                           ),
//                           Tab(
//                             text: "Entradas",
//                           ),
//                           Tab(
//                             text: "Sandwitch",
//                           ),
//                           Tab(
//                             text: "Sandwitch",
//                           )
//                         ]),
//                   ),
//                 ],
//               ),
//             ),
//             Expanded(
//               child: TabBarView(
//                 controller: tabController,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(20.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Pizzas",
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 20,
//                               fontWeight: FontWeight.bold),
//                         ),
//                         const SizedBox(height: 20),
//                         Card(
//                           elevation: 10,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Container(
//                             // height: 120,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             padding: const EdgeInsets.only(
//                               right: 15,
//                               left: 15,
//                               top: 25,
//                               bottom: 25,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const CircleAvatar(
//                                   radius: 30,
//                                   backgroundImage: NetworkImage(
//                                       "https://images.unsplash.com/photo-1628840042765-356cda07504e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVwcGVyb25pJTIwcGl6emF8ZW58MHx8MHx8&w=1000&q=80"),
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: const [
//                                     Text(
//                                       "Pizza veloper",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Text(
//                                       "Lorem ipsum dolor sit amet",
//                                       style: TextStyle(fontSize: 12),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Text(
//                                       "\$150.00",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ],
//                                 ),
//                                 Container(
//                                   height: 34,
//                                   width: 34,
//                                   decoration: const BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.blue),
//                                   child: const Center(
//                                     child: Icon(
//                                       Icons.add,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         const SizedBox(height: 30),
//                         Card(
//                           elevation: 10,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(20)),
//                           child: Container(
//                             // height: 120,
//                             width: double.infinity,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(20),
//                             ),
//                             padding: const EdgeInsets.only(
//                               right: 15,
//                               left: 15,
//                               top: 25,
//                               bottom: 25,
//                             ),
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 const CircleAvatar(
//                                   radius: 30,
//                                   backgroundImage: NetworkImage(
//                                       "https://images.unsplash.com/photo-1628840042765-356cda07504e?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8cGVwcGVyb25pJTIwcGl6emF8ZW58MHx8MHx8&w=1000&q=80"),
//                                 ),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: const [
//                                     Text(
//                                       "Pizza veloper",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Text(
//                                       "Lorem ipsum dolor sit amet",
//                                       style: TextStyle(fontSize: 12),
//                                     ),
//                                     SizedBox(height: 4),
//                                     Text(
//                                       "\$150.00",
//                                       style: TextStyle(
//                                           fontWeight: FontWeight.bold),
//                                     ),
//                                   ],
//                                 ),
//                                 Container(
//                                   height: 34,
//                                   width: 34,
//                                   decoration: const BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color: Colors.blue),
//                                   child: const Center(
//                                     child: Icon(
//                                       Icons.add,
//                                       color: Colors.white,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const Text("Homepage"),
//                   const Text("Homepage"),
//                   const Text("Homepage"),
//                   const Text("Homepage"),
//                   const Text("Homepage"),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
