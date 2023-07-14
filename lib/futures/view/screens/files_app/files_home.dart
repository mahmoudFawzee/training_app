import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/futures/logic/cubits/files_cubit/files_cubit.dart';
import 'package:flutter_training/futures/logic/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter_training/futures/view/screens/files_app/file_content.dart';
import 'package:flutter_training/futures/view/screens/pizza_app/settings.dart';

class FilesAppHome extends StatelessWidget {
  const FilesAppHome({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<FilesCubit>(context)..getFiles(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            BlocListener<FilesCubit, FilesState>(
              listener: (context, state) {
                if (state is CreatedFileState) {
                  context.read<FilesCubit>().getFiles();
                } else if (state is DeletedFileState) {
                  context.read<FilesCubit>().getFiles();
                }
              },
              child: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    context.read<FilesCubit>().createFile();
                  },
                  icon: const Icon(
                    Icons.add,
                  ),
                );
              }),
            ),
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: BlocProvider.of<ThemeCubit>(context),
                      child: const SettingScreen(),
                    ),
                  ),
                );
              },
              icon: const Icon(
                Icons.settings,
              ),
            ),
          ],
        ),
        body: BlocBuilder<FilesCubit, FilesState>(
          builder: (context, state) {
            if (state is GotFilesState) {
              final files = state.files;
              if (files.isEmpty) {
                return const Center(
                  child: Text('no files for now '),
                );
              }
              return ListView.builder(
                itemCount: files.length,
                itemBuilder: (context, index) {
                  final fileName = files[index];
                  return ListTile(
                    onTap: () {
                      context.read<FilesCubit>().readFile(fileName);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => FileContentScreen(
                            fileName: fileName,
                          ),
                        ),
                      );
                    },
                    title: Text(fileName),
                    trailing: IconButton(
                      onPressed: () {
                        context.read<FilesCubit>().deleteFile(
                              fileName: fileName,
                            );
                      },
                      icon: const Icon(
                        Icons.delete,
                        color: Colors.red,
                      ),
                    ),
                  );
                },
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
    );
  }
}
