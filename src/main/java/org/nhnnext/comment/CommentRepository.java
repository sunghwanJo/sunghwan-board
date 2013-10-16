package org.nhnnext.comment;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * 
 * @author josunghwan
 *
 */
@Repository
public interface CommentRepository extends CrudRepository<Comment, Long>{

}
