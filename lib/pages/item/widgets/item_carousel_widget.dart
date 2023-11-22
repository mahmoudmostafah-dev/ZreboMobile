import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../models/RestaurantItem.dart';
import '../../../shared/server_names.dart';
import '../../../shared/widgets/text_utils.dart';

class ItemCarouselWidget extends StatelessWidget {
  const ItemCarouselWidget({
    super.key,
    required this.index,
    required this.listRestaurantItem,
    required this.restaurantItemIndex,
    required this.onPageChanged,
  });

  final int index;
  final int restaurantItemIndex;
  final List<RestaurantItemResult> listRestaurantItem;
  final Function(int, CarouselPageChangedReason)? onPageChanged;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          margin: const EdgeInsetsDirectional.only(
            start: 10,
            end: 10,
          ),
          height: 200,
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30), //border corner radius
            image: DecorationImage(
              // Use CachedNetworkImageProvider to load the image
              image: CachedNetworkImageProvider(
                '${ServerNames.serverImages}${listRestaurantItem[index].menuRest[restaurantItemIndex].item.images[0].image}',
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5), //color of shadow
                spreadRadius: 5, //spread radius
                blurRadius: 7, // blur radius
                offset: const Offset(0, 2), // changes position of shadow
              ),
              //you can set more BoxShadow() here
            ],
          ),
          child: Stack(
            children: [
              CarouselSlider(
                // carouselController: bean.carouselController,
                items: listRestaurantItem[index]
                    .menuRest
                    .map((item) => Container())
                    .toList(),
                options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  autoPlay: false,
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: onPageChanged,
                ),
              ),
              Positioned(
                bottom: 0,
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 200),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.7),
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(
                        30.0,
                      ), // Adjust the values as needed
                      bottomLeft: Radius.circular(30.0),
                      bottomRight: Radius.circular(15.0),
                      // Adjust the values as needed
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.only(
                        start: 8, top: 8, end: 30, bottom: 8),
                    child: Column(
                      children: [
                        TextUtils(
                          text: listRestaurantItem[index]
                              .menuRest[restaurantItemIndex]
                              .item
                              .name,
                          color: Colors.white,
                          maxLines: 1,
                          textOverflow: TextOverflow.ellipsis,
                        ),
                        TextUtils(
                          text: listRestaurantItem[index]
                              .menuRest[restaurantItemIndex]
                              .price,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15,
                bottom: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.7),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: AnimatedSmoothIndicator(
                      activeIndex: restaurantItemIndex,
                      count: listRestaurantItem[index].menuRest.length,
                      effect: const SwapEffect(
                        activeDotColor: Colors.white,
                        dotColor: Colors.grey,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.only(start: 10, top: 10),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl:
                    '${ServerNames.serverImages}${listRestaurantItem[index].logo}',
                width: 50,
              ),
              const SizedBox(width: 10),
              TextUtils(
                text: listRestaurantItem[index].name,
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ],
          ),
        )
      ],
    );
  }
}
