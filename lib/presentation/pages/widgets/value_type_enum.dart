enum ValueType {
  maxTemperature(title: 'Máxima', type: '°C'),
  minTemperature(title: 'Mínima', type: '°C'),
  thermalSensation(title: 'Sensação', type: '°C'),
  humidity(title: 'Umidade', type: '%'),
  currentTemp(title: '', type: '°C');

  final String title;
  final String type;

  const ValueType({
    required this.title,
    required this.type,
  });
}
