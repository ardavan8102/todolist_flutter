import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/core/helpers/get_now_jalali_date.dart';
import 'package:tikino/core/helpers/get_total_stats.dart';
import 'package:tikino/data/provider/todo_provider.dart';
import 'package:tikino/gen/assets.gen.dart';
import 'package:tikino/presentation/widgets/cards/quick_stats_card.dart';
import 'package:tikino/presentation/widgets/containers/circle_overlay.dart';
import 'package:tikino/presentation/widgets/todo_item.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final todoProvider = Provider.of<Todoprovider>(context);
    
    var size = MediaQuery.of(context).size;
    
    var textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: size.height,
      width: size.width,
      child: Stack(
        children: [
    
          // page title's background
          Container(
            height: size.height * .3,
            width: size.width,
            decoration: BoxDecoration(
              color: AppSolidColors.primary,
              image: DecorationImage(
                image: AssetImage(Assets.image.homeAppbarBg.path),
                fit: BoxFit.cover,
                opacity: .5,
              ),
            ),
          ),

          // page titles
          Positioned(
            left: 0,
            right: 0,
            top: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  getNowJalaliDate(),
                  style: TextStyle(
                    color: Colors.white.withValues(alpha: .6),
                  ),
                ),

                const SizedBox(
                  height: 16,
                ),

                Text(
                  'بـه تیـکـیـنــو خـوش آمدیــد',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: .bold,
                    color: Colors.white
                  ),
                ),
              ],
            ),
          ),
    
          Positioned(
            left: 0,
            right: 0,
            top: size.height * .1,
            bottom: 0,
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
              
                  // quick stats
                  quickStatsSection(size),
              
                  const SizedBox(height: 40),
              
                  // Content
                  Expanded(
                    child: NestedScrollView(
                      physics: const BouncingScrollPhysics(),
                      headerSliverBuilder: (context, innerBoxIsScrolled) {
                        return [
                          SliverToBoxAdapter(
                            child: todoListColumn(size, todoProvider),
                          )
                        ];
                      },
                      body: Column(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container quickStatsSection(Size size) {
    return Container(
      height: size.height * .3,
      margin: const EdgeInsets.only(top: 40),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: AppSolidColors.lightBorder,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            spacing: 20,
            children: [
              Expanded(
                child: QuickStatsCardItem(
                  bgColor: Colors.green,
                  label: 'انجام شده',
                  value: totalTaskStats.totalCompleted.toString(),
                ),
              ),

              Expanded(
                child: QuickStatsCardItem(
                  bgColor: Colors.blueAccent,
                  label: 'درحال انجام',
                  value: activeTodosCount.toString(),
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          QuickStatsCardItem(
            bgColor: Colors.red.shade900,
            label: 'کارهــای حذف شده',
            value: totalTaskStats.totalDeleted.toString(),
          ),
        ],
      ),
    );
  }

  Column todoListColumn(Size size, Todoprovider todoProvider) {
    return Column(
      children: [
        Text(
          'لیســت کــارهای مــن',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: AppSolidColors.accent
          ),
        ),
    
        const SizedBox(height: 16),
    
        Container(
          height: size.height * .35,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: AppSolidColors.lightBorder,
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            physics: const ClampingScrollPhysics(),
            itemCount: todoProvider.todos.length,
            itemBuilder: (context, index){
              final todo = todoProvider.todos[index];
              return TodoItem(todo: todo, index: index);
            }
          ),
        ),
      ],
    );
  }
}