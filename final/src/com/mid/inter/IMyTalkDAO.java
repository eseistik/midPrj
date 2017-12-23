package com.mid.inter;

import java.util.ArrayList;

import com.mid.dto.MyAlertDTO;
import com.mid.dto.MyFollowDTO;
import com.mid.dto.MyTalkDTO;
import com.mid.dto.MyTalkInfoDTO;
import com.mid.dto.RecipeDTO;

public interface IMyTalkDAO {
	public MyTalkInfoDTO myTalkInfo(String u_id);
	public int followerCount(String u_id);
	public int followingCount(String fl_u_id);
	public ArrayList<MyAlertDTO> myAlertList(String u_id);
	public ArrayList<RecipeDTO> myRecipeList(String u_id);
	public ArrayList<MyTalkDTO> myTalkList(String u_id);
	public ArrayList<MyFollowDTO> myFollowerList(String u_id);
	public ArrayList<MyFollowDTO> myFollowingList(String u_id);
	public void myFollowInsert(String id, String u_id);
}
