// import 'package:flutter/material.dart';
// import 'package:online_shop/features/home/presentation/views/widgets/active_item.dart';
// import 'package:online_shop/features/home/presentation/views/widgets/in_active_item.dart';


// class NaivgationBarItem extends StatelessWidget {
//   const NaivgationBarItem(
//       {super.key,
//       required this.isSelected,
//       required this.bottomNavigationBarEntity});

//   final bool isSelected;
//   final BottomNavigationBarEntity bottomNavigationBarEntity;
//   @override
//   Widget build(BuildContext context) {
//     return isSelected
//         ? ActiveItem(
//             image: bottomNavigationBarEntity.activeImage,
//             text: bottomNavigationBarEntity.name,
//           )
//         : InActiveItem(
//             image: bottomNavigationBarEntity.inActiveImage,
//           );
//   }
// }