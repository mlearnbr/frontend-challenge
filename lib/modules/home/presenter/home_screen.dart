import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:star_wars/modules/home/domain/entities/people_entity.dart';

import 'controller/home_controller.dart';
import 'controller/home_state.dart';

class HomeScreen extends StatefulWidget {
  final HomeController homeController;

  const HomeScreen({
    super.key,
    required this.homeController,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    getAllPeople();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Star Wars App'),
      ),
      body: Observer(builder: (context) {
        if (widget.homeController.state is LoadingHomeState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(
                    height: 50,
                    width: 50,
                    child: CircularProgressIndicator(),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text('Por favor aguarde...'),
                  ),
                ],
              ),
            ),
          );
        }

        if (widget.homeController.state is ErrorHomeState) {
          final message =
              (widget.homeController.state as ErrorHomeState).message;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.error_outline,
                    color: theme.primaryColor,
                    size: 80,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text(
                      message,
                      style: theme.textTheme.titleMedium,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                      child: const Text('Tentar novamente'),
                      onPressed: () {
                        getAllPeople();
                      },
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        if (widget.homeController.state is LoadedHomeState) {
          List<PeopleEntity> listPeople =
              (widget.homeController.state as LoadedHomeState).listPeople;

          return ListView.builder(
            itemBuilder: (context, index) {
              return const Placeholder();
            },
            itemCount: listPeople.length,
          );
        }

        return const SizedBox.shrink();
      }),
    );
  }

  void getAllPeople() {
    widget.homeController.getAllPeople();
  }
}
