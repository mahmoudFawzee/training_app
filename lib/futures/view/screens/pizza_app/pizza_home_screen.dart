import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_training/futures/logic/cubits/theme_cubit/theme_cubit.dart';
import 'package:flutter_training/futures/data/models/pizza.dart';
import 'package:flutter_training/futures/view/screens/pizza_app/settings.dart';
import 'package:flutter_training/futures/data/services/pizze_service.dart';

class PizzaHomeScreen extends StatefulWidget {
  const PizzaHomeScreen({super.key});

  @override
  State<PizzaHomeScreen> createState() => _PizzaHomeScreenState();
}

class _PizzaHomeScreenState extends State<PizzaHomeScreen> {
  @override
  void initState() {
    super.initState();
    PizzaService.getPizza(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<ThemeCubit>(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'pizza app',
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => BlocProvider.value(
                      value: BlocProvider.of<ThemeCubit>(context),
                      child:const SettingScreen(),
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
        body: FutureBuilder<List<Pizza>>(
          future: PizzaService.getPizza(context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasData) {
              final pizzasList = snapshot.data;
              return ListView.builder(
                  itemCount: (pizzasList == null) ? 0 : pizzasList.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(pizzasList![index].name),
                      subtitle: Text(
                        '${pizzasList[index].description} - € ${pizzasList[index].price}',
                      ),
                    );
                  });
            }
            return Container();
          },
        ),
      ),
    );
  }
}
