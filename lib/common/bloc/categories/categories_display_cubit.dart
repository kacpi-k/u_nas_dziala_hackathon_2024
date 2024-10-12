import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_nas_dziala_hackathon_2024/common/bloc/categories/categories_display_state.dart';
import 'package:u_nas_dziala_hackathon_2024/domain/category/usecases/get_categories.dart';
import 'package:u_nas_dziala_hackathon_2024/service_locator.dart';

class CategoriesDisplayCubit extends Cubit<CategoriesDisplayState> {
  CategoriesDisplayCubit() : super(CategoriesLoading());

  void displayCategories() async {
    var returnedData = await sl<GetCategoriesUseCase>().call();
    returnedData.fold(
      (error) {
        emit(
          LoadCategoriesFailure(),
        );
      },
      (data) {
        emit(
          CategoriesLoaded(categories: data),
        );
      },
    );
  }
}
