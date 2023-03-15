import 'package:challenge/Modules/homePage/presentation/controller/home_bloc/home_people_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../Core/baseStates/base_states.dart';
import '../controller/home_bloc/home_people_bloc.dart';
import '../controller/home_bloc/home_people_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with AutomaticKeepAliveClientMixin {
  final homePeopleBloc = Modular.get<HomeBloc>();

  @override
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        title: Image.asset(
          'assets/images/star_wars_logo.png',
          width: 80,
          height: 80,
        ),
      ),
      //Barra de pesquisa
      body: LayoutBuilder(
        builder: (_, constraints) {
          return BlocProvider(
            create: (_) => homePeopleBloc..add(const FetchPeoples()),
            child: BlocBuilder<HomeBloc, AppState>(
              builder: (context, state) {
                if (state is InitialState) {
                  return const Center(
                    child: Text(""),
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
                            onTap: () {
                              Modular.to.pushNamed('/detailPage', arguments: {
                                'people': homePeopleBloc.peoples[i]
                              });
                            },
                            title: Text(
                              homePeopleBloc.peoples[i].name!,
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium
                                  ?.copyWith(color: Colors.black),
                            ),
                            subtitle: Text(homePeopleBloc.peoples[i].birthYear!,
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium
                                    ?.copyWith(color: Colors.black)),
                            leading: const CircleAvatar(
                              child: Icon(Icons.account_box_rounded),
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
