package joyou.friends.model;

import java.sql.Blob;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Friends")

public class FriendsBean {
	
	@Id
	@Column(name = "memberId")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	Integer memberId;
	Integer friendId;
	String friendaccount;
	String friendmail;
	String friendnickname;
	transient Blob picturepath;
	
	public FriendsBean() {		
	}

	public FriendsBean(Integer  memberId, Integer  friendId,String friendaccount, String friendmail,
			String friendnickname,Blob friendpicturepath) {
		this.memberId = memberId;
		this.friendId = friendId;
		this.friendaccount = friendaccount;
		this.friendmail = friendmail;
		this.friendnickname = friendnickname;
		this.picturepath = picturepath;
	}
	
	public FriendsBean(Integer imemberId) {		
		this.memberId = imemberId;
	}

	public Integer getMemberId() {
		return memberId;
	}

	public void setMemberId(Integer memberId) {
		this.memberId = memberId;
	}

	public Integer getFriendId() {
		return friendId;
	}

	public void setFriendId(Integer friendId) {
		this.friendId = friendId;
	}
	
	public String getFriendAccount() {
		return friendaccount;
	}
	public void setFriendAccount(String friendaccount) {
		this.friendaccount = friendaccount;
	}
	
	public String getFriendMail() {
		return friendmail;
	}
	public void setFriendMail(String friendmail) {
		this.friendmail = friendmail;
	}
	
	public String getFriendNickname() {
		return friendnickname;
	}
	public void setFriendNickname(String friendnickname) {
		this.friendnickname = friendnickname;
	}
	
	public Blob getPicturepath() {
		return picturepath;
	}
	public void setPicturepath(Blob picturepath) {
		this.picturepath = picturepath;
	}




	
}
