import 'package:application/ui/pages/home/index.dart';

class Search extends StatefulWidget {
  final ValueChanged<String> onChanged;
  const Search({
    Key? key,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        margin: const EdgeInsets.symmetric(horizontal: 20.0),
        height: 54.0,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            boxShadow: [
              BoxShadow(
                  offset: const Offset(0, 10.0),
                  blurRadius: 50.0,
                  color: kReallyGrey.withOpacity(0.25)),
            ]),
        child: _textSearchForm(),
      ),
    );
  }

  Widget _textSearchForm() {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
              controller: controller,
              onChanged: widget.onChanged,
              decoration: const InputDecoration(
                hintText: 'E.g. Pikachu..',
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
              )),
        ),
        const Icon(Icons.search),
      ],
    );
  }
}
