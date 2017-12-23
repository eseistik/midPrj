package com.mid.inter;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.mid.dto.TalkDTO;

public interface ITalkDAO
{
	public ArrayList<TalkDTO> talkviewLists();
	public int talkcommentCounts(int t_id);
	public int talkInsert(@Param("u_id")String u_id, @Param("t_content")String t_content, @Param("t_img")String t_img);
	public TalkDTO talkviewContents(@Param("t_id")int t_id);
	public ArrayList<TalkDTO> talkviewComments(@Param("t_id")int t_id);
	public void talkcommentInsert(@Param("t_id")int t_id, @Param("u_id")String u_id, @Param("t_co_content")String t_co_content);
	public void talkmodifyContent(@Param("t_id")int t_id, @Param("t_content")String t_content, @Param("t_img")String t_img);
	
	public int talkRemove(int t_id);
	
}
