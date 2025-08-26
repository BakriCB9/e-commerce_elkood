import 'package:ecommerce_elk/core/base_state/base_state.dart';
import 'package:ecommerce_elk/core/routes/routes.dart';
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
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      body: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          //loading
          if (state.productState is BaseLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          //success
          else if (state.productState is BaseSuccessState) {
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
                        IconButton(
                          onPressed: () => Navigator.of(context).pushNamed(
                            Routes.searchScreen,
                            arguments: result.data!.$2,
                          ),
                          icon: Icon(Icons.search),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),

                    Expanded(child: SectionContentItems(data: result.data!)),
                  ],
                ),
              ),
            );
          }
          //failure
          else if (state.productState is BaseErrorState) {
            final result = state.productState as BaseErrorState;

            return Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(result.errorMessage, textAlign: TextAlign.center),
                    ElevatedButton(
                      onPressed: () => context.read<HomeCubit>().getProducts(),
                      child: Text(" Try again "),
                    ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox();
        },
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
