package com.eip.template.common.util;


/**
 * 임시 비밀번호 생성을 위한 Class.
 */
public class ShufflePasswordMaker
{
    public static String ShufflePasswordMaker(int length)
    {
        char[] charSet = new char[]{
                '0','1','2','3','4','5','6','7','8','9'
                ,'A','B','C','D','E','F','G','H','I','J','K','L','M'
                ,'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
        StringBuilder sb = new StringBuilder();
        int idx = 0;
        
        for (int i = 0; i < length; i++)
        {
            idx = (int)(charSet.length * Math.random());
            sb.append(charSet[idx]);
        }
        
        return sb.toString();
    }
}
