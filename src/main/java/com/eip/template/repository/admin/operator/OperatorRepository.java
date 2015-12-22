package com.eip.template.repository.admin.operator;

import com.eip.template.domain.share.operator.Operator;
import org.springframework.data.jpa.repository.JpaRepository;

public interface OperatorRepository extends JpaRepository<Operator, Integer>
{
	/*Operator findOperatorID(String id);
	public int getOperatorCount(Map mapSearchParameter);
	public List<Operator> getOperatorList(int startRow, int endRow, String orderType, String orderColumn, Map mapSearchParameter);*/
}
