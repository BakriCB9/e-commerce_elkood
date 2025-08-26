import 'package:ecommerce_elk/features/home/domain/entity/product_entity.dart';
import 'package:ecommerce_elk/features/home/presentation/widget/item_of_grid_view.dart';
import 'package:flutter/material.dart';

class SectionContentItems extends StatefulWidget {
  final (List<String>, List<ProductEntity>) data;
  const SectionContentItems({required this.data, super.key});

  @override
  State<SectionContentItems> createState() => _SectionContentItemsState();
}

class _SectionContentItemsState extends State<SectionContentItems>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<ProductEntity>? listOfFilter;
  @override
  void initState() {
    _controller = TabController(length: widget.data.$1.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: true,
          controller: _controller,
          tabs: widget.data.$1.map((e) => Text(e)).toList(),
        ),
        SizedBox(height: 20),
        Expanded(
          child: TabBarView(
            controller: _controller,
            children: List.generate(widget.data.$1.length, (index) {
              listOfFilter = widget.data.$2
                  .where((item) => item.category == widget.data.$1[index])
                  .toList();
              return Item(listOfProducts: listOfFilter);
            }),
          ),
        ),
      ],
    );
  }
}

class Item extends StatelessWidget {
  final List<ProductEntity>? listOfProducts;
  const Item({required this.listOfProducts, super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: listOfProducts?.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        childAspectRatio: 2 / 3,
      ),
      itemBuilder: (context, index) {
        return ItemOfGridView(productEntity: listOfProducts![index]);
      },
    );
  }
}
