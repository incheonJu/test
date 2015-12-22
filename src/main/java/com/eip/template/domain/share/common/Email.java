package com.eip.template.domain.share.common;


public class Email
{
    private String subject; // 제목
    
    private String content; // 내용
    
    private String fromUser; // 보내는 사람
    
    private String toUser; // 받는 사람
    
    private String[] toCC; // 참조할 사람

    public Email()
    {
    	
    }
    public Email(String subject, String content, String fromUser, String toUser, String[] toCC)
    {
        super();
        this.subject = subject;
        this.content = content;
        this.fromUser = fromUser;
        this.toUser = toUser;
        this.toCC = toCC;
    }
    
    public String getSubject()
    {
        return subject;
    }

    public void setSubject(String subject)
    {
        this.subject = subject;
    }

    public String getContent()
    {
        return content;
    }

    public void setContent(String content)
    {
        this.content = content;
    }

    public String getFromUser()
    {
        return fromUser;
    }

    public void setFromUser(String fromUser)
    {
        this.fromUser = fromUser;
    }

    public String getToUser()
    {
        return toUser;
    }

    public void setToUser(String toUser)
    {
        this.toUser = toUser;
    }

    public String[] getToCC()
    {
        return toCC;
    }

    public void setToCC(String[] toCC)
    {
        this.toCC = toCC;
    }

    @Override
    public String toString()
    {
        return "email [subject=" + subject + ", contetn=" + content + ", fromUser=" + fromUser + ", toUser=" + toUser + ", toCC=" + toCC + "]";
    }
    
}
