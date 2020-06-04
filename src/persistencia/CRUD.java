package persistencia;

public interface CRUD<T> {
	void Create(T objeto);
	 void Reader();
	void Update(int id, T objeto);
	void Delete(int  id);

}
