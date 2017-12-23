package com.mid.inter;

import org.apache.ibatis.annotations.Param;

public interface IStarDAO
{
	public void starInsert(@Param("r_id") int r_id, @Param("u_id") String u_id,
			@Param("taste") String taste, @Param("simple") String simple,
			@Param("creative") String creative);
	public void BstarInsert(@Param("b_id") int b_id, @Param("u_id") String u_id,
			@Param("b_star_score") String b_star_score);
}
