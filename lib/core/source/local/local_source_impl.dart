import 'package:objectbox/objectbox.dart';

import 'local_source.dart';

class LocalSourceImpl<T> extends LocalSource<T> {
  final Box<T> store;

  LocalSourceImpl(this.store);

  @override
  Future<void> delete(int id) async {
    store.remove(id);
  }

  @override
  Future<List<T>> fetchAll() async {
    return store.getAll();
  }

  @override
  Future<T> findById(int id) async {
    final temp = store.get(id);
    if (temp != null) {
      return temp;
    }
    throw Exception();
  }

  @override
  Future<void> insert(T obj) async {
    store.put(obj);
  }

  @override
  Future<void> update(int id, T obj) async {
    store.put(obj);
  }

  @override
  Future<void> insertAll(List<T> obj) async {
    store.putMany(obj);
  }

  @override
  Future<List<T>> insertAndGetAll(List<T> obj) async {
    return store.putAndGetManyAsync(obj);
  }

  @override
  Future<void> deleteAll(List<int> ids) async {
    store.removeMany(ids);
  }

  @override
  Future<void> reset() async {
    store.removeAll();
  }
}
