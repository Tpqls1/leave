package org.zerock.mapper;

import java.util.List;

import org.zerock.domain.TagVO;

public interface TagMapper {
	public List<Integer> getBnoByTagName(String tagName);
	public TagVO readTagByBno(Integer bno);
	public void insertTag(TagVO tag);
	public void deleteTag(Integer bno);
	public void updateTag(TagVO tag);
}
