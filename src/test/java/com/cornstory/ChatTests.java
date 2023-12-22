package com.cornstory;

import com.cornstory.common.Search;
import com.cornstory.service.chat.ChatDao;
import com.cornstory.service.chat.ChatService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class ChatTests {

	@Autowired
	private ChatService chatService;

	@Autowired
	private ChatDao chatDao;

//	@Autowired
//	private ChatRepository chatRepository;

	
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
//			Search search = new Search();
//
//			search.setPageSize(3);
//			search.setCurrentPage(1);
//
//			Map<String,Object> map = chatService.listChatEnterUser(search, 10001);
//			System.out.println(map);
//			System.out.println(((List)map.get("list")).size());

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

//	@Test
	void chatTest() {
//		Chat chat = new Chat(10001, "test1", "안녕하세요!", "2023-12-03", "");

		try {
//			chatService.addChat(chat);

//			chatService.deleteChat((long) 10000);

			Search search = new Search();
//
			search.setPageSize(3);
			search.setCurrentPage(1);

//			System.out.println(chatService.listChat(10001, "2020-12-01", "2023-12-31"));

		} catch (Exception e) {
			throw new RuntimeException(e);
		}
	}

//	@Test
	void cc() {
//		ChatSpace chatSpace = new ChatSpace();
//		chatSpace.setChatSpaceNo(10009);
//		chatSpace.setcSpaceUserCnt(-1);
//		System.out.println(chatSpace);
		try {
//			chatDao.updateChatSpace(chatSpace);
		} catch (Exception e) {
			throw new RuntimeException(e);
		}

	}

}
