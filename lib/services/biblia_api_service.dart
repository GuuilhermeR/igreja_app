// ignore_for_file: non_constant_identifier_names

import 'package:igreja_app/repository/biblia_repository.dart';

class BibliaService {
  GetAllBookChap() async {
    BibliaRepository bibliaRepository = BibliaRepository();
    return bibliaRepository.getAllBookChap();
  }
}
