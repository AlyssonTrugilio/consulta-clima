import 'package:consultar_clima/model/apiCidade.dart';
import 'package:consultar_clima/model/apiClima.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class Pag1 extends StatefulWidget {
  const Pag1({Key? key}) : super(key: key);

  @override
  State<Pag1> createState() => _Pag1State();
}

class _Pag1State extends State<Pag1> {
  ApiCidade apiDaCidade = ApiCidade();
  ApiClima apiDoClima = ApiClima();

  String? nomecity;
  void nomeCidade(String valueCidade) async {
    var newApiCidade = await buscarApiCidade(valueCidade);
    setState(() {
      apiDaCidade =
          newApiCidade; // Atualize toda a instância da classe ApiCidade
      nomecity = apiDaCidade.name;
    });
  }

  String? temperatura;
  double? tempMaxima;
  double? tempMinima;

  void resultadoClima() async {
    String latDouble = apiDaCidade.lat!.toString();
    String lonDouble = apiDaCidade.lon!.toString();
    var newApiClima = await buscarApiClima(latDouble, lonDouble);
    setState(() {
      apiDoClima = newApiClima;
      temperatura = apiDoClima.temp.toString();
      tempMaxima = apiDoClima.tempMax;
      tempMinima = apiDoClima.tempMin;
    });
  }

  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0), // Altura da AppBar
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: const Color.fromARGB(255, 0, 0, 0), // Cor da borda
                width: 2.0, // Espessura da borda
              ),
            ),
            child: AppBar(
              centerTitle: true,
              title: const Text(
                'Consultar Clima',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              actions: [
                IconButton(
                  icon: Icon(
                    isDarkMode ? Icons.light_mode : Icons.dark_mode,
                    color: isDarkMode ? Colors.white : Colors.black,
                  ),
                  onPressed: () {
                    setState(() {
                      isDarkMode = !isDarkMode;
                      tema.value = isDarkMode ? ThemeMode.dark : ThemeMode.light;
                    });
                  },
                )
              ],
            ),
          )),
      body: Container(
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 5),
                  child: TextField(
                    onChanged: (valueCidae) async {
                      nomeCidade(valueCidae);
                      if (apiDaCidade.lat != null) {
                        resultadoClima();
                      }
                    },
                    decoration: InputDecoration(
                        label: const Text('Digite a cidade'),
                        labelStyle:
                            const TextStyle(fontWeight: FontWeight.bold),
                        suffixIcon: const Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 3,
                            ),
                            borderRadius: BorderRadius.circular(15)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(width: 3),
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Center(
                      child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 40),
                        child: (apiDaCidade.name != null &&
                                apiDaCidade.state != null)
                            ? Text(
                                "${apiDaCidade.name ?? ''}, ${apiDaCidade.state ?? ''}",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: (apiDaCidade.country != null)
                            ? Text(
                                "${apiDaCidade.country}",
                                style: const TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : const SizedBox.shrink(),
                      ),
                      Image.asset(
                        'images/clima.png',
                        width: 200,
                        height: 150,
                      ),
                      //Descrição
                      Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Column(
                            children: [
                              (apiDoClima.description != null)
                                  ? Text(
                                      apiDoClima.description.toString(),
                                      style: const TextStyle(
                                          fontSize: 30,
                                          fontWeight: FontWeight.bold),
                                    )
                                  : const SizedBox.shrink(),
                              //Temperatura atual
                              Padding(
                                  padding: const EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      (apiDoClima.temp != null)
                                          ? Text(
                                              "${apiDoClima.temp!.toInt()}º",
                                              style: const TextStyle(
                                                  fontSize: 50,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : const SizedBox.shrink(),
                                      const Text(
                                        "Temp. Atual",
                                        style: TextStyle(
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ))
                            ],
                          ))
                    ],
                  )),
                ),
                //Temperatura minima
                Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            (apiDoClima.tempMin != null)
                                ? Text(
                                    "${apiDoClima.tempMin!.toInt()}º",
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  )
                                : const SizedBox.shrink(),
                            const Text(
                              'Temp. Min',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      ////Temperatura maxima
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            (apiDoClima.tempMax != null)
                                ? Text(
                                    "${apiDoClima.tempMax!.toInt()}º",
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  )
                                : const SizedBox.shrink(),
                            const Text(
                              'Temp. Max',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      ),
                      //Humidade
                      Padding(
                        padding: const EdgeInsets.all(0),
                        child: Column(
                          children: [
                            (apiDoClima.humidity != null)
                                ? Text(
                                    "${apiDoClima.humidity.toString()}%",
                                    style: const TextStyle(
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold),
                                  )
                                : const SizedBox.shrink(),
                            const Text(
                              'Umidade',
                              style: TextStyle(fontSize: 20),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}