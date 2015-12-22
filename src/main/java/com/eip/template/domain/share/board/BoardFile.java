package com.eip.template.domain.share.board;

import com.eip.template.common.util.serializer.JsonCustomDateDeserializer;
import com.eip.template.common.util.serializer.JsonCustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 게시판 파일
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : BoardFile.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Entity
@Table(name = "tbl_board_file")
public class BoardFile
{
	
	public BoardFile() {
		super();
		// TODO Auto-generated constructor stub
	}

	public BoardFile(int boardSeq) {
		super();
		this.boardSeq = boardSeq;
		// TODO Auto-generated constructor stub
	}
	
	public BoardFile(String fileName, String filePath, String fileDiv) {
		super();
		this.fileName = fileName;
		this.filePath = filePath;
		this.fileDiv = fileDiv;
	}

    @Column(name = "BOARD_SEQ")
    private int boardSeq;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "FILE_SEQ")
	private int fileSeq;

	@Column(name = "FILE_NAME")
    private String fileName;
	
	@Column(name = "FILE_PATH")
    private String filePath;
	
	@Column(name = "FILE_DIV")
    private String fileDiv;
	
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

	public int getFileSeq() {
		return fileSeq;
	}

	public void setFileSeq(int fileSeq) {
		this.fileSeq = fileSeq;
	}

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public String getFilePath() {
		return filePath;
	}

	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}

	public String getFileDiv() {
		return fileDiv;
	}

	public void setFileDiv(String fileDiv) {
		this.fileDiv = fileDiv;
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
		return "BoardFile [boardSeq=" + boardSeq + ", fileSeq=" + fileSeq
				+ ", fileName=" + fileName + ", filePath=" + filePath
				+ ", fileDiv=" + fileDiv + ", delYn=" + delYn + ", createDt="
				+ createDt + ", createId=" + createId + ", updateDt="
				+ updateDt + ", updateId=" + updateId + "]";
	}
	

}