package com.mid.inter;

import java.util.ArrayList;

import com.mid.dto.BrandDTO;
import com.mid.dto.BrandIngDTO;
import com.mid.dto.BrandPicDTO;
import com.mid.dto.BrandStarScoreDTO;
import com.mid.dto.BrandStepDTO;

public interface IBrandContentDAO {
	public BrandDTO brandContent(String b_id);
	public ArrayList<BrandStarScoreDTO> brandStar(String b_id);
	public int brandStarJoin(String b_id);
	public ArrayList<BrandIngDTO> brandIng(String b_id);
	public ArrayList<BrandStepDTO> brandStep(String b_id);
	public ArrayList<BrandPicDTO> brandPicture(String b_id);
}
