import 'package:case_study/dashbord/cubit/dashbord_cubit.dart';
import 'package:case_study/dashbord/modules/product/view/page/product_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class dashbordPage extends StatelessWidget {
  const dashbordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DashbordCubit(),
      child: BlocBuilder<DashbordCubit, DashbordState>(
        builder: (context, state) {
          DashbordCubit cubit=context.read<DashbordCubit>();
          return Scaffold(
            appBar: AppBar(),
            body: PageView(
              controller: cubit.pageController,
              onPageChanged: cubit.onChangeTab,
              children: const [
                ProductPage(),
                Text('favorite'),
                Text('cart'),
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              selectedItemColor: Colors.blue,
              currentIndex: cubit.currentindex,
              onTap: cubit.onChangeTab,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.collections), label: 'product'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.heart), label: 'favorite'),
                BottomNavigationBarItem(
                    icon: Icon(CupertinoIcons.cart), label: 'cart')
              ],
            ),
          );
        },
      ),
    );
  }
}
