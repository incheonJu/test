package com.eip.template.domain.operator;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.Serializable;
import java.util.Date;

/**
 * 처리자 회원 DTO
 * @author AhnJungMin
 */
@Entity(name = "tbl_operator")
public class Operator implements Serializable
{
    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy= GenerationType.IDENTITY)
    @Column(name = "nSeq")
    private int seq;

    @Column(name = "strID")
    private String id;

    @Column(name = "strPW")
    private String pw;
    
    @Column(name = "strName")
    private String name;
    
    @Column(name = "strCertificationKey")
    private String certificationKey;
    
    @Column(name = "strEmail")
    private String email;
    
    @Column(name = "strTel1")
    private String tel1;
    
    @Column(name = "strTel2")
    private String tel2;
    
    @Column(name = "strTel3")
    private String tel3;
    
    @Column(name = "strMobile1")
    private String mobile1;
    
    @Column(name = "strMobile2")
    private String mobile2;
    
    @Column(name = "strMobile3")
    private String mobile3;
    
    @Column(name = "strFax1")
    private String fax1;
    
    @Column(name = "strFax2")
    private String fax2;
    
    @Column(name = "strFax3")
    private String fax3;
    
    @Column(name = "strZipcode")
    private String zipCode;
    
    @Column(name = "strAddr1")
    private String addr1;
    
    @Column(name = "strAddr2")
    private String addr2;
    

    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    @Column(name = "dRegDate")
    private Date regDate;
    
    @Column(name = "strUpdateIP")
    private String updateIP;
    
    @DateTimeFormat(pattern="yyyy-MM-dd hh:mm:ss")
    @Column(name = "dUpdateDate")
    private Date updateDate;
    
    @Column(name = "strUpdateID")
    private String updateID;
    
    @Column(name = "nAreaSeq")
    private int areaSeq;

    public Operator() {

    }

    public int getSeq()
    {
        return seq;
    }
    public void setSeq(int seq)
    {
        this.seq = seq;
    }
    public String getId()
    {
        return id;
    }
    public void setId(String id)
    {
        this.id = id;
    }
    public String getPw()
    {
        return pw;
    }
    public void setPw(String pw)
    {
        this.pw = pw;
    }
    public String getName()
    {
        return name;
    }
    public void setName(String name)
    {
        this.name = name;
    }
    public String getCertificationKey()
    {
        return certificationKey;
    }
    public void setCertificationKey(String certificationKey)
    {
        this.certificationKey = certificationKey;
    }
    public String getEmail()
    {
        return email;
    }
    public void setEmail(String email)
    {
        this.email = email;
    }
    public String getTel1()
    {
        return tel1;
    }
    public void setTel1(String tel1)
    {
        this.tel1 = tel1;
    }
    public String getTel2()
    {
        return tel2;
    }
    public void setTel2(String tel2)
    {
        this.tel2 = tel2;
    }
    public String getTel3()
    {
        return tel3;
    }
    public void setTel3(String tel3)
    {
        this.tel3 = tel3;
    }
    public String getMobile1()
    {
        return mobile1;
    }
    public void setMobile1(String mobile1)
    {
        this.mobile1 = mobile1;
    }
    public String getMobile2()
    {
        return mobile2;
    }
    public void setMobile2(String mobile2)
    {
        this.mobile2 = mobile2;
    }
    public String getMobile3()
    {
        return mobile3;
    }
    public void setMobile3(String mobile3)
    {
        this.mobile3 = mobile3;
    }
    public String getFax1()
    {
        return fax1;
    }
    public void setFax1(String fax1)
    {
        this.fax1 = fax1;
    }
    public String getFax2()
    {
        return fax2;
    }
    public void setFax2(String fax2)
    {
        this.fax2 = fax2;
    }
    public String getFax3()
    {
        return fax3;
    }
    public void setFax3(String fax3)
    {
        this.fax3 = fax3;
    }
    public String getZipCode()
    {
        return zipCode;
    }
    public void setZipCode(String zipCode)
    {
        this.zipCode = zipCode;
    }
    public String getAddr1()
    {
        return addr1;
    }
    public void setAddr1(String addr1)
    {
        this.addr1 = addr1;
    }
    public String getAddr2()
    {
        return addr2;
    }
    public void setAddr2(String addr2)
    {
        this.addr2 = addr2;
    }
    public Date getRegDate()
    {
        return regDate;
    }
    public void setRegDate(Date regDate)
    {
        this.regDate = regDate;
    }
    public String getUpdateIP()
    {
        return updateIP;
    }
    public void setUpdateIP(String updateIP)
    {
        this.updateIP = updateIP;
    }
    public Date getUpdateDate()
    {
        return updateDate;
    }
    public void setUpdateDate(Date updateDate)
    {
        this.updateDate = updateDate;
    }
    public String getUpdateID()
    {
        return updateID;
    }
    public void setUpdateID(String updateID)
    {
        this.updateID = updateID;
    }
    public int getAreaSeq() {
		return areaSeq;
	}
	public void setAreaSeq(int areaSeq) {
		this.areaSeq = areaSeq;
	}

    @Override
    public String toString() {
        return "Operator{" +
                "seq=" + seq +
                ", id='" + id + '\'' +
                ", pw='" + pw + '\'' +
                ", name='" + name + '\'' +
                ", certificationKey='" + certificationKey + '\'' +
                ", email='" + email + '\'' +
                ", tel1='" + tel1 + '\'' +
                ", tel2='" + tel2 + '\'' +
                ", tel3='" + tel3 + '\'' +
                ", mobile1='" + mobile1 + '\'' +
                ", mobile2='" + mobile2 + '\'' +
                ", mobile3='" + mobile3 + '\'' +
                ", fax1='" + fax1 + '\'' +
                ", fax2='" + fax2 + '\'' +
                ", fax3='" + fax3 + '\'' +
                ", zipCode='" + zipCode + '\'' +
                ", addr1='" + addr1 + '\'' +
                ", addr2='" + addr2 + '\'' +
                ", regDate=" + regDate +
                ", updateIP='" + updateIP + '\'' +
                ", updateDate=" + updateDate +
                ", updateID='" + updateID + '\'' +
                ", areaSeq=" + areaSeq +
                '}';
    }
}
