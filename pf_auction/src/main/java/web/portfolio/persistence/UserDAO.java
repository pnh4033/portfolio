package web.portfolio.persistence;

import web.portfolio.domain.UserVO;
import web.portfolio.dto.LoginDTO;

public interface UserDAO {
	
	public UserVO login(LoginDTO dto) throws Exception;

}
