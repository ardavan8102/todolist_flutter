import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tikino/core/consts/colors.dart';
import 'package:tikino/core/consts/strings.dart';
import 'package:tikino/core/helpers/get_now_jalali_date.dart';
import 'package:tikino/core/helpers/home_grid_navigation.dart';
import 'package:tikino/data/provider/home_grid_item_provider.dart';
import 'package:tikino/presentation/widgets/containers/home_page_top_background.dart';
import 'package:tikino/presentation/widgets/containers/quick_stats_container.dart';

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
        HomePageTopBackground(size: size),
    
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
                style: textTheme.labelSmall!.copyWith(
                  color: Colors.white.withValues(alpha: .7)
                ),
              ),
    
              const SizedBox(
                height: 16,
              ),
    
              Text(
                AppStrings.homepageWelcomeText,
                style: textTheme.titleLarge!.copyWith(
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
                QuickStatsContainer(),
            
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
                              onTap: () => homeGridNavigation(item),
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
}