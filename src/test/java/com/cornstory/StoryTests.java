package com.cornstory;

import com.cornstory.domain.Story;
import com.cornstory.domain.StoryComment;
import com.cornstory.service.story.StoryCommentDao;
import com.cornstory.service.story.StoryDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

import java.util.List;

@SpringBootTest
class StoryTests {

	@Autowired
	private StoryDao storyDao;

	@Autowired
	private StoryCommentDao storyCommentDao;

	//@Test
	public void testGetStoryById() {
		int storyNo = 10011; // 존재하는 스토리 번호로 변경
		Story story = storyDao.getStory(storyNo);

		System.out.println("Story by ID: " + story);
	}

	//@Test
	public void testAddStory() {
		Story newStory = new Story();
		newStory.setUserId("user001");
		newStory.setStoryName("Test Story");
		newStory.setStoryContent("This is a test story.");

		storyDao.addStory(newStory);

		System.out.println("Added Story: " + newStory);
	}

	//@Test
	public void testUpdateStory() {
		int storyNo = 10016;
		Story updatedStory = storyDao.getStory(storyNo);

		updatedStory.setStoryName("Updated Test Story");
		updatedStory.setStoryContent("This story has been updated.");

		storyDao.updateStory(updatedStory);
	}

	//@Test
	public void testDeleteStory() {
		int storyNo = 10016;
		storyDao.deleteStory(storyNo);

		Story deletedStory = storyDao.getStory(storyNo);

		System.out.println("Deleted Story: " + deletedStory);
	}

	//@Test
	public void testListStories() {
		List<Story> storyList = storyDao.listStory();
		for (Story story : storyList) {
			System.out.println(story);
		}
	}

	//@Test
	public void testMyStory() {
		String userId= "user001";
		List<Story> storyList = storyDao.getMyStory(userId);
		for (Story story : storyList) {
			System.out.println(story);
		}
	}


	//@Test
	public void testAddComment() {
		StoryComment comment = new StoryComment();
		comment.setStoryNo(10014);
		comment.setUserId("user001");
		comment.setsContent("Test Comment");

		storyCommentDao.addComment(comment);
	}

	//@Test
	public void testUpdateComment() {
		StoryComment comment = new StoryComment();
		comment.setsCommentNo(1);  // Existing comment number to update
		comment.setStoryNo(1);
		comment.setUserId("testUser");
		comment.setsContent("Updated Comment");

		storyCommentDao.updateComment(comment);
	}

	//@Test
	public void testDeleteComment() {
		int commentNo = 1;  // Existing comment number to delete

		storyCommentDao.deleteComment(commentNo);
	}

	//@Test
	public void testListStoryComments() {
		int storyNo = 10014;  // Existing story number

		List<StoryComment> comments = storyCommentDao.listStoryComments(storyNo);
		for (StoryComment comment : comments) {
			System.out.println(comment);
		}
	}

}
