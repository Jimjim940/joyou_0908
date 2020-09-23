package joyou.friends.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import joyou.friends.model.FriendsBean;

public interface FriendsService {
	public Integer getmemberId();
	public void setmemberId(Integer memberId);
	public FriendsBean getFriendTextOnly(Integer memberId);
	public List<FriendsBean> getAllFriendsJSON();	

	public List<FriendsBean> getFriendsBypublisherId(int publisherId) ;
	
	public Map<String, Object> getFriendsAmountBypublisherId(int publisherId);
}
