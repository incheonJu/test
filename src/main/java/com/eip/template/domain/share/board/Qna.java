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
 * Filename : Board.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Entity
@Table(name = "tbl_qna")
public class Qna
{
	
	public Qna() {
		super();
	}

	public Qna(int qnaSeq) {
		super();
		this.qnaSeq = qnaSeq;
	}
	
	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "QNA_SEQ")
    private int qnaSeq;

	@Column(name = "QNA_REF_SEQ")
    private int qnaRefSeq;
	
	@Column(name = "QNA_DEPTH")
    private int qnaDepth;
	
	@Column(name = "QNA_TITLE")
    private String qnaTitle;
	
	@Column(name = "QNA_CONTENTS")
    private String qnaContents;
	
	@Column(name = "CREATE_NAME")
	private String createName;
	
	@Column(name = "CREATE_EMAIL")
    private String createEmail;
	
	@Column(name = "CREATE_TEL1")
	private String createTel1;
	
	@Column(name = "CREATE_TEL2")
	private String createTel2;
	
	@Column(name = "CREATE_TEL3")
	private String createTel3;
	
	@Column(name = "CREATE_PWD")
	private String createPwd;
	
	@Column(name = "OPEN_YN")
	private String openYn;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
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
    
    @Column(name = "REPLY_YN")
    private String replyYn;

	public int getQnaSeq() {
		return qnaSeq;
	}

	public void setQnaSeq(int qnaSeq) {
		this.qnaSeq = qnaSeq;
	}

	public int getQnaRefSeq() {
		return qnaRefSeq;
	}

	public void setQnaRefSeq(int qnaRefSeq) {
		this.qnaRefSeq = qnaRefSeq;
	}

	public int getQnaDepth() {
		return qnaDepth;
	}

	public void setQnaDepth(int qnaDepth) {
		this.qnaDepth = qnaDepth;
	}

	public String getQnaTitle() {
		return qnaTitle;
	}

	public void setQnaTitle(String qnaTitle) {
		this.qnaTitle = qnaTitle;
	}

	public String getQnaContents() {
		return qnaContents;
	}

	public void setQnaContents(String qnaContents) {
		this.qnaContents = qnaContents;
	}

	public String getCreateName() {
		return createName;
	}

	public void setCreateName(String createName) {
		this.createName = createName;
	}

	public String getCreateEmail() {
		return createEmail;
	}

	public void setCreateEmail(String createEmail) {
		this.createEmail = createEmail;
	}

	public String getCreateTel1() {
		return createTel1;
	}

	public void setCreateTel1(String createTel1) {
		this.createTel1 = createTel1;
	}

	public String getCreateTel2() {
		return createTel2;
	}

	public void setCreateTel2(String createTel2) {
		this.createTel2 = createTel2;
	}

	public String getCreateTel3() {
		return createTel3;
	}

	public void setCreateTel3(String createTel3) {
		this.createTel3 = createTel3;
	}

	public String getCreatePwd() {
		return createPwd;
	}

	public void setCreatePwd(String createPwd) {
		this.createPwd = createPwd;
	}

	public String getOpenYn() {
		return openYn;
	}

	public void setOpenYn(String openYn) {
		this.openYn = openYn;
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

	public String getReplyYn() {
		return replyYn;
	}

	public void setReplyYn(String replyYn) {
		this.replyYn = replyYn;
	}

	@Override
	public String toString() {
		return "Qna [qnaSeq=" + qnaSeq + ", qnaRefSeq=" + qnaRefSeq
				+ ", qnaDepth=" + qnaDepth + ", qnaTitle=" + qnaTitle
				+ ", qnaContents=" + qnaContents + ", createEmail="
				+ createEmail + ", createTel1=" + createTel1 + ", createTel2="
				+ createTel2 + ", createTel3=" + createTel3 + ", createPwd="
				+ createPwd + ", openYn=" + openYn + ", delYn=" + delYn
				+ ", createDt=" + createDt + ", createId=" + createId
				+ ", updateDt=" + updateDt + ", updateId=" + updateId + "]";
	}
	
}