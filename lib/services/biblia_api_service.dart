// ignore_for_file: non_constant_identifier_names

import 'package:igreja_app/models/biblia/biblia.dart';
import 'package:igreja_app/repository/biblia_repository.dart';

class BibliaService {
  Future<Biblia?> GetAllBookChap() {
    BibliaRepository bibliaRepository = BibliaRepository();
    return bibliaRepository.getAllBookChap();
  }

  then(Null Function(dynamic value) param0) {}
}
