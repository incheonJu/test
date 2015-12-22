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
 * 게시판 댓글
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : BoardReply.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Entity
@Table(name = "tbl_board_reply")
public class BoardReply
{
	
	public BoardReply() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardReply(int boardSeq) {
		super();
		this.boardSeq = boardSeq;
	}

    @Column(name = "BOARD_SEQ")
    private int boardSeq;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "REPLY_SEQ")
	private int replySeq;

	@Column(name = "REPLY_CONTENTS")
    private String replyContents;
	
	@Column(name = "REPLY_NICKNM")
    private String replyNicknm;
	
	@Column(name = "REPLY_PWD")
    private String replyPwd;
	
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

	public int getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}

	public int getReplySeq() {
		return replySeq;
	}

	public void setReplySeq(int replySeq) {
		this.replySeq = replySeq;
	}

	public String getReplyContents() {
		return replyContents;
	}

	public void setReplyContents(String replyContents) {
		this.replyContents = replyContents;
	}

	public String getReplyNicknm() {
		return replyNicknm;
	}

	public void setReplyNicknm(String replyNicknm) {
		this.replyNicknm = replyNicknm;
	}

	public String getReplyPwd() {
		return replyPwd;
	}

	public void setReplyPwd(String replyPwd) {
		this.replyPwd = replyPwd;
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
		return "BoardReply [boardSeq=" + boardSeq + ", replySeq=" + replySeq
				+ ", replyContents=" + replyContents + ", replyNicknm="
				+ replyNicknm + ", replyPwd=" + replyPwd + ", delYn=" + delYn
				+ ", createDt=" + createDt + ", createId=" + createId
				+ ", updateDt=" + updateDt + ", updateId=" + updateId + "]";
	}
	

}