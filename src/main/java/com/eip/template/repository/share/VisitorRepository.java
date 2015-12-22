package com.eip.template.repository.share;

import java.util.List;

import com.eip.template.domain.share.member.Member;
import com.eip.template.domain.share.visitor.Visitor;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * 방문자 DAO Interface Class
 * @author bepe
 */
public interface VisitorRepository extends JpaRepository<Visitor, Integer>
{
	//public Visitor getVisitor(String day);
	//public List<Visitor> searchListData(String year, String month, String divPeriod, String schStartDay, String schEndDay);
	//public int getSearchCount(String year, String month, String periodDiv, String schStartDay, String schEndDay);
	//public List<Visitor> searchByDate(int startRow, int endRow, String sord, String sidx, String year, String month, String periodDiv, String schStartDay, String schEndDay);
}
