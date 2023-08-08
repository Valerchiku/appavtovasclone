/// This repository should be used for entities repositories.
abstract class EntityRepository<T> {
  abstract final T entity;
  abstract final Stream<T> entityStream;
}
