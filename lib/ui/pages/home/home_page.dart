import 'package:application/ui/pages/home/index.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Data> data = [];
  String keyboard = '';

  @override
  void initState() {
    super.initState();

    init();
  }

  Future init() async {
    final data = await PokemonRepository().fetchPokemon(keyboard);

    setState(() => this.data = data);
  }

  Future search(String query) async {
    final data = await PokemonRepository().fetchPokemon(query);

    if (!mounted) {
      return;
    }

    setState(() {
      keyboard = query;
      this.data = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kGreen,
        elevation: 0.00,
      ),
      body: Column(children: <Widget>[
        _searchBox(),
        _buildList(),
      ]),
    );
  }

  Widget _searchBox() {
    final size = MediaQuery.of(context).size;

    return SizedBox(
        height: size.height * 0.2,
        child: Stack(
          children: <Widget>[
            _parametersBox(),
            _headerTextBox(),
            Search(
              onChanged: search,
            ),
          ],
        ));
  }

  Widget _parametersBox() {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.2 - 20.0,
      decoration: const BoxDecoration(
          color: kGreen,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(35.0),
            bottomLeft: Radius.circular(35.0),
          )),
    );
  }

  Widget _headerTextBox() {
    return const TitleText(
        titleText1st: 'Welcome',
        titleText2nd: 'to HANDBOOK!',
        description: 'Who are you looking for?');
  }

  Widget _buildList() {
    return Expanded(
      child: GridView.builder(
        itemCount: data.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.8,
        ),
        itemBuilder: (context, index) {
          final model = data[index];
          return PokemonItem(
            name: model.name,
            height: model.height,
            weight: model.weight,
            numb: model.id,
            type: model.type[0],
          );
        },
      ),
    );
  }
}
