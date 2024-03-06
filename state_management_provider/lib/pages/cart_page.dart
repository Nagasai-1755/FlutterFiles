import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_management_provider/const.dart';
import 'package:state_management_provider/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _buildUI(context),
    );
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      title: const Text(
        "Cart",
      ),
    );
  }

  Widget _buildUI(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, provider, _) {
        return Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: provider.items.length,
                itemBuilder: (context, index) {
                  Product product = provider.items[index];
                  return Dismissible(
                    key: Key(product.id.toString()), 
                    onDismissed: (direction) {
                      provider.remove(product); 
                    },
                    background: Container(
                      color:const Color.fromARGB(255, 66, 136, 226),
                      alignment: Alignment.centerRight,
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16.0),
                        child: Icon(
                          Icons.delete,
                          color: Color.fromARGB(255, 235, 35, 35),
                        ),
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        product.name,
                      ),
                    ),
                  );
                },
              ),
            ),
            Text("Cart Total: \$${provider.getCartTotal()}"),
          ],
        );
      },
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:state_management_provider/const.dart';
// import 'package:state_management_provider/providers/cart_provider.dart';


// class CartPage extends StatelessWidget {
//   const CartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: _appBar(),
//       body: _buildUI(),
//     );
//   }

//   PreferredSizeWidget _appBar() {
//     return AppBar(
//       title: const Text(
//         "Cart",
//       ),
//     );
//   }

//   Widget _buildUI() {
//     return Consumer<CartProvider>(
//       builder: (context, provider, _) {
//         return Column(
//           children: [
//             SizedBox(
//               height: MediaQuery.sizeOf(context).height * 0.80,
//               child: ListView.builder(
//                 itemCount: provider.items.length,
//                 itemBuilder: (context, index) {
//                   Product product = provider.items[index];
//                   return ListTile(
//                     title: Text(
//                       product.name,
//                     ),
//                     onLongPress: () {
//                       provider.remove(product);
//                     },
//                   );
//                 },
//               ),
//             ),
//             Text("Cart Total: \$${provider.getCartTotal()}")
//           ],
//         );
//       },
//     );
//   }
// }
