package com.mid.inter;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.mid.dto.TalkDTO;

public interface IReportDAO
{
	public ArrayList<TalkDTO> reportviewList();

	public void reportInsert(@Param("u_id") String u_id, @Param("re_type_id") String re_type_id,
			@Param("report_u_id") String report_u_id);
}
