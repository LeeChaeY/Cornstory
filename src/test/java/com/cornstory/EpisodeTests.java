package com.cornstory;

import com.cornstory.domain.EpisodeComment;
import com.cornstory.service.episode.EpisodeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;


import java.util.List;

import com.cornstory.domain.Episode;

@SpringBootTest
class EpisodeTests {

	@Autowired
	private EpisodeService episodeService;

	//@Test
	public void testGetEpisodeById() {
		int episodeNo = 10002; // 존재하는 에피소드 번호로 변경
		Episode episode = episodeService.getEpisode(episodeNo);

		System.out.println(episode.toString());
	}

	//@Test
	public void testAddEpisode() {
		Episode newEpisode = new Episode();

		newEpisode.setWorkNo(10003);
		newEpisode.setEpisodeName("New Episode");
		newEpisode.setEpisodeOrder(3);
		newEpisode.setEThumbnail("new_thumbnail.jpg");
		newEpisode.setFileName("new_file.mp4");
		newEpisode.setDirectory("/path/to/new/episode");

		episodeService.addEpisode(newEpisode);

		System.out.println("New Episode ID: " + newEpisode.getEpisodeNo());
	}

	//@Test
	public void testUpdateEpisode() {
		int episodeNo = 10007;
		Episode updatedEpisode = episodeService.getEpisode(episodeNo);
		System.out.println(updatedEpisode);

		updatedEpisode.setEpisodeName("Updated Episode Name");
		updatedEpisode.setEpisodeOrder(777);
		updatedEpisode.setEThumbnail("updated_thumbnail.jpg");

		episodeService.updateEpisode(updatedEpisode);

	}

	//@Test
	public void testDeleteEpisode() {
		// EpisodeDao의 deleteEpisode 메소드를 테스트하는 코드 작성
		int episodeNo = 10007; // 삭제하고자 하는 에피소드 번호로 변경
		episodeService.deleteEpisode(episodeNo);
	}

	//@Test
	public void testListEpisodes() {

		int workNo=10002;
		List<Episode> episodeList = episodeService.listEpisode(workNo);
		for (Episode episode : episodeList) {
			System.out.println(episode);
		}
	}



	//@Test
	public void testAddEpisodeComment() throws Exception {
		// Add a new EpisodeComment
		EpisodeComment newComment = new EpisodeComment();
		newComment.setEpisodeNo(10002);
		newComment.setWorkNo(10002);
		newComment.setUserId("user001");
		newComment.setEContent("Test comment content");

		episodeService.addEpisodeComment(newComment);


	}

	//@Test
	public void testGetEpisodeCommentById() throws Exception {

		List<EpisodeComment> retrievedComment = episodeService.listEpisodeComment(10002);
		for (EpisodeComment episodeComment : retrievedComment) {
			System.out.println(episodeComment);
		}

	}



	//@Test
	public void testUpdateEpisodeComment() throws Exception {
		EpisodeComment newComment = new EpisodeComment();
		newComment.setECommentNo(10006);
		newComment.setEContent("Updated comment content");

		episodeService.updateEpisodeComment(newComment);
	}
	//@Test
	public void testDeleteEpisodeComment() throws Exception {
		episodeService.deleteEpisodeComment(10006);

	}







}
