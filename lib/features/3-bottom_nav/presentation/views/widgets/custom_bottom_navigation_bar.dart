import 'package:flutter/material.dart';
import 'package:user_online_shop/core/utils/app_images.dart';
import 'package:user_online_shop/features/3-bottom_nav/domain/entities/bottom_navigation_bar_entity.dart';
import 'package:user_online_shop/features/3-bottom_nav/presentation/views/widgets/active_item.dart';
import 'package:user_online_shop/features/3-bottom_nav/presentation/views/widgets/in_active_item.dart';
import 'package:user_online_shop/generated/l10n.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.itemIndex});
  final ValueChanged<int> itemIndex;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarEntity> bottomNavigationBarEntities = [
      BottomNavigationBarEntity(
        name: S.of(context).home,
        activeImage: Assets.imagesHomeActive,
        inActiveImage: Assets.imagesHome,
      ),
      BottomNavigationBarEntity(
        name: S.of(context).products,
        activeImage: Assets.imagesProductActive,
        inActiveImage: Assets.imagesProduct,
      ),
      BottomNavigationBarEntity(
        name: S.of(context).shopping_cart,
        activeImage: Assets.imagesShoppingCartActive,
        inActiveImage: Assets.imagesShoppingCart,
      ),
      BottomNavigationBarEntity(
        name: S.of(context).profile,
        activeImage: Assets.imagesProfileActive,
        inActiveImage: Assets.imagesProfile,
      ),
    ];

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      curve: Curves.linearToEaseOut,
      height: 70,
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      decoration: ShapeDecoration(
        color: Theme.of(context).colorScheme.onSecondary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
        ),
        shadows: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow,
            blurRadius: 25,
            offset: const Offset(0, -2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: bottomNavigationBarEntities.asMap().entries.map(
          (e) {
            var index = e.key;
            var entity = e.value;
            return Expanded(
              flex: selectedIndex == index ? 3 : 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    widget.itemIndex(index);
                  });
                },
                child: NavigationBarItem(
                  isSelected: selectedIndex == index,
                  bottomNavigationBarEntity: entity,
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}

class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem(
      {super.key,
      required this.isSelected,
      required this.bottomNavigationBarEntity});
  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return ScaleTransition(
              scale: animation,
              child: child,
            );
          },
          // switchInCurve: Curves.linearToEaseOut,
          // switchOutCurve: Curves.fastOutSlowIn,
          child: isSelected
              ? ActiveItem(
                  text: bottomNavigationBarEntity.name,
                  image: bottomNavigationBarEntity.activeImage,
                )
              : InActiveItem(
                  image: bottomNavigationBarEntity.inActiveImage,
                ),
        ),
      ],
    );
  }
}
