package joyou.friends.service.impl;

import java.util.List;
import java.util.Map;

import joyou.friends.dao.FriendsDao;
import joyou.friends.dao.impl.FriendsDaoImpl;
import joyou.friends.model.FriendsBean;
import joyou.friends.service.FriendsService;

public class FriendsServiceImpl implements FriendsService{
	FriendsDao dao;
	
	public FriendsServiceImpl() {
		dao = new FriendsDaoImpl();
	}

	@Override
	public List<FriendsBean> getAllFriendsJSON() {
		return dao.getAllFriendsJSON();
	}

	@Override
	public List<FriendsBean> getFriendsBypublisherId(int publisherId) {
		return getFriendsBypublisherId(publisherId);
	}

	@Override
	public Map<String, Object> getFriendsAmountBypublisherId(int publisherId) {
		return getFriendsAmountBypublisherId(publisherId);
	}

	@Override
	public Integer getmemberId() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void setmemberId(Integer memberId) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public FriendsBean getFriendTextOnly(Integer memberId) {
		// TODO Auto-generated method stub
		return null;
	}
	
}
