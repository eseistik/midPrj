package com.mid.inter;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import com.mid.dto.MyBannerDTO;
import com.mid.dto.MyCookingclassDTO;
import com.mid.dto.MyCookingclassTimeDTO;
import com.mid.dto.MyInfoDTO;
import com.mid.dto.MyPointDTO;
import com.mid.dto.QuestionDTO;

public interface IMyDAO {
	public MyInfoDTO myInfo(String u_id);
	public void myInfoUpdate(MyInfoDTO dto);
	public void myInfoDrop(String u_id);
	public ArrayList<QuestionDTO> qList();
	public ArrayList<String> nicknameList();
	public ArrayList<MyCookingclassDTO> myCookingclassList(String u_id);
	public ArrayList<MyCookingclassDTO> myCookingclassEndList(String u_id);
	public ArrayList<MyCookingclassDTO> myCookingclassCourceList(String u_id);
	public ArrayList<MyCookingclassDTO> myCookingclassEndCourceList(String u_id);
	public ArrayList<MyCookingclassTimeDTO> myCookingclassTime(@Param("u_id")String u_id, @Param("cc_id")String cc_id);
	public ArrayList<MyCookingclassTimeDTO> myCookingTime(@Param("cc_id")String cc_id);
	public ArrayList<MyPointDTO> myPointList(String u_id);
	public ArrayList<MyBannerDTO> myBannerList(String u_id);
	public ArrayList<MyBannerDTO> myReservationBannerList(String u_id);
	public ArrayList<MyBannerDTO> myEndBannerList(String u_id);
}
