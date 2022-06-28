import 'package:application/ui/pages/home/index.dart';

class PokemonItem extends StatelessWidget {
  final String name;
  final String type;
  final int numb;
  final Function() function;

  const PokemonItem({
    Key? key,
    required this.name,
    required this.type,
    required this.numb,
    required this.function,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: InkWell(
          onTap: function,
          child: Column(
            children: <Widget>[
              _buildingPokemonItem(),
              _namePokemon(),
            ],
          )),
    );
  }

  Widget _buildingPokemonItem() {
    return Container(
        padding: const EdgeInsets.all(20.0),
        height: 180.0,
        width: 160.0,
        decoration: BoxDecoration(
          color: colorItem(type),
          borderRadius: BorderRadius.circular(25.0),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: _imagePokemon());
  }

  Widget _imagePokemon() {
    return CachedNetworkImage(
      imageUrl: 'https://cdn.traction.one/pokedex/pokemon/$numb.png',
      progressIndicatorBuilder: (context, url, downloadProgress) => Center(
        child: CircularProgressIndicator(value: downloadProgress.progress),
      ),
      errorWidget: (context, url, error) =>
          const Icon(Icons.image_search, size: 45.0),
    );
  }

  Widget _namePokemon() {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Text(name,
          style: const TextStyle(
            fontFamily: 'Gotham',
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
            color: kReallyGrey,
          )),
    );
  }
}
