package com.eip.template.service.share.service.impl;

import com.eip.template.common.util.Message;
import com.eip.template.common.util.ResultMessage;
import com.eip.template.domain.share.visitor.Visitor;
import com.eip.template.repository.share.VisitorRepository;
import com.eip.template.service.share.VisitorService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@Service
public class VisitorServiceImpl implements VisitorService
{
    @Autowired
    private VisitorRepository visitorRepository;

    private ResultMessage reMessage;

    private Logger logger = LoggerFactory.getLogger(this.getClass());
    
    
    public VisitorServiceImpl() {
		super();
	}

    @Override
    public ResultMessage addBackofficeVisitor() {
        return null;
    }

    @Override
    public ResultMessage addFrontVisitor() {
        return null;
    }

    @Override
    public ResultMessage addVisitor() {
        return null;
    }

    @Override
    public ResultMessage insert(Visitor entity) {
        return null;
    }

    @Override
    public ResultMessage update(Visitor entity) {
        return null;
    }

    @Override
    public ResultMessage delete(Visitor entity) {
        return null;
    }

    @Override
    public ResultMessage get(Visitor entity) {
        return null;
    }

    @Override
    public ResultMessage getAll() {
        return null;
    }
}
