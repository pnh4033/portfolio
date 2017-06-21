package web.portfolio.persistence;

import java.util.List;

import web.portfolio.domain.ProductVO;
import web.portfolio.domain.UserVO;
import web.portfolio.dto.LoginDTO;

public interface UserDAO {
	
	public UserVO login(LoginDTO dto) throws Exception;           /*로그인 정보*/
	public UserVO userInfo(String userID) throws Exception;       /*유저 정보*/
	public int idChk(String userID) throws Exception;             /*ID 존재 여부 조회*/
	public void userSignIn(UserVO vo) throws Exception;           /*회원 가입*/

}
