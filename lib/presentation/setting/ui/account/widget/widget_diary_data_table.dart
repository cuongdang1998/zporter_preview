import 'package:flutter/material.dart';

class DiaryDataTable extends StatelessWidget {
  const DiaryDataTable({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ColumnTitles(),
          ContentRows(),
        ],
      ),
    );
  }
}

class ColumnTitles extends StatelessWidget {
  const ColumnTitles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: [
            ColumnCellTitle(
              isSort: true,
              title: 'Date',
              onSort: (){
                print("on tap");
              },
            ),
            ColumnCellTitle(
              title: 'Energy',
            ),
            ColumnCellTitle(
              title: 'Sleep',
            ),
            ColumnCellTitle(
              title: 'Eat',
            ),
            ColumnCellTitle(
              title: 'Pain',
            ),
            ColumnCellTitle(
              title: '',
              isSort: false,
              width: 30,
            ),
          ],
        ),
      ),
    );
  }
}

class ColumnCellTitle extends StatelessWidget {
  final double? width;
  final double? height;
  final String title;
  final bool? isSort;
  final VoidCallback? onSort;

  const ColumnCellTitle({
    Key? key,
    this.width = 65,
    this.height = 30,
    required this.title,
    this.isSort = false,
    this.onSort,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: GestureDetector(
        onTap: isSort! ? onSort : null,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 14),
            ),
            Visibility(
              visible: isSort!,
              child: Icon(
                Icons.arrow_drop_down_sharp,
                size: 18,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ContentRows extends StatelessWidget {
  final List<String>? rowDataList;

  ContentRows({Key? key, List<String>? rowDataList})
      : rowDataList = rowDataList ?? [],
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: rowDataList!.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return RowItem();
        },
      ),
    );
  }
}

class RowItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [],
      ),
    );
  }
}
class DiaryData {

}