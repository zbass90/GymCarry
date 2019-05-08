package kr.goott.gymcarry.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import kr.goott.gymcarry.model.dto.CommunityReplyDTO;

public interface CommunityReplyDAO {
	
	@Insert("insert into communityreply values(comreplyseq.nextval,#{userid},#{replyDes},sysdate,#{comNo})")
	public void insertReply(@Param("userid") String userid, @Param("replyDes") String replyDes ,@Param("comNo") int comNo);
	
	
	@Select("select comm.replyno,comm.userid,comm.replydes,to_char(comm.regdate,'yyyy-mm-dd') regdate,comm.comno,usertbl.userimage from communityreply comm ,usertbl where comm.userid=usertbl.userid and comno=#{comNo} order by replyno desc")
	public List<CommunityReplyDTO> viewReply(@Param("comNo") int comNo);
	
	
	@Update("update communityreply set replydes=#{replyDes} where replyno=#{replyNo}")
	public void editReply(@Param("replyDes") String replyDes, @Param("replyNo") int replyNo);
	
	
	@Delete("delete from communityreply where replyno=#{replyNo}")
	public void deleteReply(@Param("replyNo") int replyNo);
	
}
