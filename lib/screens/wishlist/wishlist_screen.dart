import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:grocery_store/screens/wishlist/wishlist_widget.dart';
import 'package:grocery_store/services/global_methods.dart';
import 'package:grocery_store/services/utils.dart';
import 'package:grocery_store/widgets/back_widget.dart';
import 'package:grocery_store/widgets/empty_screen.dart';
import 'package:grocery_store/widgets/text_widget.dart';

class WishlistScreen extends StatelessWidget {
  static const routeName = '/WishlistScreen';
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = Utils(context).getScreenSize; 
    final Color color = Utils(context).color; 
    bool _isEmpty = true;

    return _isEmpty
        ? const EmptyScreen(
            title: 'Your wishlist is empty',
            subtitle: 'Explore more and shortlist some items',
            buttontext: 'Add a wish',
            imagePath: 'assets/images/wishlist.png',
          )
        : Scaffold( 
            appBar: AppBar( 
              centerTitle: true, 
              leading: const BackWidget(), 
              automaticallyImplyLeading: false,  
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor,
              title: TextWidget(
                text: 'Wishlist',
                color: color,
                isTitle: true,
                textSize: 22,
              ),
              actions: [
                IconButton(
                  onPressed: () {
                    GlobalMethods.warningDialog(
                        title: 'Empty your wishlist?',
                        subtitle: 'Are you sure?',
                        fct: () {},
                        context: context);
                  },
                  icon: Icon(
                    IconlyBroken.delete,
                    color: color,
                  ),
                ),
              ],
            ),
            body: MasonryGridView.count(
              crossAxisCount: 2,
              // mainAxisSpacing: 4,
              // crossAxisSpacing: 4,
              itemBuilder: (context, index) {
                return const WishlistWidget();
              },
            ));
  }
}
