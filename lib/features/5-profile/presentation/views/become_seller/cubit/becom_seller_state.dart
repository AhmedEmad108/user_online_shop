part of 'becom_seller_cubit.dart';

sealed class BecomSellerState extends Equatable {
  const BecomSellerState();

  @override
  List<Object> get props => [];
}

final class BecomSellerInitial extends BecomSellerState {}

final class BecomSellerLoading extends BecomSellerState {}

final class BecomSellerSuccess extends BecomSellerState {
  final VendorEntity vendorEntity;
  const BecomSellerSuccess(this.vendorEntity);
}

final class BecomSellerFailed extends BecomSellerState {
  final String errMessage;
  const BecomSellerFailed({required this.errMessage});
}
