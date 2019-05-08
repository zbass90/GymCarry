package kr.goott.gymcarry.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.goott.gymcarry.model.dto.UserDTO;

@Repository
public class UserDAO implements UserDAOInterface {

	private static final Logger logger = LoggerFactory.getLogger(UserDAO.class);
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<UserDTO> userList() {
		logger.info("userlist called....");
		return sqlSession.selectList("user.userList");
	}

	@Override
	public void insertUser(UserDTO dto) {
		sqlSession.insert("user.insertUser",dto);

	}

	@Override
	public UserDTO viewUser(String userid) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void deleteUser(String userid) {
		sqlSession.delete("user.deleteUser", userid);

	}

	@Override
	public int updateUser(UserDTO dto) {
		return sqlSession.update("user.editUser", dto);
	}

	@Override
	public boolean checkPw(String userid, String userpwd) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public UserDTO loginCheck(UserDTO dto) {
		return sqlSession.selectOne("user.login_check", dto);
	}

	@Override
	public UserDTO userInfo(String userid) {		
		return sqlSession.selectOne("user.user_info",userid);
	}

	
	@Override 
	public int addInfoUser(UserDTO dto) { 
		return	sqlSession.update("user.addInfo_user", dto); 
	}

	@Override
	public UserDTO findId(UserDTO dto) {		
		return sqlSession.selectOne("user.find_id", dto);
	}

	@Override
	public UserDTO naverIdCheck(UserDTO dto) {
		return sqlSession.selectOne("user.naver_id_check",dto);
	}

	@Override
	public int insertNaverUser(UserDTO dto) {
		return sqlSession.insert("user.insert_naver_user",dto);
		
	}

	@Override
	public int idCheckCount(String userid) {		
		return sqlSession.selectOne("user.id_check_count", userid);
	}

	@Override
	public int updateImg(UserDTO dto) {
		return sqlSession.update("user.update_img", dto);		
	}

	@Override
	public UserDTO selectImg(UserDTO dto) {
		return sqlSession.selectOne("user.select_img", dto);
	}

	@Override
	public int findPwd(UserDTO dto) {
		return sqlSession.update("user.find_pwd", dto);
	}
	

}
