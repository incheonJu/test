package com.eip.template.domain.share.board;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.eip.template.common.util.serializer.JsonCustomDateDeserializer;
import com.eip.template.common.util.serializer.JsonCustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import org.springframework.web.multipart.MultipartFile;

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
@Table(name = "tbl_board")
public class Board
{
	
	public Board() {
		super();
	}

	public Board(int boardSeq) {
		super();
		this.boardSeq = boardSeq;
	}

	@Id
    @GeneratedValue(strategy=GenerationType.IDENTITY)
    @Column(name = "BOARD_SEQ")
    private int boardSeq;

	@Column(name = "BOARD_TITLE")
    private String boardTitle;
	
	@Column(name = "BOARD_CONTENTS")
    private String boardContents;
	
	@Column(name = "BOARD_ETC")
    private String boardEtc;
	
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

    
    @Transient
    private List<MultipartFile> uploadfiles;

    @Transient
    List<BoardFile> boardFileList;
    
    @Transient
    List<BoardReply> boardReplyList;
    
	public int getBoardSeq() {
		return boardSeq;
	}

	public void setBoardSeq(int boardSeq) {
		this.boardSeq = boardSeq;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContents() {
		return boardContents;
	}

	public void setBoardContents(String boardContents) {
		this.boardContents = boardContents;
	}

	public String getBoardEtc() {
		return boardEtc;
	}

	public void setBoardEtc(String boardEtc) {
		this.boardEtc = boardEtc;
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

	public List<MultipartFile> getUploadfiles() {
		return uploadfiles;
	}

	public void setUploadfiles(List<MultipartFile> uploadfiles) {
		this.uploadfiles = uploadfiles;
	}

	public List<BoardFile> getBoardFileList() {
		return boardFileList;
	}

	public void setBoardFileList(List<BoardFile> boardFileList) {
		this.boardFileList = boardFileList;
	}

	public List<BoardReply> getBoardReplyList() {
		return boardReplyList;
	}

	public void setBoardReplyList(List<BoardReply> boardReplyList) {
		this.boardReplyList = boardReplyList;
	}

	@Override
	public String toString() {
		return "Board [boardSeq=" + boardSeq + ", boardTitle=" + boardTitle
				+ ", boardContents=" + boardContents + ", boardEtc=" + boardEtc
				+ ", delYn=" + delYn + ", createDt=" + createDt + ", createId="
				+ createId + ", updateDt=" + updateDt + ", updateId="
				+ updateId + "]";
	}
	

}