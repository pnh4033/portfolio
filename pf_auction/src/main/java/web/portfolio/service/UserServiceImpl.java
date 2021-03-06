package web.portfolio.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import web.portfolio.domain.UserVO;
import web.portfolio.dto.LoginDTO;
import web.portfolio.persistence.UserDAO;

@Service
public class UserServiceImpl implements UserService {
	
	
	@Inject
	private UserDAO dao;
	
	

	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		
		return dao.login(dto);
		
	}
	

	@Override
	public UserVO userInfo(String userID) throws Exception {
		
		return dao.userInfo(userID);
		
	}
	

	@Override
	public int idChk(String userID) throws Exception {
		
		return dao.idChk(userID);
		
	}
	

	@Override
	public void userSignIn(UserVO vo) throws Exception {
		
		dao.userSignIn(vo);
		
	}


	@Override
	public List<Integer> myTender(String UserID) throws Exception {
	
		return dao.myTender(UserID);
	}


	@Override
	public List<Integer> myAspect(String UserID) throws Exception {

		return dao.myAspect(UserID);
		
	}





}
