package web.portfolio.service;

import web.portfolio.domain.UserVO;
import web.portfolio.dto.LoginDTO;

public interface UserService {
	
	public UserVO login(LoginDTO dto) throws Exception; 

}
