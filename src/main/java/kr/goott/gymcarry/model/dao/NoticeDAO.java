package kr.goott.gymcarry.model.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import kr.goott.gymcarry.model.dto.NoticeDTO;

@Repository
public class NoticeDAO implements NoticeDAOInterface{
	
	private static final Logger logger = LoggerFactory.getLogger(NoticeDAO.class);
	
	@Inject
	SqlSession sqlSession;
	
	@Override
	public List<NoticeDTO> noticeList() {
		logger.info("notice list called");
		return sqlSession.selectList("notice.listNotice");
	}
	
	@Override
	public void submitNotice(NoticeDTO dto) {
		logger.info("notice submit called");
		sqlSession.insert("notice.submitNotice", dto);
	}

	@Override
	public void deleteNotice(int noticeno) {
		logger.info("notice delete called");
		sqlSession.delete("notice.deleteNotice", noticeno);
		
	}

	@Override
	public NoticeDTO editNotice(NoticeDTO dto) {
		logger.info("notice edit called");
		return sqlSession.selectOne("notice.editNotice", dto);

	}

	@Override
	public NoticeDTO viewNotice(int noticeno) {
		logger.info("notice view called");
		return sqlSession.selectOne("notice.viewNotice", noticeno);
	}
	
	
}
