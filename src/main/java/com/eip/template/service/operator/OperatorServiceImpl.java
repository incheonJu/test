package com.eip.template.service.operator;

import com.eip.template.common.util.ResultMessage;
import com.eip.template.domain.operator.Operator;
import com.eip.template.repository.operator.OperatorRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@Service
public class OperatorServiceImpl implements OperatorService {
	@Autowired private OperatorRepository operatorRepository;
	private ResultMessage reMessage;

	@Override
	public ResultMessage insert(Operator entity) {
		return null;
	}

	@Override
	public ResultMessage update(Operator entity) {
		return null;
	}

	@Override
	public ResultMessage delete(Operator entity) {
		return null;
	}

	@Override
	public ResultMessage get(Operator entity) {
		return null;
	}

	@Override
	public ResultMessage getAll() {
		return null;
	}

	@Override
	public ResultMessage getList(Map<String, Object> parameters) {
		return null;
	}

	@Override
	public Map<String, Object> setQuery(HttpServletRequest request, String mode) {
		return null;
	}
}