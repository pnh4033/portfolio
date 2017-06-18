package web.portfolio.service;

import java.util.List;

import web.portfolio.domain.ProductVO;
import web.portfolio.domain.UserVO;
import web.portfolio.dto.LoginDTO;

public interface UserService {
	
	public UserVO login(LoginDTO dto) throws Exception; 
	public UserVO userInfo(String userID) throws Exception;
	public int idChk(String userID) throws Exception;
	public void userSignIn(UserVO vo) throws Exception;

}
