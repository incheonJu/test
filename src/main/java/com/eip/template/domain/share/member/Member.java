package com.eip.template.domain.share.member;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

/**
 * 사용자
 * @author bepe
 */
@Entity
@Table(name = "tbl_member")
public class Member
{
	public Member() {
	}

	public Member(String memberId) {
		super();
		this.memberId = memberId;
	}

	@Id
	@Column(name = "MEMBER_SEQ")
	private int memberSeq;

    @Column(name = "MEMBER_ID")
    private String memberId;
    
    @Column(name = "MEMBER_PWD")
    private String memberPwd;
    
    @Column(name = "MEMBER_NAME")
    private String memberName;
    
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

    @Column(name = "MEMBER_STATE")
    private String memberState;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @Column(name = "CREATE_DT")
    private Date createDt;
    
    @Column(name = "CREATE_ID")
    private String createId;
    
    @DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
    @Column(name = "UPDATE_DT")
    private Date updateDt;
    
    @Column(name = "UPDATE_ID")
    private String updateId;

    @Transient
    private String memberStateName;

	public int getMemberSeq() {
		return memberSeq;
	}

	public void setMemberSeq(int memberSeq) {
		this.memberSeq = memberSeq;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getMemberPwd() {
		return memberPwd;
	}

	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}

	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
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

	public String getMemberState() {
		return memberState;
	}

	public void setMemberState(String memberState) {
		this.memberState = memberState;
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

	public String getMemberStateName() {
		return memberStateName;
	}

	public void setMemberStateName(String memberStateName) {
		this.memberStateName = memberStateName;
	}

	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", email=" + email + ", tel1="
				+ tel1 + ", tel2=" + tel2 + ", tel3=" + tel3 + ", mobile1="
				+ mobile1 + ", mobile2=" + mobile2 + ", mobile3=" + mobile3
				+ ", zipCode=" + zipCode + ", addr1=" + addr1 + ", addr2="
				+ addr2 + ", memberState=" + memberState + ", createDt=" + createDt
				+ ", createId=" + createId + ", updateDt=" + updateDt
				+ ", updateId=" + updateId + "]";
	}

		
}
