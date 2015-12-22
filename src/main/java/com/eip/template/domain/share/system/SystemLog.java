package com.eip.template.domain.share.system;

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


@Entity
@Table(name = "tbl_system_log")
public class SystemLog
{
	
	public SystemLog() {
		super();
		// TODO Auto-generated constructor stub
	}

	public SystemLog(String opCode) {
		super();
		this.opCode = opCode;
	}

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name = "OP_SEQ")
	private int opSeq;

    @Column(name = "OP_CODE")
    private String opCode;

	@Column(name = "OP_ID")
    private String opId;
	
	@Column(name = "OP_CONTENTS")
    private String opContents;
	
	@Column(name = "OP_ETC")
    private String opEtc;
	
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

	public int getOpSeq() {
		return opSeq;
	}

	public void setOpSeq(int opSeq) {
		this.opSeq = opSeq;
	}

	public String getOpCode() {
		return opCode;
	}

	public void setOpCode(String opCode) {
		this.opCode = opCode;
	}

	public String getOpId() {
		return opId;
	}

	public void setOpId(String opId) {
		this.opId = opId;
	}

	public String getOpContents() {
		return opContents;
	}

	public void setOpContents(String opContents) {
		this.opContents = opContents;
	}

	public String getOpEtc() {
		return opEtc;
	}

	public void setOpEtc(String opEtc) {
		this.opEtc = opEtc;
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

}