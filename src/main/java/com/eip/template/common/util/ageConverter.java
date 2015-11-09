package com.eip.template.common.util;

import java.text.ParseException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class ageConverter
{
    public static int getAge(String birthday) throws ParseException
    {
        int year = Integer.parseInt(birthday);
        Calendar birth = new GregorianCalendar();
        Calendar today = new GregorianCalendar();
        birth.set(year, 0, 0);
        today.setTime(new Date());

        int factor = 0;
        if (today.get(Calendar.DAY_OF_YEAR) < birth.get(Calendar.DAY_OF_YEAR))
        {
            factor = -1;
        }
        return today.get(Calendar.YEAR) - birth.get(Calendar.YEAR) + factor;
    }
}
