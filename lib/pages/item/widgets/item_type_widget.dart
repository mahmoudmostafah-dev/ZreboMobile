import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/itemType.dart';
import '../../../shared/server_names.dart';
import '../../../shared/widgets/condition_builder_widget.dart';
import '../../../shared/widgets/text_utils.dart';

class ItemTypeWidget extends StatelessWidget {
  ItemTypeWidget({super.key, required this.listItemType});

  final List<ItemTypeModel> listItemType;

  @override
  Widget build(BuildContext context) {
    return ConditionBuilderWidget(
      condition: listItemType.isNotEmpty,
      builder: (context) => SizedBox(
        height: 150,
        width: double.infinity, // Set a specific width
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: listItemType.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () => print(listItemType[index].name),
              child: Column(
                children: [
                  CircleAvatar(
                      backgroundColor: Colors.amber.shade100,
                      radius: 40,
                      child: CachedNetworkImage(
                        imageUrl:
                            '${ServerNames.serverImages}${listItemType[index].image}',
                        width: 40,
                        fit: BoxFit.cover,
                      )),
                  TextUtils(
                    text: listItemType[index].name,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ],
              ),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
