import 'package:flutter/foundation.dart';
import '../models/coffee_model.dart';
import '../services/coffee_api_service.dart';

class CoffeeProvider with ChangeNotifier {
  // Daftar asli kopi
  List<CoffeeModel> _originalHotCoffees = [];
  List<CoffeeModel> _originalIcedCoffees = [];
  List<CoffeeModel> _originalFavoriteCoffees = [];

  // Daftar yang difilter untuk pencarian
  List<CoffeeModel> _filteredHotCoffees = [];
  List<CoffeeModel> _filteredIcedCoffees = [];
  List<CoffeeModel> _filteredFavoriteCoffees = [];

  bool isLoading = false;
  String errorMessage = '';

  // Getter untuk daftar yang difilter atau asli
  List<CoffeeModel> get hotCoffees => 
      _filteredHotCoffees.isNotEmpty ? _filteredHotCoffees : _originalHotCoffees;
  
  List<CoffeeModel> get icedCoffees => 
      _filteredIcedCoffees.isNotEmpty ? _filteredIcedCoffees : _originalIcedCoffees;
  
  List<CoffeeModel> get favoriteCoffees => 
      _filteredFavoriteCoffees.isNotEmpty ? _filteredFavoriteCoffees : _originalFavoriteCoffees;

  Future<void> fetchCoffees() async {
    try {
      isLoading = true;
      errorMessage = '';
      notifyListeners();

      // Fetch hot coffees
      _originalHotCoffees = await CoffeeApiService.fetchCoffees('hot');
      _filteredHotCoffees = []; // Reset filtered list

      // Fetch iced coffees
      _originalIcedCoffees = await CoffeeApiService.fetchCoffees('iced');
      _filteredIcedCoffees = []; // Reset filtered list

      isLoading = false;
      notifyListeners();
    } catch (e) {
      isLoading = false;
      errorMessage = e.toString();
      notifyListeners();
    }
  }

  void toggleFavorite(CoffeeModel coffee) {
    if (_originalFavoriteCoffees.contains(coffee)) {
      _originalFavoriteCoffees.remove(coffee);
    } else {
      _originalFavoriteCoffees.add(coffee);
    }
    notifyListeners();
  }

  // Metode pencarian yang lebih komprehensif
  void searchCoffees(String query, String type) {
    // Hapus spasi di awal dan akhir, ubah ke lowercase
    query = query.trim().toLowerCase();

    // Pilih list yang sesuai berdasarkan tipe
    List<CoffeeModel> sourceList;
    switch (type) {
      case 'hot':
        sourceList = _originalHotCoffees;
        break;
      case 'iced':
        sourceList = _originalIcedCoffees;
        break;
      case 'favorite':
        sourceList = _originalFavoriteCoffees;
        break;
      default:
        sourceList = [];
    }

    // Lakukan filtering
    if (query.isEmpty) {
      // Kembalikan ke daftar asli jika query kosong
      _resetFilter(type);
    } else {
      // Filter berdasarkan judul atau deskripsi
      List<CoffeeModel> filteredList = sourceList.where((coffee) {
        return coffee.title.toLowerCase().contains(query) ||
               coffee.description.toLowerCase().contains(query);
      }).toList();

      // Update list yang difilter sesuai tipe
      switch (type) {
        case 'hot':
          _filteredHotCoffees = filteredList;
          break;
        case 'iced':
          _filteredIcedCoffees = filteredList;
          break;
        case 'favorite':
          _filteredFavoriteCoffees = filteredList;
          break;
      }
    }

    // Beritahu listener bahwa data telah berubah
    notifyListeners();
  }

  // Metode untuk mereset filter
  void _resetFilter(String type) {
    switch (type) {
      case 'hot':
        _filteredHotCoffees = [];
        break;
      case 'iced':
        _filteredIcedCoffees = [];
        break;
      case 'favorite':
        _filteredFavoriteCoffees = [];
        break;
    }
  }

  // Metode pencarian lama untuk kompatibilitas
  void searchHotCoffees(String query) {
    searchCoffees(query, 'hot');
  }

  void searchIcedCoffees(String query) {
    searchCoffees(query, 'iced');
  }

  void searchFavorites(String query) {
    searchCoffees(query, 'favorite');
  }
}