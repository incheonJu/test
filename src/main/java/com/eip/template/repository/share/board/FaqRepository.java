package com.eip.template.repository.share.board;

import java.util.List;
import java.util.Map;

import com.eip.template.domain.share.board.Faq;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 게시판 Dao interface
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : FaqRepository.java
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
public interface FaqRepository extends JpaRepository<Faq, Integer>
{
	// 게시판
	//public int getFaqCount(Map mapSearchParameter);
    //public List<Faq> getFaqList(int startRow, int endRow, String orderType, String orderColumn, Map mapSearchParameter);
    
    
}