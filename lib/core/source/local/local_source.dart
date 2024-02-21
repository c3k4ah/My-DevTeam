abstract class LocalSource<T> {
  Future<void> insert(T obj);

  Future<void> insertAll(List<T> obj);

  Future<List<T>> insertAndGetAll(List<T> obj);

  Future<void> update(int id, T obj);

  Future<List<T>> fetchAll();

  Future<T> findById(int id);

  Future<void> delete(int id);

  Future<void> deleteAll(List<int> ids);

  Future<void> reset();
}
