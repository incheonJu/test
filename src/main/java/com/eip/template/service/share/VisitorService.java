package com.eip.template.service.share;

import com.eip.template.domain.share.visitor.Visitor;
import com.eip.template.common.util.ResultMessage;


public interface VisitorService extends GenericService<Visitor>
{
	public ResultMessage addBackofficeVisitor();
	public ResultMessage addFrontVisitor();
	public ResultMessage addVisitor();
}
