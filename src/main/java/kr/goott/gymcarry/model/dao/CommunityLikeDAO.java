package kr.goott.gymcarry.model.dao;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.goott.gymcarry.model.dto.CommunityLikeDTO;

public interface CommunityLikeDAO {
	@Select("select count(likeno) from communitylike where comno=#{comNo} and userid=#{userid}")
	public int checkLike(@Param("comNo")int comNo, @Param("userid") String userid);
	@Insert("insert into communitylike values(comlikeseq.nextval,#{userid},#{comNo})")
	public void insertLike(@Param("comNo")int comNo, @Param("userid") String userid);
	@Delete("delete communitylike where comno=#{comNo} and userid=#{userid}")
	public void deleteLike(@Param("comNo")int comNo, @Param("userid") String userid);
}
