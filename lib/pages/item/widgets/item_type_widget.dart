import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/itemType.dart';
import '../../../shared/app_utils/size_config.dart';
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
        height: SizeConfig.blockSizeVertical * 14,
        width: double.infinity, // Set a specific width
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: listItemType.length,
          physics: const BouncingScrollPhysics(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
                if (listItemType[index].id == -1) {
                  print(listItemType[index].name);
                } else {
                  print(listItemType[index].name);
                }
              },
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundColor: listItemType[index].id == -1
                        ? Colors.orange.shade200
                        : Colors.amber.shade100,
                    radius: SizeConfig.blockSizeVertical * 4.5,
                    child: listItemType[index].id == -1
                        ? const Icon(
                            Icons.arrow_forward,
                            color: Colors.red,
                            size: 30,
                          )
                        : CachedNetworkImage(
                            imageUrl:
                                '${ServerNames.serverImages}${listItemType[index].image}',
                            width: SizeConfig.safeBlockHorizontal * 11,
                            fit: BoxFit.cover,
                          ),
                  ),
                  TextUtils(
                    text: listItemType[index].name,
                    fontSize:
                        SizeConfig.safeBlockHorizontal * 5, // Adjust font size
                    color:
                        listItemType[index].id == -1 ? Colors.red : Colors.red,
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
