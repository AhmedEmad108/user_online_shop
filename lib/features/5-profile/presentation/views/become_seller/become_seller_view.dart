import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_online_shop/core/services/get_it.dart';
import 'package:user_online_shop/core/widgets/custom_appbar.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/cubit/becom_seller_cubit.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/models/vender_model.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/widgets/become_seller_view_bloc_consumer.dart';
import 'package:user_online_shop/generated/l10n.dart';

class BecomeSellerView extends StatelessWidget {
  const BecomeSellerView({super.key});
  static const routeName = '/become-seller';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(
        context,
        title: S.of(context).become_seller,
        icon: true,
      ),
      body: BlocProvider(
        create: (context) => BecomSellerCubit(
          getIt.get<VendorRepo>(),
        ),
        child: BecomeSellerViewBlocConsumer(),
      ),
    );
  }
}
