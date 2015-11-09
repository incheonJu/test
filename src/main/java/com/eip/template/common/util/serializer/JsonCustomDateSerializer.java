package com.eip.template.common.util.serializer;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.fasterxml.jackson.core.JsonGenerator;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonSerializer;
import com.fasterxml.jackson.databind.SerializerProvider;
/**
 * 
 * JSON으로 Date 형식 값을 컨버팅할때 Format 변환 해주는 클래스.
 *
 */
public class JsonCustomDateSerializer extends JsonSerializer<Date>
{
    private SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    
    @Override
    public void serialize(Date date, JsonGenerator gen, SerializerProvider provider)
            throws IOException {
        String convertingDate = dateFormat.format(date);
        gen.writeString(convertingDate);
    }

}
