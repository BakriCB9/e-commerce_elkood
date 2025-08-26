import 'package:ecommerce_elk/core/base_state/base_state.dart';
import 'package:ecommerce_elk/features/home/domain/entity/product_entity.dart';
import 'package:ecommerce_elk/features/home/presentation/view_model/cubit/home_cubit.dart';
import 'package:ecommerce_elk/features/home/presentation/widget/section_content_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _controller;
  List<ProductEntity>? listOfFilter;
  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state.productState is BaseLoadingState) {
            return Center(child: CircularProgressIndicator());
          } else if (state.productState is BaseSuccessState) {
            final result =
                state.productState
                    as BaseSuccessState<(List<String>, List<ProductEntity>)>;
            return SafeArea(
              child: Padding(
                padding: EdgeInsetsGeometry.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "category",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),

                        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                      ],
                    ),
                    const SizedBox(height: 20),

                    // TabBar(
                    //   onTap: (index) {
                    //     listOfFilter = result.data!.$2
                    //         .where(
                    //           (item) => item.category == result.data!.$1[index],
                    //         )
                    //         .toList();
                    //   },
                    //   isScrollable: true,
                    //   controller: _controller,
                    //   tabs: result.data!.$1.map((e) => Text(e)).toList(),
                    // ),
                    // SizedBox(height: 20),
                    // Expanded(
                    //   child: TabBarView(
                    //     controller: _controller,
                    //     children: [
                    //       ListView.builder(
                    //         itemCount: listOfFilter?.length,
                    //         itemBuilder: (context, index) {
                    //           return Padding(
                    //             padding: const EdgeInsets.all(8.0),
                    //             child: Column(
                    //               children: [
                    //                 Text(listOfFilter?[index].title ?? "dd"),
                    //                 SizedBox(height: 10),
                    //                 Text(listOfFilter?[index].category ?? "dd"),
                    //               ],
                    //             ),
                    //           );
                    //         },
                    //       ),
                    //       Text("Bakkkkkkar aweja"),
                    //       Text("Bakkkkkkar aweja"),
                    //       Text("Bakkkkkkar aweja"),
                    //     ],
                    //   ),
                    // ),
                    Expanded(child: SectionContentItems(data: result.data!)),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<HomeCubit>().getProducts();
        },
      ),
    );
  }
}

late WidgetBuilder widgetBuilder;
