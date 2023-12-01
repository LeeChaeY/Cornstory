package com.cornstory;

import com.cornstory.common.Search;
import com.cornstory.domain.ChatSpace;
import com.cornstory.service.chat.ChatService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@SpringBootTest
class ChatTests {

	@Autowired
	private ChatService chatService;

	
//	@Test
	void contextLoads() {
//		ChatSpace chatSpaceInsert1 = new ChatSpace("test01", "채팅방1", "chat1.jpg", "액션");


//		System.out.println(" dddddddddddd");
		try {
			//////////////////////////////////////////////////////////////////////////////
//			C
			//////////////////////////////////////////////////////////////////////////////
//			chatService.addChatSpace(chatSpaceInsert1);


			//////////////////////////////////////////////////////////////////////////////
//			R
			//////////////////////////////////////////////////////////////////////////////
//			ChatSpace chatSpace = chatService.getChatSpace(10001);
//			System.out.println(chatSpace);



			//////////////////////////////////////////////////////////////////////////////
//			U
			//////////////////////////////////////////////////////////////////////////////
//			ChatSpace chatSpaceUpdate1 = new ChatSpace(10001, "10001 채팅방1", "chatSpace.jpg");
//			ChatSpace chatSpaceUpdate2 = new ChatSpace(10001, 1);

//			chatService.updateChatSpace(chatSpaceUpdate1);
//			chatService.updateChatSpace(chatSpaceUpdate2);

			//////////////////////////////////////////////////////////////////////////////
//			D
			//////////////////////////////////////////////////////////////////////////////
//			chatService.deleteChatSpace(10004);



			//////////////////////////////////////////////////////////////////////////////
//			L
			//////////////////////////////////////////////////////////////////////////////
//			채팅방 목록
//			Search search = new Search();

//			search.setSearchKeyword("일상");
//			search.setSearchCondition("0");

//			search.setSearchKeyword("채팅방");
//			search.setSearchCondition("1");

//			search.setPageSize(3);
//			search.setCurrentPage(1);
//			Map<String,Object> map = chatService.listChatSpace(search, "");
//			System.out.println(map);
//			System.out.println(((List)map.get("list")).size());


//			나의 채팅방 목록
//			Search search = new Search();
//
//			search.setSearchKeyword("일상");
//			search.setSearchCondition("0");
//
//			search.setSearchKeyword("채팅방");
//			search.setSearchCondition("1");
//
//			search.setPageSize(3);
//			search.setCurrentPage(1);
//			Map<String,Object> map = chatService.listChatSpace(search, "test1");
//			System.out.println(map);
//			System.out.println(((List)map.get("list")).size());





			//////////////////////////////////////////////////////////////////////////////
//			C
			//////////////////////////////////////////////////////////////////////////////

//			ChatSpace chatSpaceInsert2 = new ChatSpace(10003, "test01");
//			chatService.addChatEnter(chatSpaceInsert2);

			//////////////////////////////////////////////////////////////////////////////
//			D
			//////////////////////////////////////////////////////////////////////////////
//
//			Map<String, Object> map = new HashMap<String, Object>();
//			map.put("chatSpaceNo", 10003);
//			map.put("userId", "test01");
//			chatService.deleteChatEnter(map);

			//////////////////////////////////////////////////////////////////////////////
//			L
			//////////////////////////////////////////////////////////////////////////////
//			채팅방 회원 목록
			Search search = new Search();

			search.setPageSize(3);
			search.setCurrentPage(1);

			Map<String,Object> map = chatService.listChatEnterUser(search, 10001);
			System.out.println(map);
			System.out.println(((List)map.get("list")).size());

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

}
