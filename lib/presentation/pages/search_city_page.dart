import 'package:flutter/material.dart';

class SearchCityPage extends StatefulWidget {
  const SearchCityPage({super.key});

  @override
  State<SearchCityPage> createState() => _SearchCityPageState();
}

class _SearchCityPageState extends State<SearchCityPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              'Consultar Clima',
              style: Theme.of(context).textTheme.displayMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 50),
            TextField(
              decoration: InputDecoration(
                  hintText: "Digite uma cidade",
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.search),
                    onPressed: () {},
                    tooltip: "Consultar",
                  )),
                  
            ),
            const SizedBox(
              height: 25,
            ),
            FilledButton(onPressed: () {}, child: const Text(('Consultar')))
          ],
        ),
      ),
    );
  }
}
