package com.mid.inter;

import java.util.ArrayList;

import com.mid.dto.BrandUpdateDTO;


public interface IBrandUpdateDAO
{
	public BrandUpdateDTO Main(String b_id);
	
	public ArrayList<BrandUpdateDTO> Mate(String b_id);
	
	public ArrayList<BrandUpdateDTO> Step(String b_id);
	
	public ArrayList<BrandUpdateDTO> Cl(String b_id);
	
	public int StepLength(String b_id);
	public int MateLength(String b_id);
	public int ClLength(String b_id);
	
	public ArrayList<BrandUpdateDTO> StepID(String b_id);
	public ArrayList<BrandUpdateDTO> MateID(String b_id);
	public ArrayList<BrandUpdateDTO> ClID(String b_id);
	
	public void MainUpdate(BrandUpdateDTO dto);
	public void StepUpdate(BrandUpdateDTO dto);
	public void MateUpdate(BrandUpdateDTO dto);
	public void ClUpdate(BrandUpdateDTO dto);
	
	public void DeleteBrand(String b_id);
	
	public void StepDelete(BrandUpdateDTO dto);
	public void MateDelete(BrandUpdateDTO dto);
	public void ClDelete(BrandUpdateDTO dto);

}
