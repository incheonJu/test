package com.eip.template.service.share;

import com.eip.template.domain.share.common.Zipcode;
import com.eip.template.common.util.ResultMessage;


public interface ZipcodeService extends GenericService<Zipcode>
{
    ResultMessage searchZipcodeName(String query);
}