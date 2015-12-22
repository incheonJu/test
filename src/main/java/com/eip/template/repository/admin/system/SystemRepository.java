package com.eip.template.repository.admin.system;

import com.eip.template.domain.share.code.MasterCode;
import com.eip.template.domain.share.system.SystemLog;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.data.jpa.repository.JpaRepository;

public interface SystemRepository extends JpaRepository<SystemLog, Integer>
{
	/*public int getSystemLogCount(Map mapSearchParameter);
    public List<SystemLog> getSystemLogList(int startRow, int endRow, String orderType, String orderColumn, Map mapSearchParameter);*/
}