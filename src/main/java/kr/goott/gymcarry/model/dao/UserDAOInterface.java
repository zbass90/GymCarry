package kr.goott.gymcarry.model.dao;

import java.util.List;

import kr.goott.gymcarry.model.dto.UserDTO;

public interface UserDAOInterface {
	public List<UserDTO> userList(); //유저 리스트 정보
	public void insertUser(UserDTO dto); //유저 생성
	public UserDTO viewUser(String userid); //유저 검색
	public void deleteUser(String userid); //유저 삭제
	public int updateUser(UserDTO dto); //유저 수정
	public boolean checkPw(String userid, String userpwd); //로그인 여부 확인
	public UserDTO loginCheck(UserDTO dto);
	public UserDTO userInfo(String userid);
	public int addInfoUser(UserDTO dto);
	public UserDTO findId(UserDTO dto);
	public UserDTO naverIdCheck(UserDTO dto);//네이버아이디체크
	public int insertNaverUser(UserDTO dto); //네이버아이디로 계정생성
	public int idCheckCount(String userid); //아이디 비동기식 중복 검사
	public UserDTO selectImg(UserDTO dto);//userid로 profile img찾기
	public int updateImg(UserDTO dto);//userid로 profile img 변경
	public int findPwd(UserDTO dto);//이메일 전송시 강제 비밀번호 변경
}
