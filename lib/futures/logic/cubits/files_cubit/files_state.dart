part of 'files_cubit.dart';

abstract class FilesState extends Equatable {
  const FilesState();

  @override
  List<Object> get props => [];
}

class FilesInitial extends FilesState {
  const FilesInitial();
}

class WroteToFileState extends FilesState {
  final String fileName;
  const WroteToFileState({required this.fileName});
  @override
  List<Object> get props => [fileName];
}

class DeletedFileState extends FilesState {
  final String fileName;
  const DeletedFileState({required this.fileName});
  @override
  List<Object> get props => [fileName];
}

class CreatedFileState extends FilesState {
  const CreatedFileState();
}

class ReadFromFileState extends FilesState {
  final String content;
  const ReadFromFileState({required this.content});
  @override
  List<Object> get props => [content];
}

class GotFilesState extends FilesState {
  final List<String> files;
  const GotFilesState(this.files);
  @override
  List<Object> get props => [files];
}
