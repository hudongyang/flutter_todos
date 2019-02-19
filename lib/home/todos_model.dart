import 'package:scoped_model/scoped_model.dart';

enum FilterWords { All, Acitve, Completed }

class TodosModel extends Model {
  List<Todo> _items = [];

  List<Todo> get items => _items;

  FilterWords _filterWords = FilterWords.All;

  int get count => _items.length;

  int get remaining => _items.where((todo) => !todo.checked).length;

  set filterWords(FilterWords words) {
    _filterWords = words;
    notifyListeners();
  }

  FilterWords get filterWords => _filterWords;

  List<Todo> get filterTodos {
    List<Todo> todos;
    switch (_filterWords) {
      case FilterWords.All:
        todos = _items;
        break;
      case FilterWords.Acitve:
        todos = items.where((todo) => !todo.checked).toList();        
        break;
      case FilterWords.Completed:
        todos = items.where((todo) => todo.checked).toList();
        break;
      default:
    }
    
    return todos;
  }

  void toggleAll(bool checked) {
    items.forEach((Todo todo) => todo.checked = checked);
    notifyListeners();
  }

  void clearCompleted() {
    _items = _items.where((todo) => !todo.checked).toList();
    notifyListeners();
  }

  void add(Todo todo) {
    _items.add(todo);
    notifyListeners();
  }

  void changeChecked(bool checked, Todo todo) {
    todo.checked = checked;
    notifyListeners();
  }

  void removeItem(Todo todo) {

    items.remove(todo);
    notifyListeners();
  }
}

class Todo {
  String title;
  bool checked = false;

  Todo(this.title);

  @override
  String toString() {
    return title;
  }
}
