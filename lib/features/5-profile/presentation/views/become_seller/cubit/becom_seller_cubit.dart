import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:user_online_shop/features/5-profile/presentation/views/become_seller/models/vender_model.dart';

part 'becom_seller_state.dart';

class BecomSellerCubit extends Cubit<BecomSellerState> {
  BecomSellerCubit(this.vendorRepo) : super(BecomSellerInitial());
  final VendorRepo vendorRepo;
  Future<void> becomeSeller({required VendorEntity vendor}) async {
    emit(BecomSellerLoading());
    final result = await vendorRepo.addVendor(vendor);
    result.fold((l) => emit(BecomSellerFailed(errMessage: l.message)), (r) {
      emit(
        BecomSellerSuccess(vendor),
      );
    });
  }
}
