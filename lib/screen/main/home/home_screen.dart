import 'package:flutter/material.dart';
import 'package:fl_app/data/util/colors.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/home_bloc.dart';
import 'widget/category_item.dart';
import 'widget/product_item.dart';

class HomeScreen extends StatefulWidget {
  static Widget screen() => BlocProvider(
        create: (context) => HomeBloc(context),
        child: HomeScreen(),
      );

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeBloc bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<HomeBloc>(context);
    bloc.add(LaunchEvent());
    super.initState();
  }

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.grey,
      appBar: widgetAppBar(),
      body: widgetBody(),
    );
  }

  String select = "Toshkent";

  AppBar widgetAppBar() {
    return AppBar(
      backgroundColor: MyColors.white,
      title: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is LoadingState) return SizedBox();
          return Align(
            alignment: Alignment.centerRight,
            child: DropdownButton<String>(
              items: <String>[
                'Toshkent',
                'Buxoro',
              ].map((String value) {
                return new DropdownMenuItem<String>(
                  value: value,
                  child: new Text(value),
                );
              }).toList(),
              value: select,
              onChanged: (value) => setState(() => select = "$value"),
            ),
          );
        },
      ),
    );
  }

  Widget widgetBody() {
    return BlocBuilder<HomeBloc, HomeState>(
      builder: (context, state) {
        if (state is LoadingState)
          return Center(child: CircularProgressIndicator());
        if (state is SuccessState) {
          return Container(
            width: double.infinity,
            height: double.infinity,
            margin: EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Product Category"),
                SizedBox(
                  width: double.infinity,
                  height: 55,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: BouncingScrollPhysics(),
                    itemCount: state.categoryList.length,
                    itemBuilder: (context, index) {
                      return WidgetCategory(
                        name: state.categoryList[index].name,
                        selected: state.categoryList[index].selected,
                        onPressed: () =>
                            bloc.add(SelectCategoryEvent(index: index)),
                      );
                    },
                  ),
                ),
                Text(state.categoryTitle),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemCount: state.productList.length,
                    itemBuilder: (context, index) {
                      final model = state.productList[index];
                      return WidgetProduct(
                        name: model.name,
                        price: model.prices,
                        rating: model.rating,
                        imageUrl: model.imageUrl,
                        isFavorite: model.isFavorite,
                        onPressedItem: () => bloc.add(ItemEvent(index: index)),
                        onPressedBuy: () => bloc.add(BuyEvent(index: index)),
                        onPressedFavorite: () =>
                            bloc.add(FavoriteEvent(index: index)),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        }
        return SizedBox();
      },
    );
  }
}
