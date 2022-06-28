import 'package:application/ui/pages/detail/index.dart';

class DetailItem extends StatelessWidget {
  final String name;
  final String height;
  final String weight;
  final String type;
  final int numb;
  final int id;

  const DetailItem({
    Key? key,
    required this.name,
    required this.height,
    required this.weight,
    required this.type,
    required this.numb,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          children: <Widget>[
            _imagePokemon(),
            _namePokemon(),
            _numbPokemon(),
            DescriptionText(
              height: height,
              weight: weight,
              type: type,
            ),
          ],
        ));
  }

  Widget _imagePokemon() {
    return SizedBox(
        height: 160.0,
        child: CachedNetworkImage(
          imageUrl: 'https://cdn.traction.one/pokedex/pokemon/$numb.png',
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
            child: CircularProgressIndicator(value: downloadProgress.progress),
          ),
          errorWidget: (context, url, error) =>
              const Icon(Icons.image_search, size: 45.0),
        ));
  }

  Widget _namePokemon() {
    return Padding(
      padding: const EdgeInsets.only(top: 40.0),
      child: Text(name.toUpperCase(),
          style: const TextStyle(
            fontFamily: 'Gotham',
            fontWeight: FontWeight.bold,
            fontSize: 28.0,
            color: kReallyGrey,
          )),
    );
  }

  Widget _numbPokemon() {
    return Padding(
        padding: const EdgeInsets.only(top: 10.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('NUMBER: ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Gotham',
                  fontSize: 18.0,
                  color: kReallyGrey.withOpacity(0.8),
                )),
            Text(formatID(id),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic,
                  fontFamily: 'CircularStd',
                  fontSize: 21.5,
                  color: kLightGrey,
                )),
          ],
        ));
  }
}
