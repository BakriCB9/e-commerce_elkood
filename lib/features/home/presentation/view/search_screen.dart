import 'package:ecommerce_elk/core/constant/app_colors.dart';
import 'package:ecommerce_elk/features/home/domain/entity/product_entity.dart';
import 'package:ecommerce_elk/features/home/presentation/widget/section_grid_view.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  final List<ProductEntity> listOfProducts;
  const SearchScreen({required this.listOfProducts, super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late ValueNotifier<List<ProductEntity>> _listFilter;

  @override
  initState() {
    _listFilter = ValueNotifier(widget.listOfProducts);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsGeometry.all(10),
          child: Column(
            spacing: 20,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: Icon(Icons.arrow_back),
                  ),
                  Expanded(
                    child: TextFormField(
                      onChanged: (value) {
                        _listFilter.value = widget.listOfProducts
                            .where(
                              (element) => element.title.toLowerCase().contains(
                                value.toLowerCase(),
                              ),
                            )
                            .toList();
                      },
                      cursorColor: AppColors.pink,
                      decoration: InputDecoration(hintText: "search"),
                    ),
                  ),
                ],
              ),
              Expanded(
                child: ValueListenableBuilder<List<ProductEntity>>(
                  valueListenable: _listFilter,
                  builder: (context, value, child) {
                    return SectionGridView(listOfProducts: value);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
