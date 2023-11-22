import '../models/RestaurantItem.dart';
import '../models/itemType.dart';
import '../shared/network/end_points.dart';
import '../shared/network/remote/dio_helper.dart';

class ItemProvider {
  Future<ItemTypePaginated> getAllItemTypePaginated(
      {int page = 1, int pageSize = 10}) async {
    var value = await DioHelper.getData(
        url: EndPoint.apiItemType, query: {'page': page, 'pageSize': pageSize});

    if (value!.statusCode == 200 || value!.statusCode == 201) {
      return ItemTypePaginated.fromJson(value.data);
    } else {
      return throw Exception("Failed to Item Type Paginated");
    }
  }

  Future<List<ItemTypeModel>> getAllItemTypeWithItemCount() async {
    var value = await DioHelper.getData(
      url: EndPoint.apiItemTypeWithItemCount,
      query: {},
    );

    List<ItemTypeModel> itemsType = [];

    if (value!.statusCode == 200 || value!.statusCode == 201) {
      value.data.forEach((row) {
        itemsType.add(ItemTypeModel.fromJson(row));
      });
      return itemsType;
    } else {
      return throw Exception("Failed to Item Type Paginated");
    }
  }

  Future<RestaurantItemPaginated> getAllRestWithItemsPaginated(
      {int page = 1, int pageSize = 10}) async {
    var value = await DioHelper.getData(
        url: EndPoint.apiGetAllWithItems,
        query: {'page': page, 'pageSize': pageSize});

    if (value!.statusCode == 200 || value!.statusCode == 201) {
      return RestaurantItemPaginated.fromJson(value.data);
    } else {
      return throw Exception("Failed to Item Type Paginated");
    }
  }
}
