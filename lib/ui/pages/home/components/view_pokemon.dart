import 'package:application/ui/pages/home/index.dart';

class ViewPokemon extends StatefulWidget {
  const ViewPokemon({Key? key}) : super(key: key);

  @override
  State<ViewPokemon> createState() => _ViewPokemonState();
}

class _ViewPokemonState extends State<ViewPokemon> {
  late Future<Pokemon> pokemon;

  @override
  void initState() {
    super.initState();

    pokemon = PokemonRepository().fetchPokemon();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _buildingListDats(),
    );
  }

  Widget _buildingListDats() {
    return FutureBuilder<Pokemon>(
      future: pokemon,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            itemCount: snapshot.data!.data.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 0.8,
            ),
            itemBuilder: (context, index) {
              final model = snapshot.data!.data[index];
              final color = snapshot.data!.data[index].type[0];
              return PokemonItem(
                name: model.name,
                type: color,
                numb: model.id,
                function: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        name: model.name,
                        height: model.height,
                        weight: model.weight,
                        type: model.type[0],
                        numb: model.id,
                        id: model.id,
                      ),
                    ),
                  );
                },
              );
            },
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Failed to load..'),
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
