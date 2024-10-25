//   import 'package:flutter/material.dart';
//   import 'package:moviepedia/view%20model/services/firebase_services/firebase_database/FirebaseDatabaseViewModel.dart';
//   import 'package:provider/provider.dart';
//
//   class ItemListView extends StatefulWidget {
//   @override
//   State<ItemListView> createState() => _ItemListViewState();
// }
//
// class _ItemListViewState extends State<ItemListView> {
//     FirebaseDatabaseViewModel firebaseDatabaseViewModel=FirebaseDatabaseViewModel();
//     @override
//   void initState() {
//    firebaseDatabaseViewModel.fetchData();
//       // TODO: implement initState
//     super.initState();
//   }
//     @override
//     Widget build(BuildContext context) {
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Items'),
//         ),
//         body: Consumer<FirebaseDatabaseViewModel>(
//           builder: (context, viewModel, child) {
//             if (viewModel.isLoading) {
//               return const Center(child: CircularProgressIndicator());
//             }else{
//               return ListView.builder(
//                 itemCount: viewModel.listData.length,
//                 itemBuilder: (context, index) {
//                   final item = viewModel.listData[index];
//                   return ListTile(
//                     title: Text(item.movieYear.toString()),
//                     subtitle: Text('Quantity: ${item.imageUrl.toString()}'),
//                     trailing: IconButton(
//                       icon: const Icon(Icons.delete),
//                       onPressed: () {},
//                     ),
//                   );
//                 },
//               );
//             }
//
//           },
//         ),
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {
//             // Add your item adding logic here
//           },
//           child: const Icon(Icons.add),
//         ),
//       );
//     }
// }
