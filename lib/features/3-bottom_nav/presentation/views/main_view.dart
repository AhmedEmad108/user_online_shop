import 'package:flutter/material.dart';
import 'package:user_online_shop/features/3-bottom_nav/presentation/views/widgets/custom_bottom_navigation_bar.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/profile_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});
  static const routeName = '/main';
  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        itemIndex: (int value) {
          selectedIndex = value;
          setState(() {});
        },
      ),
      body: SafeArea(
        child: Column(
          children: [
            // selectedIndex == 0
            //     ? const CustomAppBarHomeView()
            //     : customAppBar(context, title: 'title'),
            Expanded(child: screens()),
          ],
        ),
      ),
    );
  }

  Widget screens() {
    return [
      Container(),
      Container(),
      Container(),
      ProfileView(),
    ][selectedIndex];
  }
}
