import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';

import '../../../core/provider/UserDataState_Provider.dart';

class ProgressbarWidget extends StatelessWidget {
  const ProgressbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 10.h,
        ),
        SizedBox(
            height: 0.45.sh, width: double.infinity, child: ProgressBarChart())
      ],
    );
  }
}

//tesr
class ProgressBarChart extends StatefulWidget {
  const ProgressBarChart({super.key});

  final Color barBackgroundColor = Colors.black87;
  final Color barColor = Colors.purple;
  final Color touchedBarColor = Colors.green;

  @override
  State<StatefulWidget> createState() => ProgressBarChartState();
}

class ProgressBarChartState extends State<ProgressBarChart> {
  final Duration animDuration = const Duration(milliseconds: 250);

  int touchedIndex = -1;
  List<int> tem = [];
  List<Map<String, String>> usagedisplayer = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var box = Hive.box('UserData');
    var rawUsageHistory = box.get("progresshistory", defaultValue: []);

    if (rawUsageHistory != []) {
      usagedisplayer = (rawUsageHistory as List).map((item) {
        return (item as Map)
            .map((key, value) => MapEntry(key as String, value as String));
      }).toList();
      for (var dateMap in usagedisplayer) {
        tem.add(int.parse(dateMap["stats"]!));
      }
      print(findMax(tem) + 5);
    }
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<UserdatastateProvider>(context, listen: false);
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(9),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'weekly_performance',
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ).tr(),
                Expanded(
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 2, vertical: 70),
                    child: BarChart(
                      mainBarData(),
                      swapAnimationDuration: animDuration,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  int findMax(List<int> numbers) {
    int max = numbers[0];
    for (int i = 1; i < numbers.length; i++) {
      if (numbers[i] > max) {
        max = numbers[i];
      }
    }
    return max;
  }

  BarChartGroupData makeGroupData(
    int x,
    double y, {
    bool isTouched = false,
    Color? barColor,
    double width = 22,
    List<int> showTooltips = const [],
  }) {
    barColor ??= widget.barColor;
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: isTouched ? y + 1 : y,
          color: isTouched ? widget.touchedBarColor : barColor,
          width: width,
          borderSide: isTouched
              ? BorderSide(color: Colors.white, width: 0)
              : const BorderSide(color: Colors.white, width: 0),
          backDrawRodData: BackgroundBarChartRodData(
            show: true,
            toY: findMax(tem) + 20,
            color: widget.barBackgroundColor,
          ),
        ),
      ],
      showingTooltipIndicators: showTooltips,
    );
  }

  List<BarChartGroupData> showingGroups() => List.generate(7, (i) {
        switch (i) {
          case 0:
            return makeGroupData(
                0, int.parse(usagedisplayer[0]['stats']!).toDouble(),
                isTouched: i == touchedIndex);
          case 1:
            return makeGroupData(
                1, int.parse(usagedisplayer[1]['stats']!).toDouble(),
                isTouched: i == touchedIndex);
          case 2:
            return makeGroupData(
                2, int.parse(usagedisplayer[2]['stats']!).toDouble(),
                isTouched: i == touchedIndex);
          case 3:
            return makeGroupData(
                3, int.parse(usagedisplayer[3]['stats']!).toDouble(),
                isTouched: i == touchedIndex);
          case 4:
            return makeGroupData(
                4, int.parse(usagedisplayer[4]['stats']!).toDouble(),
                isTouched: i == touchedIndex);
          case 5:
            return makeGroupData(
                5, int.parse(usagedisplayer[5]['stats']!).toDouble(),
                isTouched: i == touchedIndex);
          case 6:
            return makeGroupData(
                6, int.parse(usagedisplayer[6]['stats']!).toDouble(),
                isTouched: i == touchedIndex);
          default:
            return throw Error();
        }
      });

  BarChartData mainBarData() {
    return BarChartData(
      barTouchData: BarTouchData(
        touchTooltipData: BarTouchTooltipData(
          getTooltipColor: (_) => Colors.blue,
          tooltipHorizontalAlignment: FLHorizontalAlignment.right,
          tooltipMargin: -10,
          getTooltipItem: (group, groupIndex, rod, rodIndex) {
            String weekDay;
            switch (group.x) {
              case 0:
                weekDay = context.tr('monday');
                break;
              case 1:
                weekDay = context.tr('tuesday');
                break;
              case 2:
                weekDay = context.tr('wednesday');
                break;
              case 3:
                weekDay = context.tr('thursday');
                break;
              case 4:
                weekDay = context.tr('friday');
                break;
              case 5:
                weekDay = context.tr('saturday');
                break;
              case 6:
                weekDay = context.tr('sunday');
                break;
              default:
                throw Error();
            }
            return BarTooltipItem(
              '$weekDay\n',
              const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: (rod.toY - 1).toString(),
                  style: const TextStyle(
                    color: Colors.white, //widget.touchedBarColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            );
          },
        ),
        touchCallback: (FlTouchEvent event, barTouchResponse) {
          setState(() {
            if (!event.isInterestedForInteractions ||
                barTouchResponse == null ||
                barTouchResponse.spot == null) {
              touchedIndex = -1;
              return;
            }
            touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
          });
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: const AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            getTitlesWidget: getTitles,
            reservedSize: 38,
          ),
        ),
        leftTitles: const AxisTitles(
          sideTitles: SideTitles(
            showTitles: false,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: false,
      ),
      barGroups: showingGroups(),
      gridData: const FlGridData(show: false),
    );
  }

  Widget getTitles(double value, TitleMeta meta) {
    const style = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 14,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('m', style: style).tr();
        break;
      case 1:
        text = const Text('t', style: style).tr();
        break;
      case 2:
        text = const Text('w', style: style).tr();
        break;
      case 3:
        text = const Text('t', style: style).tr();
        break;
      case 4:
        text = const Text('f', style: style).tr();
        break;
      case 5:
        text = const Text('s', style: style).tr();
        break;
      case 6:
        text = const Text('s', style: style).tr();
        break;
      default:
        text = const Text('', style: style);
        break;
    }
    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 16,
      child: text,
    );
  }
}
