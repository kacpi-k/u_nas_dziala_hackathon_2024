import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:u_nas_dziala_hackathon_2024/common/bloc/course/courses_display_state.dart';
import 'package:u_nas_dziala_hackathon_2024/core/usecase/usecase.dart';

class CoursesDisplayCubit extends Cubit<CoursesDisplayState> {
  final UseCase useCase;
  CoursesDisplayCubit({required this.useCase}) : super(CoursesInitialState());

  void displayProducts({dynamic params}) async {
    emit(
      CoursesLoading(),
    );

    var returnedData = await useCase.call(
      params: params,
    );
    returnedData.fold(
      (error) {
        emit(
          LoadCoursesFailure(),
        );
      },
      (data) {
        emit(
          CoursesLoaded(courses: data),
        );
      },
    );
  }

  void displayInitial() {
    emit(
      CoursesInitialState(),
    );
  }
}
