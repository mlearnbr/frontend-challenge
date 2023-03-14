import 'package:challenge/Modules/homePage/presentation/controller/bill_bloc/home_people_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../Core/baseStates/base_states.dart';
import '../controller/bill_bloc/home_people_bloc.dart';
import '../controller/bill_bloc/home_people_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final homePeopleBloc = Modular.get<HomePeopleBloc>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'teste',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: LayoutBuilder(
        builder: (_, constraints) {
          return BlocProvider(
            create: (_) => homePeopleBloc..add(const FetchPeoples()),
            child: BlocBuilder<HomePeopleBloc, AppState>(
              builder: (context, state) {
                if (state is InitialState) {
                  return const Center(
                    child: Text("Crie Contas"),
                  );
                }
                if (state is GettingAllPeoplesState) {
                  return const CircularProgressIndicator();
                }
                return SizedBox(
                  height: constraints.maxHeight,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: homePeopleBloc.peoples.length,
                      itemBuilder: (context, i) {
                        return Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListTile(
                            title: Text(homePeopleBloc.peoples[i].name!),
                            trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: const [
                                  Icon(Icons.edit),
                                  Icon(Icons.delete)
                                ]),
                            leading: const CircleAvatar(
                              child: Icon(Icons.accessibility_new),
                            ),
                          ),
                        );
                      }),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
