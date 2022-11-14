package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.LikeVO;

public interface LikeMapper {
	public void insertLike(LikeVO like);
	public void deleteLike(LikeVO like);
	public void deleteByBno(Integer bno);
	public List<LikeVO> getLikeByUserid(String userid);
	public List<String> getUserid(String userid);
	public int getLike(LikeVO like);
}
