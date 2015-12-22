package com.eip.template.domain.share.visitor;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;

import com.eip.template.common.util.serializer.JsonCustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * 방문자
 * <PRE>
 * Project : eip_template_spring3mybatis
 * Filename : Visitor.java 
* Comment  : 
 * History  : 2014. 5. 30., 내용
 *</PRE>
 *@Version : 
 *@Author : bepe
 */
@Entity
@Table(name = "tbl_visitor")
public class Visitor
{
    @Id
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @JsonSerialize(using = JsonCustomDateSerializer.class)
    @Column(name = "VISIT_DATE")
    private Date visitDate;
    
    @Column(name = "VISIT_COUNT")
    private int visitCount;
    
    @Column(name = "FRONT_VISIT_COUNT")
    private int frontVisitCount;
    
    @Column(name = "BACKOFFICE_VISIT_COUNT")
    private int backofficeVisitCount;
    
    @Transient
    private String yyyy;
    
	@Transient
    private String mm;
    
    @Transient
    private String dd;

   public Visitor() {
	   super();
   }

	public Visitor(Date visitDate, int visitCount, int frontVisitCount,
			int backofficeVisitCount) {
		super();
		this.visitDate = visitDate;
		this.visitCount = visitCount;
		this.frontVisitCount = frontVisitCount;
		this.backofficeVisitCount = backofficeVisitCount;
	}

	public Visitor(Date visitDate, int visitCount, int frontVisitCount, int backofficeVisitCount,
			String yyyy, String mm, String dd) {
		super();
		this.visitDate = visitDate;
		this.visitCount = visitCount;
		this.frontVisitCount = frontVisitCount;
		this.backofficeVisitCount = backofficeVisitCount;
		this.yyyy = yyyy;
		this.mm = mm;
		this.dd = dd;
	}

	public Date getVisitDate() {
		return visitDate;
	}

	public void setVisitDate(Date visitDate) {
		this.visitDate = visitDate;
	}

	public int getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(int visitCount) {
		this.visitCount = visitCount;
	}

	public void addVisitorCount() {
		this.visitCount += 1; 
	}
	
	public void subVisitorCount(){
		this.visitCount -= 1;
	}

	public int getFrontVisitCount() {
		return frontVisitCount;
	}

	public void setFrontVisitCount(int frontVisitCount) {
		this.frontVisitCount = frontVisitCount;
	}

	public void addFrontVisitorCount() {
		this.frontVisitCount += 1; 
	}
	
	public void subFrontVisitorCount(){
		this.frontVisitCount -= 1;
	}

	public int getBackofficeVisitCount() {
		return backofficeVisitCount;
	}

	public void setBackofficeVisitCount(int backofficeVisitCount) {
		this.backofficeVisitCount = backofficeVisitCount;
	}

	public void addBackofficeVisitorCount() {
		this.backofficeVisitCount += 1; 
	}

	public void subBackofficeVisitorCount(){
		this.backofficeVisitCount -= 1;
	}
	
	public String getYyyy() {
		return yyyy;
	}

	public void setYyyy(String yyyy) {
		this.yyyy = yyyy;
	}

	public String getMm() {
		return mm;
	}

	public void setMm(String mm) {
		this.mm = mm;
	}

	public String getDd() {
		return dd;
	}

	public void setDd(String dd) {
		this.dd = dd;
	}
	
	
    
}
