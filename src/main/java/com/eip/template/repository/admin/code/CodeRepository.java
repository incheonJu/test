package com.eip.template.repository.admin.code;

import com.eip.template.domain.share.code.MasterCode;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CodeRepository extends JpaRepository<MasterCode, Integer>
{
	/*// 마스터코드
	public List<MasterCode> getMasterCodeList(Map<String, Object> mapSearchParameter);
	public int getMasterCodeCount(Map<String, Object> mapSearchParameter);
	public List<MasterCode> getMasterCodeList(int startRow, int endRow, String orderType, String orderColumn, Map<String, Object> mapSearchParameter);
	
	// 상세코드 
	public DetailCode insertDetail(DetailCode entity);
	public List<DetailCode> getAllDetail();
	public DetailCode getDetail(DetailCode entity);
	public long countDetail();
	public int updateDetail(DetailCode entity);
	public int deleteDetail(DetailCode entity);
	public int deleteAllDetail();
	public List<DetailCode> getDetailCodeList(int startRow, int endRow, String orderType, String orderColumn, Map<String, Object> mapSearchParameter);
	public int getDetailCodeCount(Map<String, Object> mapSearchParameter);*/
}
