package com.eip.template.controller.share;

import com.eip.template.service.share.ZipcodeService;
import com.eip.template.common.util.ResultMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping(value = "/zipcode")
public class ZipcodeAPIController
{
    @Autowired
    private ZipcodeService zipcodeService;
    
    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    
    @RequestMapping(value = "/search/{query}", method = RequestMethod.GET)
    @ResponseBody
    public ResultMessage searchData(@PathVariable String query)
    {

        return zipcodeService.searchZipcodeName(query);
    }    
}