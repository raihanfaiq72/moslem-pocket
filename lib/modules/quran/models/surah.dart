class Surah {
  final int number;
  final String name;
  final String englishName;
  final String translation;
  final int numberOfAyahs;
  final String revelationType;

  Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.translation,
    required this.numberOfAyahs,
    required this.revelationType,
  });
}

final List<Surah> dummySurahs = [
  Surah(number: 1, name: "Al-Fatihah", englishName: "The Opening", translation: "Pembukaan", numberOfAyahs: 7, revelationType: "Meccan"),
  Surah(number: 2, name: "Al-Baqarah", englishName: "The Cow", translation: "Sapi Betina", numberOfAyahs: 286, revelationType: "Medinan"),
  Surah(number: 3, name: "Ali 'Imran", englishName: "Family of Imran", translation: "Keluarga Imran", numberOfAyahs: 200, revelationType: "Medinan"),
  Surah(number: 4, name: "An-Nisa", englishName: "The Women", translation: "Wanita", numberOfAyahs: 176, revelationType: "Medinan"),
  Surah(number: 5, name: "Al-Ma'idah", englishName: "The Table Spread", translation: "Hidangan", numberOfAyahs: 120, revelationType: "Medinan"),
  Surah(number: 6, name: "Al-An'am", englishName: "The Cattle", translation: "Binatang Ternak", numberOfAyahs: 165, revelationType: "Meccan"),
  Surah(number: 7, name: "Al-A'raf", englishName: "The Heights", translation: "Tempat yang Tertinggi", numberOfAyahs: 206, revelationType: "Meccan"),
];
