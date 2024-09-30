class Urls {
  static const String _baseUrl = 'http://152.42.163.176:2008/api/v1';
  static const String addNewProductUrl = '$_baseUrl/CreateProduct';
  static const String readGetProduct = '$_baseUrl/ReadProduct';
  static String editProduct(String id) => '$_baseUrl/UpdateProduct/$id';
  static String deleteProduct(String id) => '$_baseUrl/DeleteProduct/$id';
}
