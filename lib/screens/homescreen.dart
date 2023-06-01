import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../model/bottombarmodel.dart';
import 'newsscreen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bottomNavBarModel = Provider.of<BottomNavBarModel>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        title: const Center(child: Text('News')),
      ),
      body: IndexedStack(
        index: bottomNavBarModel.currentIndex,
        children: const [
          NewsScreen(index: 0, category: 'science'),
          NewsScreen(index: 1, category: 'business'),
          NewsScreen(index: 2, category: 'technology'),
          // BusinessScreen(),
          // TechnologyScreen(),
        ],
      ),
      // body:CustomScrollView(
      //   slivers: <Widget>[
      //     SliverAppBar(
      //       title: Center(child: Text('Sliver List')),
      //       expandedHeight: 200,
      //       pinned: true,
      //       backgroundColor: Colors.amber,
      //       flexibleSpace: FlexibleSpaceBar(
      //         // background: Image.network(
      //         //   'https://via.placeholder.com/400',
      //         //   fit: BoxFit.cover,
      //         // ),
      //       ),
      //     ),
      //     // SliverFillRemaining(
      //     //  child:ScienceScreen(),
      //     // ),
      //     SliverList(
      //       delegate: SliverChildBuilderDelegate(
      //             (context, index) => ScienceScreen(b);
      //
      //       ),
      //     ),
      //   ],
      // ),

      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColors.primaryColor,
        currentIndex: bottomNavBarModel.currentIndex,
        onTap: (index) {
          bottomNavBarModel.changeIndex(index);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Science',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people_alt_outlined),
            label: 'Business',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: 'Technology',
          ),
        ],
      ),
    );
  }
}
