package org.nhnnext.user;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * 
 * @author josunghwan
 *
 */
@Repository
public interface UserRepository extends CrudRepository<User, Long>{
	User findByEmail(String email);
}
