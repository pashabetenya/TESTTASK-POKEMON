import 'package:application/ui/pages/detail/index.dart';

class DetailPage extends StatefulWidget {
  final String name;
  final String height;
  final String weight;
  final String type;
  final int numb;
  final int id;

  const DetailPage({
    Key? key,
    required this.name,
    required this.height,
    required this.weight,
    required this.type,
    required this.numb,
    required this.id,
  }) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: colorItem(widget.type),
          elevation: 0.00,
          title: _textTitle(),
        ),
        backgroundColor: Colors.white,
        body: Stack(
          children: <Widget>[
            _buildingDetailPage(),
          ],
        ));
  }

  Widget _buildingDetailPage() {
    final size = MediaQuery.of(context).size;

    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
            alignment: Alignment.center,
            height: size.height / 1.9,
            width: size.width / 1.2,
            decoration: BoxDecoration(
              color: colorItem(widget.type),
              borderRadius: BorderRadius.circular(25.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 10),
                ),
              ],
            ),
            child: DetailItem(
              name: widget.name,
              height: widget.height,
              weight: widget.weight,
              type: widget.type,
              numb: widget.numb,
              id: widget.id,
            )),
      ],
    ));
  }

  Widget _textTitle() {
    return Text(widget.name,
        style: const TextStyle(
          color: kReallyGrey,
          fontFamily: 'Gotham',
          fontSize: 21.0,
        ));
  }
}
