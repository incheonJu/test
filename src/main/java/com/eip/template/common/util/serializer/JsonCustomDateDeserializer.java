package com.eip.template.common.util.serializer;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.DeserializationContext;
import com.fasterxml.jackson.databind.JsonDeserializer;

public class JsonCustomDateDeserializer extends JsonDeserializer<Date>
{
    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    @Override
    public Date deserialize(JsonParser parser, DeserializationContext context) throws IOException {
        String date = parser.getText();
        try
        {
            return dateFormat.parse(date);
        }
        catch (java.text.ParseException e)
        {
            e.printStackTrace();
        }
        return null;
    }

}
