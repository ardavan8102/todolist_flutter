import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/core/helpers/get_now_jalali_date.dart';
import 'package:tikino/core/helpers/get_total_stats.dart';
import 'package:tikino/data/model/grid_category_model.dart';
import 'package:tikino/data/provider/home_grid_item_provider.dart';
import 'package:tikino/gen/assets.gen.dart';
import 'package:tikino/presentation/widgets/cards/quick_stats_card.dart';

class HomepageScreen extends StatelessWidget {
  const HomepageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
    var size = MediaQuery.of(context).size;
    
    var textTheme = Theme.of(context).textTheme;

    final gridItems = context.watch<HomeGridProvider>().items;

    return Stack(
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
    
        // page title
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
            
                const SizedBox(height: 10),
            
                // Content
                Expanded(
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 0.8
                    ),
                    itemCount: gridItems.length,
                    itemBuilder: (context, index) {
                      
                      final item = gridItems[index];
                  
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Material(
                            color: AppSolidColors.primary.withValues(alpha: .2),
                            borderRadius: .circular(16),
                            child: InkWell(
                              onTap: () {
                                if (item.action == HomeGridAction.openCalender) {
                  
                                  // TODO : open calendar page
                  
                                } else if (item.action == HomeGridAction.habitTracker) {
                  
                                  // TODO : Open habit tracker
                  
                                } else if (item.action == HomeGridAction.openHomeWorkPage) {
                  
                                  // TODO : Open homework page
                  
                                } else if (item.action == HomeGridAction.openOccasionPage) {
                  
                                  // TODO : Open Occasions page
                  
                                } else {
                  
                                  // TODO : Open countdowns oage
                  
                                }
                              },
                              splashColor: AppSolidColors.whiteBackground.withValues(alpha: .5),
                              borderRadius: .circular(16),
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: .circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withValues(alpha: .05),
                                      blurRadius: 10
                                    ),
                                  ],
                                ),
                                child: SizedBox(
                                  height: 48,
                                  width: 48,
                                  child: item.icon,
                                ),
                              ),
                            ),
                          ),
                                      
                          const SizedBox(height: 10),
                                      
                          Text(
                            item.title,
                            style: TextStyle(
                              fontWeight: .bold,
                              color: AppSolidColors.primary
                            ),
                            textAlign: .center,
                          )
                        ],
                      );
                  
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ],
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

}