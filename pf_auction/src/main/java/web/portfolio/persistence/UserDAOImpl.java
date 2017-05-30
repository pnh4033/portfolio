package web.portfolio.persistence;

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

}
