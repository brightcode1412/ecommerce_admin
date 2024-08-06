import 'package:admin_e_commerce/features/add_ads/logic/cubit/add_ads_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddAdsCubit extends Cubit<AddAdsState> {
  AddAdsCubit() : super(AddAdsInitial());
}
