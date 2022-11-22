package org.zerock.mapper;

import org.zerock.domain.AuthVO;

public interface MemberAuthMapper {
	public void insert(AuthVO auth);
	
	public void delete (String userid);

}
