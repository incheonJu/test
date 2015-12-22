package com.eip.template.domain.share.code;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.eip.template.common.util.serializer.JsonCustomDateDeserializer;
import com.eip.template.common.util.serializer.JsonCustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 공통코드 마스터
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : MasterCode.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Entity
@Table(name = "tbl_master_code")
public class MasterCode
{
	
	public MasterCode() {
		super();
	}
	
	public MasterCode(String grpCd) {
		super();
		this.grpCd = grpCd;
	}

	public MasterCode(String grpCd, String grpCdNm, String useYn,
			String grpCdDesc, Date createDt, String createId, Date updateDt,
			String updateId) {
		super();
		this.grpCd = grpCd;
		this.grpCdNm = grpCdNm;
		this.useYn = useYn;
		this.grpCdDesc = grpCdDesc;
		this.createDt = createDt;
		this.createId = createId;
		this.updateDt = updateDt;
		this.updateId = updateId;
	}

	@Id
    @Column(name = "GRP_CD")
    private String grpCd;
    
    @Column(name = "GRP_CD_NM")
    private String grpCdNm;
    
    @Column(name = "USE_YN")
    private String useYn;
    
    @Column(name = "GRP_CD_DESC")
    private String grpCdDesc;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @JsonSerialize(using = JsonCustomDateSerializer.class)
    @JsonDeserialize(using = JsonCustomDateDeserializer.class)
    @Column(name = "CREATE_DT")
    private Date createDt;
    
    @Column(name = "CREATE_ID")
    private String createId;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @JsonSerialize(using = JsonCustomDateSerializer.class)
    @JsonDeserialize(using = JsonCustomDateDeserializer.class)
    @Column(name = "UPDATE_DT")
    private Date updateDt;
    
    @Column(name = "UPDATE_ID")
    private String updateId;

	public String getGrpCd() {
		return grpCd;
	}

	public void setGrpCd(String grpCd) {
		this.grpCd = grpCd;
	}

	public String getGrpCdNm() {
		return grpCdNm;
	}

	public void setGrpCdNm(String grpCdNm) {
		this.grpCdNm = grpCdNm;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getGrpCdDesc() {
		return grpCdDesc;
	}

	public void setGrpCdDesc(String grpCdDesc) {
		this.grpCdDesc = grpCdDesc;
	}

	public Date getCreateDt() {
		return createDt;
	}

	public void setCreateDt(Date createDt) {
		this.createDt = createDt;
	}

	public String getCreateId() {
		return createId;
	}

	public void setCreateId(String createId) {
		this.createId = createId;
	}

	public Date getUpdateDt() {
		return updateDt;
	}

	public void setUpdateDt(Date updateDt) {
		this.updateDt = updateDt;
	}

	public String getUpdateId() {
		return updateId;
	}

	public void setUpdateId(String updateId) {
		this.updateId = updateId;
	}

	@Override
	public String toString() {
		return "MasterCode [grpCd=" + grpCd + ", grpCdNm=" + grpCdNm
				+ ", useYn=" + useYn + ", grpCdDesc=" + grpCdDesc
				+ ", createDt=" + createDt + ", createId=" + createId
				+ ", updateDt=" + updateDt + ", updateId=" + updateId + "]";
	}
    
}
