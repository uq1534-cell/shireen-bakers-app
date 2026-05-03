import '../models/product.dart';

const List<Category> dummyProductCategories = [
  Category(id: 'cakes', name: 'Cakes', imageUrl: 'assets/images/cakes.jpg'),
  Category(
      id: 'pastries', name: 'Pastries', imageUrl: 'assets/images/pastries.jpg'),
  Category(
      id: 'biscuits', name: 'Biscuits', imageUrl: 'assets/images/biscuits.jpg'),
  Category(
      id: 'bread', name: 'Bread & Rusk', imageUrl: 'assets/images/bread.jpg'),
  Category(id: 'donuts', name: 'Donuts', imageUrl: 'assets/images/donuts.jpg'),
  Category(
      id: 'icecream',
      name: 'Ice Cream',
      imageUrl: 'assets/images/icecream.jpg'),
];

const List<Product> dummyProducts = [
  Product(
    id: 'p1',
    name: 'Chocolate Cake',
    categoryId: 'cakes',
    price: 1200,
    weight: 500,
    imageUrl: 'assets/images/choc_cake.jpg',
    description: 'Rich chocolate layers with cream frosting',
  ),
  Product(
    id: 'p2',
    name: 'Cream Pastry',
    categoryId: 'pastries',
    price: 120,
    weight: 80,
    imageUrl: 'assets/images/cream_pastry.jpg',
    description: 'Fresh daily-baked cream puff pastry',
  ),
  // add more products here...
];
