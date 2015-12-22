package com.eip.template.repository.share.board;

import java.util.List;
import java.util.Map;

import com.eip.template.domain.share.board.Qna;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 게시판 Dao interface
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : QnaRepository.java
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
public interface QnaRepository extends JpaRepository<Qna, Integer>
{
	// 게시판
	/*public int getQnaCount(Map mapSearchParameter);
    public List<Qna> getQnaList(int startRow, int endRow, String orderType, String orderColumn, Map mapSearchParameter);
    public Qna getReplyQna(Qna entity);
    public boolean isQnaPwdConfirm(Qna qna);*/
}