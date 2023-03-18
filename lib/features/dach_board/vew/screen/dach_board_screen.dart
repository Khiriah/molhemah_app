import 'package:advisor/core/constants/app_image.dart';
import 'package:advisor/core/constants/colors_app.dart';
import 'package:advisor/features/dach_board/vew/widget/slider_widgets/slider.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:syncfusion_flutter_charts/sparkcharts.dart';

class DashBoardScreen extends StatelessWidget {
   DashBoardScreen({Key? key}) : super(key: key);
  List<_SalesData> data = [
    _SalesData('Jan', 35),
    _SalesData('Feb', 28),
    _SalesData('Mar', 34),
    _SalesData('Apr', 32),
    _SalesData('May', 40)
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme
        .of(context)
        .textTheme;
    return Column(
      children: [
        Stack(
          children: [
            Container(
              height: 70,
              width: double.infinity,
              color: mainColor,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: Container(
                  height: 150.0,
                  width: 400,
                  decoration: const BoxDecoration(
                    color: Color(0xFFffffff),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 15.0, // soften the shadow
                        spreadRadius: 5.0, //extend the shadow
                        offset: Offset(
                          5.0, // Move to right 5  horizontally
                          5.0, // Move to bottom 5 Vertically
                        ),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:
                    Column(
                      children: [
                        Text('Hi, Kahiriah',style: theme.headlineLarge,),
                      SizedBox(height: 20,),
                      Image.asset(AppImages.dash,)
                      ],
                    ),
                  ),
                )
            ),
          ],
        ),
        Expanded(
          child: Column(
            children: [
              SliderWidget(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: SfCartesianChart(
                    primaryXAxis: CategoryAxis(),
                    // Chart title
                    title: ChartTitle(text: ''),
                    // Enable legend
                    legend: Legend(isVisible: false),
                    // Enable tooltip
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries<_SalesData, String>>[
                      LineSeries<_SalesData, String>(
                          dataSource: data,
                          xValueMapper: (_SalesData sales, _) => sales.year,
                          yValueMapper: (_SalesData sales, _) => sales.sales,
                          name: '',
                          // Enable data label
                          dataLabelSettings: DataLabelSettings(isVisible: false))
                    ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
    class _SalesData {
    _SalesData(this.year, this.sales);
    final String year;
    final double sales;
    }

