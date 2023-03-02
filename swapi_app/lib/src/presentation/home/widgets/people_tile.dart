import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:swapi_app/shared/config/routes/app_routes.dart';
import 'package:swapi_app/src/domain/entities/people_entity.dart';

class PeopleTile extends StatelessWidget {
  final int index;
  final PeopleEntity people;
  const PeopleTile({
    super.key,
    required this.index,
    required this.people,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Get.toNamed(AppRoutes.DETAILS, arguments: {
          'people': people,
        });
      },
      dense: true,
      minVerticalPadding: 10,
      horizontalTitleGap: 6,
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        color: Theme.of(context).primaryColor,
      ),
      title: Row(
        children: [
          Text(
            '${index + 1}',
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            people.name,
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.w700,
              fontSize: 22,
            ),
          ),
        ],
      ),
      subtitle: Text(
        'Birth year: ${people.birthYear ?? 'not specified'}',
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.normal,
          fontSize: 16,
        ),
      ),
    );
  }
}
