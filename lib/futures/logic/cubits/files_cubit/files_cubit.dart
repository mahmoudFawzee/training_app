import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_training/futures/data/services/files_service.dart';

part 'files_state.dart';

class FilesCubit extends Cubit<FilesState> {
  FilesCubit() : super(const FilesInitial());

  void writeToFile({
    required String fileName,
    required String text,
  }) async {
    await FilesService.writeToFile(
      fileName: fileName,
      text: text,
    );
    emit(WroteToFileState(fileName: fileName));
  }

  void createFile() async {
    await FilesService.createNewFile();
    emit(const CreatedFileState());
  }

  void readFile(String fileName) async {
    final content = await FilesService.readFile(fileName: fileName);
    emit(ReadFromFileState(content: content));
  }

  void getFiles() async {
    final files = await FilesService.getFiles();
    emit(GotFilesState(files));
  }

  void deleteFile({required String fileName}) async {
    await FilesService.deleteFile(fileName: fileName);
    emit(DeletedFileState(fileName: fileName));
  }
}
