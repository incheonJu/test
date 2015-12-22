package com.eip.template.domain.share.board;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import com.eip.template.common.util.serializer.JsonCustomDateDeserializer;
import com.eip.template.common.util.serializer.JsonCustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 게시판
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : Faq.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Entity
@Table(name = "tbl_faq")
public class Faq
{
	
	public Faq() {
		super();
	}

	public Faq(int faqSeq) {
		super();
		this.faqSeq = faqSeq;
	}

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "FAQ_SEQ")
    private int faqSeq;

	@Column(name = "FAQ_TITLE")
    private String faqTitle;
	
	@Column(name = "FAQ_CONTENTS")
    private String faqContents;
	
	@Column(name = "DEL_YN")
    private String delYn;
	
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

   	public int getFaqSeq() {
		return faqSeq;
	}

	public void setFaqSeq(int faqSeq) {
		this.faqSeq = faqSeq;
	}

	public String getFaqTitle() {
		return faqTitle;
	}

	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}

	public String getFaqContents() {
		return faqContents;
	}

	public void setFaqContents(String faqContents) {
		this.faqContents = faqContents;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
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
		return "Faq [faqSeq=" + faqSeq + ", faqTitle=" + faqTitle
				+ ", faqContents=" + faqContents  
				+ ", delYn=" + delYn + ", createDt=" + createDt + ", createId="
				+ createId + ", updateDt=" + updateDt + ", updateId="
				+ updateId + "]";
	}
	

}