import 'package:optional/optional.dart';


abstract class FlormCrud<K, E> {
	
	S save<S extends E>(S entity);
	
	Iterable<S> saveAll<S extends E>(Iterable<S> entities);
	
	Optional<E> findById(K id);
	
	bool existsById(K id);
	
	Iterable<E> findAll();
	
	Iterable<E> findAllById(Iterable<K> ids);
	
	int count();
	
	void deleteById(K id);
	
	void delete(E entity);
	
	void deleteAll([Iterable<E> entities]);
	
}