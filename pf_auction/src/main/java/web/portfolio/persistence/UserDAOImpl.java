package web.portfolio.persistence;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import web.portfolio.domain.UserVO;
import web.portfolio.dto.LoginDTO;

@Repository
public class UserDAOImpl implements UserDAO {
	
	
	@Inject
	private SqlSession session;
	
	
	private static String NAMESPACE="web.portfolio.mapper.UserMapper.";

	
	
	
	@Override
	public UserVO login(LoginDTO dto) throws Exception {
		
		return session.selectOne(NAMESPACE+"login", dto);
		
	}
	

	@Override
	public UserVO userInfo(String userID) throws Exception {
		
		return session.selectOne(NAMESPACE+"userInfo", userID);
		
	}
	

	@Override
	public int idChk(String userID) throws Exception {
		
		return session.selectOne(NAMESPACE+"idChk", userID);
		
	}
	

	@Override
	public void userSignIn(UserVO vo) throws Exception {
		
		session.insert(NAMESPACE+"userSignIn", vo);
		
	}


	@Override
	public List<Integer> myTender(String UserID) throws Exception {
		
		return session.selectList(NAMESPACE+"myTender", UserID);
	}


	@Override
	public List<Integer> myAspect(String UserID) throws Exception {
	
		return session.selectList(NAMESPACE+"myAspect", UserID);
		
	}




}









