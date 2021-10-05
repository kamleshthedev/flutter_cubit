import 'package:bloc/bloc.dart';
import 'package:cubit_example/models/post_modal.dart';
import 'package:cubit_example/services/data_service.dart';

class PostsCubit extends Cubit<List<Post>> {
  final _dataService = DataService();

  PostsCubit() : super([]);

  void getPost() async => emit(await _dataService.getPost());
}
