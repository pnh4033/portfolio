package web.portfolio.service;

import java.util.List;
import java.util.Map;

import web.portfolio.domain.UserVO;
import web.portfolio.dto.LoginDTO;

public interface UserService {
	
	public UserVO login(LoginDTO dto) throws Exception;            /*로그인 정보*/
	public UserVO userInfo(String userID) throws Exception;        /*유저 정보*/
	public int idChk(String userID) throws Exception;              /*ID 존재 여부 조회*/
	public void userSignIn(UserVO vo) throws Exception;            /*회원 가입*/
	

	public List<Integer> myTender(String UserID) throws Exception;   /*나의 입찰 목록*/
	public List<Integer> myAspect(String UserID) throws Exception;   /*나의 관심 목록*/

}
