import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_cubit.dart';
import 'package:admin_e_commerce/features/dash_board/logic/cubit/dash_board_state.dart';
import 'package:admin_e_commerce/features/dash_board/ui/widgets/custom_appbar_web.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashBoardScreen extends StatelessWidget {
  const DashBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CustomAppBarWeb(
            title: 'Delish Delivery Admin',
          ),
          BlocBuilder<DashBoardCubit, DashBoardState>(
            builder: (context, state) {
              var cubit = DashBoardCubit.get(context);
              return Expanded(
                flex: 1,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: <Widget>[
                        NavigationRail(
                          selectedIndex: cubit.selectedIndex,
                          onDestinationSelected: cubit.changeIndex,
                          labelType: NavigationRailLabelType.none,
                          backgroundColor: Colors.transparent,
                          destinations: const [
                            NavigationRailDestination(
                              icon: Icon(Icons.add),
                              label: Text(''),
                            ),
                            NavigationRailDestination(
                              icon: Icon(Icons.production_quantity_limits),
                              label: Text(''),
                            ),
                            NavigationRailDestination(
                              icon: Icon(Icons.ads_click),
                              label: Text(''),
                            ),
                          ],
                        ),
                      ],
                    ),

                    const VerticalDivider(thickness: 1, width: 1),
                    Expanded(
                        flex: 3, child: cubit.layouts[cubit.selectedIndex]),
                    // Spacer()
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
