package org.nhnnext.repository;

import org.nhnnext.model.User;
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
