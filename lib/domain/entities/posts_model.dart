class PostsModel {
  final String img;
  final String title;
  final String subTitle;
  final bool isPremium;
  bool isSaved;
  final bool productActive;
  final String rating;
  final String price;

  PostsModel(
    this.img,
    this.title,
    this.subTitle,
    this.isPremium,
    this.isSaved,
    this.productActive,
    this.rating,
    this.price,
  );
}
