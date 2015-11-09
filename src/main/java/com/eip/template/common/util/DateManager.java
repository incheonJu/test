package com.eip.template.common.util;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

/**
 * @author AhnJungMin
 * 
 * 현재 시스템 날짜를 이용하여, File 저장 폴더링에 필요한 날짜 정보 제공 매니저 클래스
 *
 */
public class DateManager
{
    private static DateManager instence;
    private Date date;
    private Calendar calendar;

    public DateManager()
    {
        calendar = Calendar.getInstance();
    }

    public static DateManager getInstance()
    {
        if (instence == null)
        {
            instence = new DateManager();
        }

        return instence;
    }

    public Date getDate()
    {
        date = new Date();
        return date;
    }

    public String getMonth()
    {
        date = new Date();
        return String.valueOf(calendar.get(Calendar.MONTH) + 1);
    }

    public String getDay()
    {
        date = new Date();
        return String.valueOf(calendar.get(Calendar.DATE));
    }

    public String getYear()
    {
        date = new Date();
        return String.valueOf(calendar.get(Calendar.YEAR));
    }

    public String getFilePathToLogData()
    {
        String path = "";
        date = new Date();

        path += getYear() + "/" + getMonth() + "/" + getDay();
        return path;
    }

    public String getReferenceDate()
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
        date = new Date();
        return sdf.format(date);
    }
    
    public String convertToString(Date date)
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        return sdf.format(date);
    }
    
    public String getDateFileName()
    {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        date = new Date();
        return sdf.format(date);
    }
    
    public String getLastDay()
    {
        return String.valueOf(calendar.getActualMaximum(Calendar.DAY_OF_MONTH));
    }
}
