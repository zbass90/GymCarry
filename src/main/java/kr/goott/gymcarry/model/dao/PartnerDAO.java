package kr.goott.gymcarry.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.goott.gymcarry.model.dto.UserDTO;

public interface PartnerDAO {
	//회원 정보가져오기
	@Select("select * from usertbl")
	public List<UserDTO> getAllUser();
	
	//파트너 등록(위치)
	@Update("update usertbl set userlat=#{userLat} ,userlong=#{userLong} where userid=#{userid}")
	public void applyPartner(@Param("userLat") Double userLat, @Param("userLong") Double userLong,@Param("userid") String userid);
	
}
	
