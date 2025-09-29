class CategoryModel{
  final String image,name;
  CategoryModel({required this.image, required this.name});
}
List<CategoryModel>myCategories = [
  CategoryModel(image: "assets/Ramen.png", name: 'Ramen'),
  CategoryModel(image: "assets/Burger.png", name: 'Burger'),
  CategoryModel(image: "assets/ditalini.png", name: 'Pasta'),
  CategoryModel(image: "assets/pizza1.png", name: 'Pizza')
];
