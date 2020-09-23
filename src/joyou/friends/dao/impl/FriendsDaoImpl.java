package joyou.friends.dao.impl;


import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.DataSource;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;


import joyou.friends.dao.FriendsDao;
import joyou.friends.model.FriendsBean;


@Repository("myFriendsDao")
public class FriendsDaoImpl implements FriendsDao {
	
	SessionFactory factory;
	Session session;
	Integer memberId;
	DataSource ds;
	
	public static final int RECORDS_PER_PAGE = 9;
	Integer recordsPerPage = RECORDS_PER_PAGE;
	
	public Integer getmemberId() {
		return memberId;
	}
	
	
	public void setmemberId(Integer memberId) {
		this.memberId = memberId;
	}

	
	
	
	public void setSession(Session session) {
		this.session = session;
	}
	
	public FriendsDaoImpl() {
	}
	
	public FriendsDaoImpl(Session session) {
		this.session=session;
		}
	public List<FriendsBean> getAllFriendsJSON()  {
		List<FriendsBean> list = new ArrayList<>();
		String sql = "SELECT b.*, bc.account FROM friends b JOIN memberTest1 bc ON b.friendId = bc.memberID";
		try(
			Connection con = ds.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
		) {
			while (rs.next()) {
				int memberId = rs.getInt("memberId");
				int friendId = rs.getInt("friendId");
				String friendaccount  = rs.getString("account");
				String friendmail  = rs.getString("mail");
				String friendnickname  = rs.getString("nickname");
				
				
				FriendsBean bb = new FriendsBean(memberId,friendId,friendaccount,
						friendmail,friendnickname,null);;
				list.add(bb);
			}
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
		return list;
	}
	public List<FriendsBean> getAllFriends() throws SQLException {
		List<FriendsBean> list = new ArrayList<>();
		String sql = "SELECT b.*, bc.account FROM Book b JOIN memberTest1 bc ON b.friendId = bc.memberID";
		try(
			Connection con = ds.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
		) {
			while (rs.next()) {
				//
				int memberId = rs.getInt("memberId");
				int friendId = rs.getInt("friendId");
				String friendaccount  = rs.getString("account");
				String friendmail  = rs.getString("mail");
				String friendnickname  = rs.getString("nickname");
				Blob blob  = rs.getBlob("picturepath");
				
				FriendsBean bb = new FriendsBean(memberId,friendId,friendaccount,
						friendmail,friendnickname,blob);
				list.add(bb);
			}
		} 
		return list;
	}
	public FriendsBean getFriend() throws SQLException {
		FriendsBean bb = null;
		String sql = "SELECT b.*, bc.account FROM friends b JOIN memberTest1 bc ON b.friendId = bc.memberID WHERE memberId = ?";
		try(
			Connection con = ds.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
		) {
			stmt.setInt(1, memberId);
			try(
				ResultSet rs = stmt.executeQuery();
			) {
				if (rs.next()) {
					int memberId = rs.getInt("memberId");
					int friendId = rs.getInt("friendId");
					String friendaccount  = rs.getString("account");
					String friendmail  = rs.getString("mail");
					String friendnickname  = rs.getString("nickname");
					Blob blob  = rs.getBlob("picturepath");
					
					bb = new FriendsBean(memberId,friendId,friendaccount,
										friendmail,friendnickname,blob);
				}
			}
		} 
		return bb;
	}

	
	public FriendsBean getFriendsTextOnly(Integer memberId)  {
		FriendsBean bean = null;
		try {
			setmemberId(memberId);
			bean = getFriendsTextOnly();
		} catch(Exception ex) {
			ex.printStackTrace();
		}
		return bean;
	}


	public FriendsBean getFriendsTextOnly() throws SQLException {
		FriendsBean bb = null;
		String sql = "SELECT b.*, bc.account FROM friends b JOIN memberTest1 bc ON b.friendId = bc.memberID  WHERE friendId = ?";
		try (
			Connection con = ds.getConnection(); 
			PreparedStatement stmt = con.prepareStatement(sql);
		) {
			stmt.setInt(1, memberId);
			try (ResultSet rs = stmt.executeQuery();) {
				if (rs.next()) {
					int memberId = rs.getInt("memberId");
					int friendId = rs.getInt("friendId");
					String friendaccount  = rs.getString("account");
					String friendmail  = rs.getString("mail");
					String friendnickname  = rs.getString("nickname");
					Blob blob  = rs.getBlob("picturepath");
					
					bb = new FriendsBean(memberId,friendId,friendaccount,
										friendmail,friendnickname,blob);
					
				}
			}
			return bb;
		}
	}


	public List<FriendsBean> getPageFriends(Integer pageNo) {
		int startRecordNo = 0;
		int endRecordNo = 0;
		
        List<FriendsBean> list = new ArrayList<FriendsBean>();
        String sql = ""; 
        String sql0 = "SELECT  * FROM (SELECT  ROW_NUMBER() OVER (ORDER BY memberId)"
				+ " AS RowNum, b.memberId, b.friendId, b.account, b.mail, b.nickname, "
				+ " b.picturepath ,"
				+ " FROM Friends b JOIN memberTest1 bc ON  b.friendId = bc.id )"
				+ " AS NewTable WHERE RowNum >= ? AND RowNum <= ?";
        
		String sql1 = "SELECT b.memberId, b.friendId, b.account, b.mail, b.nickname, "
				+ " b.picturepath, "
				+ "bc.name FROM Friends b JOIN memberTest1 bc ON  b.friendId = bc.id "
				+ " LIMIT ?, ?";        
     
		try (
			Connection connection = ds.getConnection(); 
			PreparedStatement ps = connection.prepareStatement(sql);
		) {
			ps.setInt(1, startRecordNo);
			ps.setInt(2, endRecordNo);
			try (
				ResultSet rs = ps.executeQuery();
			) {
				// 只要還有紀錄未取出，rs.next()會傳回true
				// 迴圈內將逐筆取出ResultSet內的紀錄
				while (rs.next()) {
					// 準備一個新的BookBean，將ResultSet內的一筆紀錄移植到BookBean內
					FriendsBean bean = new FriendsBean();    	
					bean.setMemberId(rs.getInt("memberId"));		
					bean.setFriendId(rs.getInt("friendId"));
					bean.setFriendAccount(rs.getString("account"));
					bean.setFriendMail(rs.getString("mail"));
					bean.setFriendNickname(rs.getString("nickname"));
					bean.setPicturepath(rs.getBlob("picturepath"));
				
					// 最後將BookBean物件放入大的容器內
					list.add(bean);
				}
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new RuntimeException("BookDaoImpl_Jdbc()#getPageBooks()發生例外: " 
										+ ex.getMessage());
		}
		return list;
	}
	public long getRecordCounts() {
		long count = 0; // 必須使用 long 型態
		String sql = "SELECT count(*) FROM Book";
		try (
			Connection connection = ds.getConnection();
			PreparedStatement ps = connection.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
		) {
			if (rs.next()) {
				count = rs.getLong(1);
			}
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new RuntimeException("MemberDaoImpl_Jdbc()#getRecordCounts()發生例外: " 
										+ ex.getMessage());
		}
		return count;
	}

	

	public List<FriendsBean> getFriendsBypublisherId(int publisherId) {//透過friendId連線到members的id
		List<FriendsBean> list = new ArrayList<>();
		String sql = "SELECT b.*, bc.account FROM friends b JOIN memberTest1 bc ON b.friendId = bc.memberID WHERE b.friendId = ?";
		
		try(
			Connection con = ds.getConnection();
			PreparedStatement stmt = con.prepareStatement(sql);
		) {
			stmt.setInt(1, publisherId);
			try (
					ResultSet rs = stmt.executeQuery();
			) {
				while (rs.next()) {
					
					int memberId = rs.getInt("memberId");
					int friendId = rs.getInt("friendId");
					String friendaccount  = rs.getString("account");
					String friendmail  = rs.getString("mail");
					String friendnickname  = rs.getString("nickname");
					Blob blob  = rs.getBlob("picturepath");
					
					FriendsBean bb = new FriendsBean(memberId,friendId,friendaccount,
							friendmail,friendnickname,blob);
					list.add(bb);
				}
			}	
		} catch(Exception e) {
			e.printStackTrace();
		}
		return list;

	
	}
	@Override
	public Map<String, Object> getFriendsAmountBypublisherId(int publisherId) {
		long count = 0;    	// 好友類別
		String account = ""; // 好友名稱
		String mail = "";
		String nickname = "";
		String picturepath = "";
		String sql  = "SELECT count(*) FROM Book WHERE friendId = ?";
		String sql2 = "SELECT account FROM memberTest1 WHERE id=?";
		String sql3 = "SELECT mail FROM memberTest1 WHERE id=?";
		String sql4 = "SELECT nickname FROM memberTest1 WHERE id=?";
		String sql5 = "SELECT picturepath FROM memberTest1 WHERE id=?";
		Map<String, Object>  map = new HashMap<>();
		try (
			Connection connection = ds.getConnection();
			PreparedStatement ps = connection.prepareStatement(sql);
			PreparedStatement ps2 = connection.prepareStatement(sql2);
			PreparedStatement ps3 = connection.prepareStatement(sql3);
			PreparedStatement ps4 = connection.prepareStatement(sql4);
			PreparedStatement ps5 = connection.prepareStatement(sql5);
		) {
			ps.setInt(1, publisherId);
			ps2.setInt(1, publisherId);
			ps3.setInt(1, publisherId);
			ps4.setInt(1, publisherId);
			ps5.setInt(1, publisherId);
			try (
				ResultSet rs = ps.executeQuery();
			) {
				if (rs.next()) {
					count = rs.getLong(1);
				}
			}
			try (
				ResultSet rs2 = ps2.executeQuery();
				) {
					if (rs2.next()) {
						account = rs2.getString(1);
					}
				}
			try (
					ResultSet rs3 = ps3.executeQuery();
					) {
						if (rs3.next()) {
							account = rs3.getString(1);
						}
					}
			try (
					ResultSet rs4 = ps4.executeQuery();
					) {
						if (rs4.next()) {
							account = rs4.getString(1);
						}
					}
			try (
					ResultSet rs5 = ps5.executeQuery();
					) {
						if (rs5.next()) {
							account = rs5.getString(1);
						}
					}
		} catch (SQLException ex) {
			ex.printStackTrace();
			throw new RuntimeException("MemberDaoImpl_Jdbc()#getRecordCounts()發生例外: " 
										+ ex.getMessage());
		}
		map.put("friendType", count);
		map.put("friendaccount", account);
		map.put("friendmail", mail);
		map.put("friendnickname", nickname);
		map.put("friendpicturepath", picturepath);
		return map;
	}

	@Override
	public FriendsBean getFriendTextOnly(Integer memberId) {
		// TODO Auto-generated method stub
		return null;
	}






}
