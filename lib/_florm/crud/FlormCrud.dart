import 'package:optional/optional.dart';

abstract class FlormCrud<K, E> {
	
	E save(E entity);
	
	Iterable<E> saveAll(Iterable<E> entities);
	
	Optional<E> findById(K id);
	
	bool existsById(K id);
	
	Iterable<E> findAll();
	
	Iterable<E> findAllById(Iterable<K> ids);
	
	int count();
	
	void deleteById(K id);
	
	void delete(E entity);
	
	void deleteAll([Iterable<E> entities]);
	
}