package com.cornstory;

import com.cornstory.domain.EpisodeComment;
import com.cornstory.service.episode.EpisodeCommentService;
import com.cornstory.service.episode.EpisodeService;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

import com.cornstory.domain.Episode;
import com.cornstory.service.episode.EpisodeDao;

import static org.junit.jupiter.api.Assertions.*;

@SpringBootTest
class EpisodeTests {

	@Autowired
	private EpisodeService episodeService;

	@Autowired
	private EpisodeCommentService episodeCommentService;

	//@Test
	public void testGetEpisodeById() {
		// EpisodeDao의 getEpisodeById 메소드를 테스트하는 코드 작성
		int episodeNo = 10002; // 존재하는 에피소드 번호로 변경
		Episode episode = episodeService.getEpisodeById(episodeNo);

		// 에피소드가 null이 아닌지 확인
		//assertNotNull(episode);

		// 확인을 위해 에피소드 정보 출력
		System.out.println(episode.toString());
	}

	// 나머지 테스트 메서드는 필요에 따라 주석 해제하여 사용하세요.

	//	@Test
	public void testAddEpisode() {
		// EpisodeDao의 addEpisode 메소드를 테스트하는 코드 작성
		Episode newEpisode = new Episode();

		// 필요한 필드 값을 적절히 설정
		newEpisode.setWorkNo(10003); // 예시로 workNo를 1로 설정
		newEpisode.setEpisodeName("New Episode");
		newEpisode.setEpisodeOrder(2);
		newEpisode.setEThumbnail("new_thumbnail.jpg");
		//newEpisode.setEpisodeDate(new Date()); // 예시로 현재 날짜로 설정
		newEpisode.setFileName("new_file.mp4");
		newEpisode.setDirectory("/path/to/new/episode");

		episodeService.addEpisode(newEpisode);

		// 새로 추가된 에피소드의 ID 확인
		System.out.println("New Episode ID: " + newEpisode.getEpisodeNo());

		// 필요에 따라 추가 확인 로직을 작성할 수 있습니다.
		// 예를 들어, 데이터베이스에서 해당 ID로 에피소드를 조회하여 확인할 수 있습니다.
		Episode retrievedEpisode = episodeService.getEpisodeById(newEpisode.getEpisodeNo());
		assertNotNull(retrievedEpisode);
		System.out.println("Retrieved Episode: " + retrievedEpisode.toString());
	}

	//@Test
	public void testUpdateEpisode() {
		// EpisodeDao의 updateEpisode 메소드를 테스트하는 코드 작성
		int episodeNo = 10006;
		Episode updatedEpisode = episodeService.getEpisodeById(episodeNo);
		System.out.println(updatedEpisode);
		// 업데이트하고자 하는 필드 값을 적절히 변경
		updatedEpisode.setEpisodeName("Updated Episode Name");
		updatedEpisode.setEpisodeOrder(3);
		updatedEpisode.setEThumbnail("updated_thumbnail.jpg");
		// 다른 필드들도 필요에 따라 업데이트

		// episodeDao.updateEpisode 메소드를 호출하여 업데이트
		episodeService.updateEpisode(updatedEpisode);

		// 업데이트된 에피소드 확인
		Episode retrievedEpisode = episodeService.getEpisodeById(episodeNo);
		System.out.println("Updated Episode: " + retrievedEpisode.toString());
	}

	//@Test
	public void testDeleteEpisode() {
		// EpisodeDao의 deleteEpisode 메소드를 테스트하는 코드 작성
		int episodeNo = 10006; // 삭제하고자 하는 에피소드 번호로 변경
		episodeService.deleteEpisode(episodeNo);
	}

	//@Test
	public void testListEpisodes() {
		//EpisodeDao의 listEpisodes 메소드를 테스트하는 코드 작성
		System.out.println("1");
		List<Episode> episodeList = episodeService.listEpisode();
		for (Episode episode : episodeList) {
			System.out.println(episode);
		}
	}
	//@Test
	public void testgetWorkEpisodes(){
		System.out.println("1");
		int workNo = 10002;
		List<Episode> episodeList = episodeService.getWorkEpisode(workNo);
		for (Episode episode : episodeList) {
			System.out.println(episode);
		}
	}


	//@Test
	public void testAddEpisodeComment() throws Exception {
		// Add a new EpisodeComment
		EpisodeComment newComment = new EpisodeComment();
		newComment.setEpisodeNo(1);
		newComment.setWorkNo(1);
		newComment.setUserId("testUser");
		newComment.setEContent("Test comment content");

		episodeCommentService.addEpisodeComment(newComment);

		// Get the added EpisodeComment
		EpisodeComment retrievedComment = episodeCommentService.getEpisodeCommentById(newComment.getECommentNo());

		// Verify that the retrieved comment is not null
		assertNotNull(retrievedComment);

		// Verify that the content matches
		assertEquals(newComment.getEContent(), retrievedComment.getEContent());
	}

	@Test
	public void testGetEpisodeCommentById() throws Exception {
		// Add a new EpisodeComment
		EpisodeComment newComment = new EpisodeComment();
		newComment.setECommentNo(10003);
		// Get the added EpisodeComment
		EpisodeComment retrievedComment = episodeCommentService.getEpisodeCommentById(10003);
		System.out.println(retrievedComment);
		// Verify that the retrieved comment is not null
		//assertNotNull(retrievedComment);

		// Verify that the content matches
		//assertEquals(newComment.getEContent(), retrievedComment.getEContent());
	}



	//@Test
	public void testUpdateEpisodeComment() throws Exception {
		// Add a new EpisodeComment
		EpisodeComment newComment = new EpisodeComment();
		newComment.setEpisodeNo(1);
		newComment.setWorkNo(1);
		newComment.setUserId("testUser");
		newComment.setEContent("Updated comment content");

		// Update the EpisodeComment
		episodeCommentService.updateEpisodeComment(newComment);

		// Get the updated EpisodeComment
		EpisodeComment updatedComment = episodeCommentService.getEpisodeCommentById(newComment.getECommentNo());

		// Verify that the content is updated
		assertEquals(newComment.getEContent(), updatedComment.getEContent());
	}

	//@Test
	public void testDeleteEpisodeComment() throws Exception {
		episodeCommentService.deleteEpisodeComment(1); // Assuming 1 is a valid eCommentNo

		// Attempt to get the deleted EpisodeComment should not throw an exception
		assertThrows(EmptyResultDataAccessException.class, () -> episodeCommentService.getEpisodeCommentById(1));
	}







}
