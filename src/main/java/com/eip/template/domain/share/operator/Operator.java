package com.eip.template.domain.share.operator;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.eip.template.common.util.serializer.JsonCustomDateDeserializer;
import com.eip.template.common.util.serializer.JsonCustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * admin 관리자
 * @author bepe
 */
@Entity
@Table(name = "tbl_operator")
public class Operator
{
	public Operator() {
	}

	public Operator(String operId) {
		super();
		this.operId = operId;
	}

	@Id
    @Column(name = "OPER_ID")
    private String operId;
    
    @Column(name = "OPER_PWD")
    private String operPwd;
    
    @Column(name = "OPER_NAME")
    private String operName;
    
    @Column(name = "EMAIL")
    private String email;

    @Column(name = "TEL1")
    private String tel1;
    
    @Column(name = "TEL2")
    private String tel2;
    
    @Column(name = "TEL3")
    private String tel3;
    
    @Column(name = "MOBILE1")
    private String mobile1;
    
    @Column(name = "MOBILE2")
    private String mobile2;
    
    @Column(name = "MOBILE3")
    private String mobile3;
    
    @Column(name = "ZIP_CODE")
    private String zipCode;
    
    @Column(name = "ADDR1")
    private String addr1;
    
    @Column(name = "ADDR2")
    private String addr2;

    @Column(name = "OPER_STATE")
    private String operState;
    
    @Column(name = "PRIV01")
    private boolean priv01;
    
    @Column(name = "PRIV02")
    private boolean priv02;
    
    @Column(name = "PRIV03")
    private boolean priv03;
    
    @Column(name = "PRIV04")
    private boolean priv04;
    
    @Column(name = "PRIV05")
    private boolean priv05;
    
   
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
    private String operStateName;
    
    
	public String getOperId() {
		return operId;
	}

	public void setOperId(String operId) {
		this.operId = operId;
	}

	public String getOperPwd() {
		return operPwd;
	}

	public void setOperPwd(String operPwd) {
		this.operPwd = operPwd;
	}

	public String getOperName() {
		return operName;
	}

	public void setOperName(String operName) {
		this.operName = operName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getMobile1() {
		return mobile1;
	}

	public void setMobile1(String mobile1) {
		this.mobile1 = mobile1;
	}

	public String getMobile2() {
		return mobile2;
	}

	public void setMobile2(String mobile2) {
		this.mobile2 = mobile2;
	}

	public String getMobile3() {
		return mobile3;
	}

	public void setMobile3(String mobile3) {
		this.mobile3 = mobile3;
	}

	public String getZipCode() {
		return zipCode;
	}

	public void setZipCode(String zipCode) {
		this.zipCode = zipCode;
	}

	public String getAddr1() {
		return addr1;
	}

	public void setAddr1(String addr1) {
		this.addr1 = addr1;
	}

	public String getAddr2() {
		return addr2;
	}

	public void setAddr2(String addr2) {
		this.addr2 = addr2;
	}

	public String getOperState() {
		return operState;
	}

	public void setOperState(String operState) {
		this.operState = operState;
	}

	public boolean isPriv01() {
		return priv01;
	}

	public void setPriv01(boolean priv01) {
		this.priv01 = priv01;
	}

	public boolean isPriv02() {
		return priv02;
	}

	public void setPriv02(boolean priv02) {
		this.priv02 = priv02;
	}

	public boolean isPriv03() {
		return priv03;
	}

	public void setPriv03(boolean priv03) {
		this.priv03 = priv03;
	}

	public boolean isPriv04() {
		return priv04;
	}

	public void setPriv04(boolean priv04) {
		this.priv04 = priv04;
	}

	public boolean isPriv05() {
		return priv05;
	}

	public void setPriv05(boolean priv05) {
		this.priv05 = priv05;
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

	public String getOperStateName() {
		return operStateName;
	}

	public void setOperStateName(String operStateName) {
		this.operStateName = operStateName;
	}

	@Override
	public String toString() {
		return "Operator [operId=" + operId + ", operPwd=" + operPwd
				+ ", operName=" + operName + ", email=" + email + ", tel1="
				+ tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", mobile1="
				+ mobile1 + ", mobile2=" + mobile2 + ", mobile3=" + mobile3
				+ ", zipCode=" + zipCode + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", operState=" + operState + ", priv01=" + priv01
				+ ", priv02=" + priv02 + ", priv03=" + priv03 + ", priv04="
				+ priv04 + ", priv05=" + priv05 + ", createDt=" + createDt
				+ ", createId=" + createId + ", updateDt=" + updateDt
				+ ", updateId=" + updateId + "]";
	}

		
}
