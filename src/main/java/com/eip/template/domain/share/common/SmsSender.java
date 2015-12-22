package com.eip.template.domain.share.common;

import com.eip.template.common.util.serializer.JsonCustomDateDeserializer;
import com.eip.template.common.util.serializer.JsonCustomDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.io.UnsupportedEncodingException;
import java.util.Date;

/**
 * SMS 발송용 DTO sms DB 정의서 참고.
 * 
 * @author JungMinAhn
 */

@Entity
@Table(name = "dbprosender")
public class SmsSender
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column
	private int SEQ;

	@Transient
	private String MSGKEY;

	@Column
	private String FROMN;

	@Column
	private String TON;

	@Column
	private String MSGTYPE;

	@Column
	private byte[] MSGCONT;

	@Transient
	private String IMG1;

	@Transient
	private String IMG2;

	@Transient
	private String IMG3;

	@Transient
	private String MOVIEF;

	@Transient
	private String MUSICF;

	@Transient
	private String SUBJECT;

	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	@JsonSerialize(using = JsonCustomDateSerializer.class)
	@JsonDeserialize(using = JsonCustomDateDeserializer.class)
	@Transient
	private Date SENDDATE;

	@DateTimeFormat(pattern = "yyyy-MM-dd hh:mm:ss")
	@JsonSerialize(using = JsonCustomDateSerializer.class)
	@JsonDeserialize(using = JsonCustomDateDeserializer.class)
	@Transient
	private Date REPORTDATE;

	@Transient
	private String STATCODE;

	@Transient
	private String RESCODE;

	@Column
	private String SENDER;

	@Column
	private String CORPCODE;

	@Transient
	private String DEL;

	public SmsSender()
	{
	}

	public SmsSender(String tON, String mSGTYPE, String mSGCONT) throws UnsupportedEncodingException
	{
		super();
		TON = tON;
		MSGTYPE = mSGTYPE;
		MSGCONT = mSGCONT.getBytes("EUC-KR");
	}

	public SmsSender(String fROMN, String tON, String mSGTYPE, String mSGCONT) throws UnsupportedEncodingException
	{
		super();
		FROMN = fROMN;
		TON = tON;
		MSGTYPE = mSGTYPE;
		MSGCONT = mSGCONT.getBytes("EUC-KR");
	}

	public SmsSender(String fROMN, String tON, String mSGTYPE, String mSGCONT, String sENDER, String cORPCODE) throws UnsupportedEncodingException
	{
		super();
		FROMN = fROMN;
		TON = tON;
		MSGTYPE = mSGTYPE;
		MSGCONT = mSGCONT.getBytes("EUC-KR");
		SENDER = sENDER;
		CORPCODE = cORPCODE;
	}

	public int getSEQ()
	{
		return SEQ;
	}

	public void setSEQ(int sEQ)
	{
		SEQ = sEQ;
	}

	public String getMSGKEY()
	{
		return MSGKEY;
	}

	public void setMSGKEY(String mSGKEY)
	{
		MSGKEY = mSGKEY;
	}

	public String getFROMN()
	{
		return FROMN;
	}

	public void setFROMN(String fROMN)
	{
		FROMN = fROMN;
	}

	public String getTON()
	{
		return TON;
	}

	public void setTON(String tON)
	{
		TON = tON;
	}

	public String getMSGTYPE()
	{
		return MSGTYPE;
	}

	public void setMSGTYPE(String mSGTYPE)
	{
		MSGTYPE = mSGTYPE;
	}

	public byte[] getMSGCONT()
	{
		return MSGCONT;
	}

	public void setMSGCONT(byte[] mSGCONT)
	{
		MSGCONT = mSGCONT;
	}

	public String getIMG1()
	{
		return IMG1;
	}

	public void setIMG1(String iMG1)
	{
		IMG1 = iMG1;
	}

	public String getIMG2()
	{
		return IMG2;
	}

	public void setIMG2(String iMG2)
	{
		IMG2 = iMG2;
	}

	public String getIMG3()
	{
		return IMG3;
	}

	public void setIMG3(String iMG3)
	{
		IMG3 = iMG3;
	}

	public String getMOVIEF()
	{
		return MOVIEF;
	}

	public void setMOVIEF(String mOVIEF)
	{
		MOVIEF = mOVIEF;
	}

	public String getMUSICF()
	{
		return MUSICF;
	}

	public void setMUSICF(String mUSICF)
	{
		MUSICF = mUSICF;
	}

	public String getSUBJECT()
	{
		return SUBJECT;
	}

	public void setSUBJECT(String sUBJECT)
	{
		SUBJECT = sUBJECT;
	}

	public Date getSENDDATE()
	{
		return SENDDATE;
	}

	public void setSENDDATE(Date sENDDATE)
	{
		SENDDATE = sENDDATE;
	}

	public Date getREPORTDATE()
	{
		return REPORTDATE;
	}

	public void setREPORTDATE(Date rEPORTDATE)
	{
		REPORTDATE = rEPORTDATE;
	}

	public String getSTATCODE()
	{
		return STATCODE;
	}

	public void setSTATCODE(String sTATCODE)
	{
		STATCODE = sTATCODE;
	}

	public String getRESCODE()
	{
		return RESCODE;
	}

	public void setRESCODE(String rESCODE)
	{
		RESCODE = rESCODE;
	}

	public String getSENDER()
	{
		return SENDER;
	}

	public void setSENDER(String sENDER)
	{
		SENDER = sENDER;
	}

	public String getCORPCODE()
	{
		return CORPCODE;
	}

	public void setCORPCODE(String cORPCODE)
	{
		CORPCODE = cORPCODE;
	}

	public String getDEL()
	{
		return DEL;
	}

	public void setDEL(String dEL)
	{
		DEL = dEL;
	}

	@Override
	public String toString()
	{
		return "DBproSender [SEQ=" + SEQ + ", MSGKEY=" + MSGKEY + ", FROMN=" + FROMN + ", TON=" + TON + ", MSGTYPE=" + MSGTYPE + ", MSGCONT="
				+ MSGCONT + ", IMG1=" + IMG1 + ", IMG2=" + IMG2 + ", IMG3=" + IMG3 + ", MOVIEF=" + MOVIEF + ", MUSICF=" + MUSICF + ", SUBJECT="
				+ SUBJECT + ", SENDDATE=" + SENDDATE + ", REPORTDATE=" + REPORTDATE + ", STATCODE=" + STATCODE + ", RESCODE=" + RESCODE + ", SENDER="
				+ SENDER + ", CORPCODE=" + CORPCODE + ", DEL=" + DEL + "]";
	}

}
