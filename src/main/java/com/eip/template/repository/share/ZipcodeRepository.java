package com.eip.template.repository.share;

import java.util.List;

import com.eip.template.domain.share.common.Zipcode;
import com.eip.template.domain.share.visitor.Visitor;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ZipcodeRepository extends JpaRepository<Zipcode, Integer>
{

	/*public List<Zipcode> search(String name);*/
}