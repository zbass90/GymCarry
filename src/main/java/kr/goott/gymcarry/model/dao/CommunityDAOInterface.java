package kr.goott.gymcarry.model.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import kr.goott.gymcarry.model.dto.CommunityDTO;

public interface CommunityDAOInterface {
	//���
	public void insertCommunity(CommunityDTO dto); 
	//�ٺ���
	public List<CommunityDTO> comList();
	//�ش� �� ����
	public CommunityDTO viewCommunity(int comNo) ;
	//�ۼ���
	public CommunityDTO editCommunity(CommunityDTO dto) ;
	//�ۻ���
	public void deleteCommunity(int comNo);
	// view �� �鸮��
	public void viewCount(int comNo);
	//reply ���ø���
	public void replyCount(int comNo);
	//like �ø���
	public void likeCount(int comNo);
	//reply����
	public void replyCountSub(int comNo);
	//like ����
	public void likeCountSub(int comNo);
	//�׻�� �ۺ���
	public List<CommunityDTO> userComList(String userid);

	public List<CommunityDTO> monthlyList();
	
	
}
