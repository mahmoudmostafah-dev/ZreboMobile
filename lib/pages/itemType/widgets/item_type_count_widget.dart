import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../models/itemType.dart';
import '../../../shared/app_utils/size_config.dart';
import '../../../shared/server_names.dart';
import '../../../shared/widgets/condition_builder_widget.dart';
import '../../../shared/widgets/text_utils.dart';

class ItemTypeCountWidget extends StatelessWidget {
  ItemTypeCountWidget({super.key, required this.listItemType});

  final List<ItemTypeModel> listItemType;

  @override
  Widget build(BuildContext context) {
    return ConditionBuilderWidget(
      condition: listItemType.isNotEmpty,
      builder: (context) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4, // number of items per row is set to 4
          childAspectRatio:
              SizeConfig.blockSizeVertical * 0.08, // aspect ratio of each item
          crossAxisSpacing: SizeConfig.blockSizeHorizontal *
              2, // horizontal space between items
          mainAxisSpacing:
              SizeConfig.blockSizeVertical * 1, // vertical space between items
        ),
        itemCount: listItemType.length,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.amber.shade100,
                  radius: SizeConfig.blockSizeVertical * 4.5,
                  child: CachedNetworkImage(
                    imageUrl:
                        '${ServerNames.serverImages}${listItemType[index].image}',
                    width: SizeConfig.safeBlockHorizontal * 11,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                    height: SizeConfig.blockSizeVertical *
                        1), // Space between the image and text
                TextUtils(
                  text: listItemType[index].name,
                  fontSize: SizeConfig.safeBlockHorizontal *
                      3, // Adjust font size if necessary
                  color: Colors.black45,
                ),
                TextUtils(
                  text: '(${listItemType[index].itemCount.toString()})',
                  fontSize: SizeConfig.safeBlockHorizontal *
                      3, // Adjust font size if necessary
                  color: Colors.black45,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
