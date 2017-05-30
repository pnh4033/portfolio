package web.portfolio.service;

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

}
