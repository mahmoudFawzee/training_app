import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/futures/logic/cubits/files_cubit/files_cubit.dart';

class FileContentScreen extends StatelessWidget {
  const FileContentScreen({super.key, required this.fileName});
  final String fileName;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.read<FilesCubit>().getFiles();
        return true;
      },
      child: BlocProvider.value(
        value: BlocProvider.of<FilesCubit>(context),
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  context.read<FilesCubit>().writeToFile(
                        fileName: fileName,
                        text: 'new text plus',
                      );
                },
                icon: const Icon(
                  Icons.add,
                ),
              ),
            ],
          ),
          body: BlocConsumer<FilesCubit, FilesState>(
            listener: (context, state) {
              if (state is WroteToFileState) {
                context.read<FilesCubit>().readFile(state.fileName);
              }
            },
            builder: (context, state) {
              print(state);
              if (state is ReadFromFileState) {
                final content = state.content;
                return Center(
                  child: Text(content),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.green,
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
