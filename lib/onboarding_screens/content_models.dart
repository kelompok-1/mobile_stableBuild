// ignore_for_file: camel_case_types

class onbordingContents {
  String image;
  String title;
  String discription;

  onbordingContents(
      {required this.image, required this.title, required this.discription});
}

List<onbordingContents> contents = [
  onbordingContents(
    title: 'Siap Hadapi PTS & PAS',
    image: 'assets/animations/27637-welcome.json',
    discription:
        "Latihan soal, tryout, dan materi belajar yang gak ribet udah jadi strategi paling jitu buat sukses PTS dan PAS!",
  ),
  onbordingContents(
    title: '90.000+ konten & fitur GRATIS',
    image: 'assets/animations/81338-video-learning.json',
    discription:
        "Ada video konsep, latihan soal, hingga SkoolBot yang siap bantu kamu belajar di mana pun, kapan pun.",
  ),
  onbordingContents(
    title: 'Lulus Ujian Nasional? BISA!',
    image: 'assets/animations/24321-certificate-for-graduation.json',
    discription:
        "Ikuti jejak ratusan ribu alumni yang berhasil lulus Ujian Nasional dengan nilai memuaskan bareng Skoolen.",
  ),
  onbordingContents(
    title: 'Belajar lebih mantap dengan fitur premium',
    image: 'assets/animations/91644-premium-quality.json',
    discription:
        "Amunisi belajar lengkap dengan video animasi, live class seru bareng tutor, serta rangkuman + flashcard!",
  ),
  onbordingContents(
    title: 'Skoolen untuk semua',
    image: 'assets/animations/72815-back-to-school.json',
    discription:
        "Kini guru dan orang tua bisa jadi pendamping belajar mulai dari siswa SD hingga SMA",
  ),
];
