// ignore_for_file: public_member_api_docs, sort_constructors_first
class ConsultationModel {
  final String img;
  final String title;
  final String subTitle;
  final String date;
  final String price;
  final int? hourly;

  ConsultationModel({
    required this.img,
    required this.title,
    required this.subTitle,
    required this.date,
    required this.price,
    this.hourly ,
  });
}
