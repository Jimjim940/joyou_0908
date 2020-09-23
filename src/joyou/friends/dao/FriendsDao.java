package joyou.friends.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import joyou.friends.model.FriendsBean;

public interface FriendsDao {
	Integer getmemberId();
	void setmemberId(Integer memberId);
	FriendsBean getFriendTextOnly(Integer memberId);
	List<FriendsBean> getAllFriendsJSON();	
	public Map<String, Object> getFriendsAmountBypublisherId(int publisherId);
	List<FriendsBean> getFriendsBypublisherId(int publisherId) ;
	
	
	
	
}
