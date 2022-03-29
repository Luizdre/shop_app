import 'package:mobx/mobx.dart';
import 'package:shop_app/app/modules/shared/components/bag.dart';
import 'package:shop_app/app/modules/shared/components/shopDetails.dart';
import 'package:shop_app/app/modules/shared/components/shopHive.dart';
import 'package:shop_app/app/modules/shared/models/product_model.dart';
import 'package:shop_app/app/modules/shared/service/categories_service.dart';
import 'package:shop_app/app/modules/shared/service/product_service.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final Bag bag;
  final ShopHive shopHive;
  final ProductService productservice;
  final CategoriesService categoriesService;
  final ShopDetails shopDetails;

  _HomeStoreBase(this.bag, this.categoriesService, this.productservice,
      this.shopDetails, this.shopHive);

  @observable
  List<String> categories = [];

  @observable
  List<ProductModel> products = [];

  @observable
  List<ProductModel> filteredProducts = [];

  @observable
  String categoryFiltered = '';

  @observable
  double valueToFilter = 0;

  @observable
  bool isFiltering = true;

  @observable
  bool isLoading = false;

  @observable
  double maxPrice = 0;

  getCategories() async {
    isLoading = true;
    categories = await categoriesService
        .getCategories()
        .whenComplete(() => isLoading = false);
  }

  getProducts() async {
    isLoading = true;
    products = await productservice
        .getProducts()
        .whenComplete(() => isLoading = false);
    filteredProducts = products;
    getMaxPrice();
  }

  getProductByCategory(String category) async {
    if (category == categoryFiltered) {
      categoryFiltered = '';
      filteredProducts = products;
    } else {
      isLoading = true;
      categoryFiltered = category;
      filteredProducts = await categoriesService
          .getProductsByCategory(category)
          .whenComplete(() => isLoading = false);
    }
  }

  @action
  filterByPrice(double value) {
    valueToFilter = value;
    filteredProducts =
        products.where((element) => element.price! <= valueToFilter).toList();
  }

  @action
  getMaxPrice() {
    maxPrice = products
        .reduce((price, next) => price.price! > next.price! ? price : next)
        .price!;
  }

  @action
  turnFilter() {
    isFiltering = !isFiltering;
  }

  getInformation() {
    getCategories();
    getProducts();
  }
}
