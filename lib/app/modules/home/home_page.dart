import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shop_app/app/modules/home/home_store.dart';
import 'package:shop_app/app/modules/shared/components/product_card.dart';
import 'package:shop_app/app/modules/shared/components/shopBottomNavigation.dart';
import 'package:shop_app/app/modules/shared/components/shopErrorWidget.dart';
import 'package:shop_app/app/modules/shared/components/shopFilterComponent.dart';
import 'package:shop_app/app/modules/shared/components/shopFloactingButton.dart';
import 'package:shop_app/app/modules/shared/components/shopProgressIndicatorComponent.dart';
import 'package:shop_app/app/modules/shared/components/shopTextComponent.dart';
import 'package:shop_app/app/modules/shared/const/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    store.getInformation();
    store.isFiltering = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size.width * 0.05),
            child: IconButton(
                onPressed: () => store.turnFilter(),
                icon: SvgPicture.asset('assets/icons/filter_icon.svg',
                    height: size.height * 0.04)),
          )
        ],
        centerTitle: true,
        title: ShopText(text: store.shopDetails.name),
        elevation: 0,
      ),
      bottomNavigationBar: const ShopBottomNavigationBar(),
      floatingActionButton: const ShopFloatingbutton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Observer(
          builder: (context) => store.isLoading
              ? const Center(child: ShopProgressIndicator())
              : store.categories.isEmpty || store.products.isEmpty
                  ? Center(child: ShopError(retry: store.getInformation))
                  : Stack(
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border(
                                      top: BorderSide(
                                          color: sMidGreyOpacity, width: 0.5))),
                              height: size.height * 0.08,
                              child: Center(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: store.categories.length,
                                    itemBuilder: (_, index) => InkWell(
                                          onTap: () =>
                                              store.getProductByCategory(
                                                  store.categories[index]),
                                          child: Center(
                                            child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: ShopText(
                                                text: store.categories[index],
                                                color: store.categoryFiltered ==
                                                        store.categories[index]
                                                    ? Colors.black
                                                    : sGreyWithOpacity,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ),
                                        )),
                              ),
                            ),
                            Expanded(
                                child: GridView.builder(
                                    itemCount: store.filteredProducts.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithFixedCrossAxisCount(
                                            crossAxisCount: 2),
                                    itemBuilder: (_, index) => ProductCard(
                                        product:
                                            store.filteredProducts[index])))
                          ],
                        ),
                        Positioned(
                            top: 5,
                            right: 5,
                            child: AnimatedOpacity(
                                opacity: store.isFiltering ? 1 : 0,
                                duration: const Duration(milliseconds: 500),
                                child: ShopFilterComponent(store: store))),
                      ],
                    )),
    );
  }
}
