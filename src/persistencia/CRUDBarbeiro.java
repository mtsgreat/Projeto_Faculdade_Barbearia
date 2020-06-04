package persistencia;

import entidades.Barbeiro;

public interface CRUDBarbeiro extends CRUD<Barbeiro>{
	Boolean Login(String login, String senha);

}
