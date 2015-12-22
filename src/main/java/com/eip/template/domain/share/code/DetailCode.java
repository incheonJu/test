package com.eip.template.domain.share.code;

import java.util.Date;

import javax.persistence.*;

import org.springframework.format.annotation.DateTimeFormat;

import com.eip.template.common.util.serializer.JsonCustomDateDeserializer;
import com.eip.template.common.util.serializer.JsonCustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 공통코드 상세
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : DetailCode.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Entity
@Table(name = "tbl_detail_code")
public class DetailCode
{
	
	public DetailCode() {
		super();
	}
	
	public DetailCode(String grpCd, String dtlsCd) {
		super();
		this.grpCd = grpCd;
		this.dtlsCd = dtlsCd;
	}

	public DetailCode(String grpCd, String dtlsCd, String dtlsCdNm,
			String cdVal1, String cdVal2, String cdVal3, String prrtRnk,
			String useYn, String dtlsCdDesc, Date createDt, String createId,
			Date updateDt, String updateId) {
		super();
		this.grpCd = grpCd;
		this.dtlsCd = dtlsCd;
		this.dtlsCdNm = dtlsCdNm;
		this.cdVal1 = cdVal1;
		this.cdVal2 = cdVal2;
		this.cdVal3 = cdVal3;
		this.prrtRnk = prrtRnk;
		this.useYn = useYn;
		this.dtlsCdDesc = dtlsCdDesc;
		this.createDt = createDt;
		this.createId = createId;
		this.updateDt = updateDt;
		this.updateId = updateId;
	}

	@Id
    @Column(name = "GRP_CD")
    private String grpCd;
    
    @Column(name = "DTLS_CD")
    private String dtlsCd;
    
    @Column(name = "DTLS_COM_NM")
    private String dtlsCdNm;
    
    @Column(name = "CD_VAL1")
    private String cdVal1;

    @Column(name = "CD_VAL2")
    private String cdVal2;
    
    @Column(name = "CD_VAL3")
    private String cdVal3;
    
    @Column(name = "PRRT_RNK")
    private String prrtRnk;
    
    @Column(name = "USE_YN")
    private String useYn;
    
    @Column(name = "DTLS_CD_DESC")
    private String dtlsCdDesc;
    
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

	@OneToOne
	@JoinColumn(name = "grpCd")
	private MasterCode masterCode;
    
    
	public String getGrpCd() {
		return grpCd;
	}

	public void setGrpCd(String grpCd) {
		this.grpCd = grpCd;
	}

	public String getDtlsCd() {
		return dtlsCd;
	}

	public void setDtlsCd(String dtlsCd) {
		this.dtlsCd = dtlsCd;
	}

	public String getDtlsCdNm() {
		return dtlsCdNm;
	}

	public void setDtlsCdNm(String dtlsCdNm) {
		this.dtlsCdNm = dtlsCdNm;
	}

	public String getCdVal1() {
		return cdVal1;
	}

	public void setCdVal1(String cdVal1) {
		this.cdVal1 = cdVal1;
	}

	public String getCdVal2() {
		return cdVal2;
	}

	public void setCdVal2(String cdVal2) {
		this.cdVal2 = cdVal2;
	}

	public String getCdVal3() {
		return cdVal3;
	}

	public void setCdVal3(String cdVal3) {
		this.cdVal3 = cdVal3;
	}

	public String getPrrtRnk() {
		return prrtRnk;
	}

	public void setPrrtRnk(String prrtRnk) {
		this.prrtRnk = prrtRnk;
	}

	public String getUseYn() {
		return useYn;
	}

	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}

	public String getDtlsCdDesc() {
		return dtlsCdDesc;
	}

	public void setDtlsCdDesc(String dtlsCdDesc) {
		this.dtlsCdDesc = dtlsCdDesc;
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

	public MasterCode getMasterCode() {
		return masterCode;
	}

	public void setMasterCode(MasterCode masterCode) {
		this.masterCode = masterCode;
	}

	@Override
	public String toString() {
		return "DetailCode [grpCd=" + grpCd + ", dtlsCd=" + dtlsCd
				+ ", dtlsCdNm=" + dtlsCdNm + ", cdVal1=" + cdVal1
				+ ", cdVal2=" + cdVal2 + ", cdVal3=" + cdVal3 + ", prrtRnk="
				+ prrtRnk + ", useYn=" + useYn + ", dtlsCdDesc=" + dtlsCdDesc
				+ ", createDt=" + createDt + ", createId=" + createId
				+ ", updateDt=" + updateDt + ", updateId=" + updateId + "]";
	}

	
}
