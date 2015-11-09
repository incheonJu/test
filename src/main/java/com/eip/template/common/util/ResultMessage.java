package com.eip.template.common.util;

import com.fasterxml.jackson.databind.annotation.JsonSerialize;

/**
 * <p>Service Result Message Model Object Class </p>
 * <p>요청 응답 모델 클래스</p>
 * 
 * @version 1.0
 * @since 2013.09.23
 *
 */
@JsonSerialize(include=JsonSerialize.Inclusion.NON_NULL)
public class ResultMessage
{
    /**
     * 해당 요청에 대한 성공 유무
     */
    private boolean result;
    
    /**
     * 해당 요청에 대한 응답 Message Code.
     */
    private String msgCode;
    
    /**
     * 해당 요청에 대한 응답 Message
     */
    private String message;
    
    /**
     * 해당 요청에 대한 응답 정보.
     */
    private Object object;

    public ResultMessage(boolean result, String msgCode, String message, Object object)
    {
        super();
        this.result = result;
        this.msgCode = msgCode;
        this.message = message;
        this.object = object;
    }
    
    public ResultMessage(boolean result, String msgCode, String message)
    {
        super();
        this.result = result;
        this.msgCode = msgCode;
        this.message = message;
        this.object = null;
    }
    
    
    public ResultMessage(boolean result, Message message, Object object)
    {
        super();
        this.result = result;
        this.msgCode = message.getCode();
        this.message = message.getMessage();
        this.object = object;
    }
    
    public ResultMessage(boolean result, Message message)
    {
        super();
        this.result = result;
        this.msgCode = message.getCode();
        this.message = message.getMessage();
        this.object = null;
    }

    public boolean isResult()
    {
        return result;
    }

    public void setResult(boolean result)
    {
        this.result = result;
    }

    public String getMsgCode()
    {
        return msgCode;
    }

    public void setMsgCode(String msgCode)
    {
        this.msgCode = msgCode;
    }

    public String getMessage()
    {
        return message;
    }

    public void setMessage(String message)
    {
        this.message = message;
    }

    public Object getObject()
    {
        return object;
    }

    public void setObject(Object object)
    {
        this.object = object;
    }

    @Override
    public String toString()
    {
        return "ResultMessage [result=" + result + ", msgCode=" + msgCode + ", message=" + message + ", object=" + object + "]";
    }
    
}
