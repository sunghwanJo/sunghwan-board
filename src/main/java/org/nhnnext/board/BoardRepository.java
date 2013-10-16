package org.nhnnext.board;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

/**
 * 
 * @author josunghwan
 *
 */
@Repository
public interface BoardRepository extends CrudRepository<Board, Long>{

}
