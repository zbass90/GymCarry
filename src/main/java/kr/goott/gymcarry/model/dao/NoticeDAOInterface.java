package kr.goott.gymcarry.model.dao;

import java.util.List;


import kr.goott.gymcarry.model.dto.NoticeDTO;

public interface NoticeDAOInterface {

	public List<NoticeDTO> noticeList(); //공지사항글 리스트
	public void submitNotice(NoticeDTO dto); //공지사항글 등록
	public void deleteNotice(int noticeno); //공지사항글 삭제
	public NoticeDTO editNotice(NoticeDTO dto); //공지사항 수정
	public NoticeDTO viewNotice(int noticeno); //공지사항글 뷰
	
}
