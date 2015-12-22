package com.eip.template.domain.share.common;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 지역 DTO
 */
@Entity
@Table(name = "tbl_zipcode")
public class Zipcode
{
    @Id
    @Column(name = "ZIP_CODE")
    private String zipcode;
    
    @Column(name = "SIDO")
    private String sido;
    
    @Column(name = "GUGUN")
    private String gugun;
    
    @Column(name = "DONG")
    private String dong;
    
    @Column(name = "RI")
    private String ri;
    
    @Column(name = "BLDG")
    private String bldg;
    
    @Column(name = "BUNJI")
    private String bunji;
    
    @Column(name = "SEQ")
    private String seq;
        
    public String getZipcode()
    {
        return zipcode;
    }

    public void setZipcode(String zipcode)
    {
        this.zipcode = zipcode;
    }
    
    public String getSido()
    {
        return sido;
    }

    public void setSido(String sido)
    {
        this.sido = sido;
    }
    
    public String getGugun()
    {
        return gugun;
    }

    public void setGugun(String gugun)
    {
        this.gugun = gugun;
    }
    
    public String getDong()
    {
        return dong;
    }

    public void setDong(String dong)
    {
        this.dong = dong;
    }
    
    public String getRi()
    {
        return ri;
    }

    public void setRi(String ri)
    {
        this.ri = ri;
    }
    
    public String getBldg()
    {
        return bldg;
    }

    public void setBldg(String bldg)
    {
        this.bldg = bldg;
    }
    
    public String getBunji()
    {
        return bunji;
    }

    public void setBunji(String bunji)
    {
        this.bunji = bunji;
    }
    
    public String getSeq()
    {
        return seq;
    }

    public void setSeq(String seq)
    {
        this.seq = seq;
    }

    @Override
    public String toString()
    {
        return "Area [zipcode=" + zipcode + ", sido=" + sido + ", gugun=" + gugun + ", dong=" + dong + ", ri=" + ri + ", bldg=" + bldg + ", bunji=" + bunji + ", seq=" + seq + "]";
    }
    
}