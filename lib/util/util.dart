typedef T Supplier <T> ();

T $if <T> (bool condition, T t, T f) {
	return condition ?? false ? t : f;
}

T $ifs <T> (bool condition, Supplier<T> t, Supplier<T> f) {
	return condition ?? false ? t() : f();
}
