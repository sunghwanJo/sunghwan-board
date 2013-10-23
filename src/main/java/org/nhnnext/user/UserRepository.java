package org.nhnnext.user;

import org.springframework.data.repository.CrudRepository;

/**
 * 
 * @author josunghwan
 *
 */


public interface UserRepository extends CrudRepository<User, Long>{
	User findByEmail(String email);
	
	
}
