extension StringExtension on String {
  List<int> get getHourAndMinuteFromAppTimeFormat {
    // Divide a string usando ":" como delimitador
    final parts = split(":");

    // Verifica se há pelo menos duas partes (horas e minutos)
    if (parts.length != 2) {
      throw FormatException("Formato de hora inválido. O formato esperado é HH:mm");
    }

    // Converte as partes para números inteiros
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);

    return [hour, minute];
  }
}
