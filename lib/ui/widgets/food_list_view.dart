import 'package:flutter/material.dart';
import 'package:flutter_project/ui_kit/app_color.dart';
import '../../data/models/food.dart';
import '../../states/food_state.dart';
import '../../ui_kit/app_text_style.dart';
import '../screens/food_detail_screen.dart';

class FoodListView extends StatelessWidget {
  const FoodListView(
      {super.key, required this.foodIds, this.isReversed = false});

  final List<int> foodIds;
  final bool isReversed;

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return SizedBox(
      height: 200,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(top: 20),
          itemBuilder: (_, index) {
            Food food = isReversed
                ? FoodState().foodById(foodIds.reversed.toList()[index])
                : FoodState().foodById(foodIds[index]);
            return GestureDetector(
              onTap: () async {
                // ignore: avoid_print
                print('Клик на карточку');
                await FoodState().onFoodTap(food.id);
                // ignore: use_build_context_synchronously
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const FoodDetail()),
                );
              },
              child: Container(
                width: 160,
                decoration: BoxDecoration(
                  color: isDark ? DarkThemeColor.primaryLight : Colors.white,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(food.image, scale: 6),
                      Text(
                        "\$${food.price}",
                        style: AppTextStyle.h3Style
                            .copyWith(color: LightThemeColor.accent),
                      ),
                      Text(
                        food.name,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          separatorBuilder: (_, __) {
            return Container(
              width: 50,
            );
          },
          itemCount: foodIds.length,
      ),
    );
  }
}
