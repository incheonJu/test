package com.eip.template.common.util;

public class ResultManger
{
    public static ResultMessage getResultMessage(Object entity)
    {
        ResultMessage resultMessage;
        
        if (entity == null)
        {
            resultMessage = new ResultMessage(false, Message.ERR_NODATA);
        }
        else
        {
            resultMessage = new ResultMessage(true, Message.SUCCUSS, entity);
        }
        
        return resultMessage;
    }
}
