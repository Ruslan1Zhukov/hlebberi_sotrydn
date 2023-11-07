import 'package:flutter/material.dart';
import 'package:hlebberi_sotrydn/model/zp.dart';

const double _radius = 27;

class DiagramWidget extends StatelessWidget {
  const DiagramWidget({
    super.key,
    required this.zp,
  });

  final Zp? zp;

  @override
  Widget build(BuildContext context) {
    var zp = this.zp;
    if (zp == null) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(_radius),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 27,
              alignment: Alignment.center,
              child: const Text("Нет данных"),
            ),
          ],
        ),
      );
    }
    var widthScreen = MediaQuery.of(context).size.width;
    var count = zp.items.length.toDouble();
    var sum = zp.sumDouble();
    return ClipRRect(
      borderRadius: BorderRadius.circular(_radius),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for (var item in zp.items)
            _buildItemWidget(
              item,
              item.getFlex(
                widthScreen: widthScreen,
                count: count,
                sum: sum,
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildItemWidget(PlotItem plotItem, double flex) {
    return Flexible(
      flex: flex.toInt(),
      child: Container(
        height: 27,
        alignment: Alignment.center,
        color: plotItem.color,
        child: Text(
          plotItem.value.toString(),
          maxLines: 1,
        ),
      ),
    );
  }
}
