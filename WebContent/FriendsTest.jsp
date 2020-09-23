<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>	
<!DOCTYPE html>
<html>
<head>
<link rel='stylesheet' href='${pageContext.request.contextPath}/css/styles.css' type="text/css" />
<meta charset="UTF-8">
<title>好友測試</title>
</head>
<body>
<div class='center'>
	請挑選會員ID: 
	<select id='memberId'></select>
	<hr>
	<!-- 顯示書籍資料的區域 -->
	<div id='friendarea' style='height: 150px;' class='center'>
	</div>
	<script>
		var selectElement = document.getElementById('memberId');  // 取出select標籤
		var friendarea = document.getElementById('friendarea');     // 取出書籍資料的div標籤
		var xhr = new XMLHttpRequest();        	// 讀取書籍表格內的書籍資料
		var xhr2 = new XMLHttpRequest();		// 讀取單一書籍的資料
		// 存放所有書籍資料的書名與主鍵值，每一本書的書名與主鍵值放入一個陣列，在將此陣列放入(push)陣列bookData中
		var friendData = [];						
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) {
				var friends = JSON.parse(xhr.responseText);
				for (var i = 0; i < friends.length; i++) {
					// 每一本書的書名與主鍵值放入一個陣列
					var  friend = [  friend[i].title,  friend[i]. memberId ];
					// 在將此陣列放入(push)陣列bookData中
					friendData.push(friend);
				}
		        // 將bookData內的資料全部移植到select標籤中
				for (var i = 0; i < friendData.length; i++) {
					var option = new Option(friendData[i][0], "" + friendData[i][1]);
					selectElement.options[selectElement.options.length] = option;
				}
			}
		}
		xhr.open("GET", "<c:url value='/FriendsaAll.json' />", true);
		xhr.send();
		// 定義select標籤的change事件處理函數
		selectElement.onchange = function(){
			xhr2.onreadystatechange = function() {
				if (xhr2.readyState == 4 && xhr2.status == 200) {
					var singleFriend = JSON.parse(xhr2.responseText);
					displayPageFriends(Friends);
				}
			}
			//使用者挑選的書籍之主鍵值是存放在
			//selectElement.options[ selectElement.selectedIndex ].value中
			var memberId = selectElement.options[ selectElement.selectedIndex ].value;
			// 定義open方法
			xhr2.open("GET", "<c:url value='/Friends.Json' />" 
							+ "?memberId=" + memberId, true);
			// 送出請求
			xhr2.send();
		}
		
		function displayFriends(Friends){
			var content = "<table border='1'  bgcolor='#fbdb98'>";
			content += "<tr><td width='80'>好友帳號</td><td width='380'>" + Friends.friendaccount + "</td>";
			content += "<td rowspan='4'><img width='80' height='120' src='../../ch00/util/GetImage?no=" + Friends.memberId + "'></td></tr>";
			content += "<tr><td>作者</td><td>" + Friends.friendmail + "</td></tr>";						
			content += "<tr><td>價格</td><td>" + Friends.friendnickname + "</td></tr>";
			content += "<tr><td>ID</td><td>" + Friends.friendId + "</td></tr>";
			content += "</table>";
			friendarea.innerHTML = content;
		}		
		
	</script>
	<hr>
	<a href='..' >回前頁</a>
	</div>
	
</body>
</html>