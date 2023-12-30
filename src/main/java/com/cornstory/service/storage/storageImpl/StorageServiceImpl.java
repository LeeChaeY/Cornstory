package com.cornstory.service.storage.storageImpl;

import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.model.CannedAccessControlList;
import com.amazonaws.services.s3.model.PutObjectRequest;
import com.cornstory.service.storage.StorageService;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

@Service
public class StorageServiceImpl implements StorageService {

    private final AmazonS3 s3Client;

    public StorageServiceImpl(AmazonS3 s3Client) {
        this.s3Client = s3Client;
    }



    @Override
    public String uploadFileToS3(String bucketName, String keyName, MultipartFile file) throws Exception {
        File fileObj = convertMultiPartFileToFile(file);

        PutObjectRequest putObjectRequest = new PutObjectRequest(bucketName, keyName, fileObj)
                .withCannedAcl(CannedAccessControlList.PublicRead); // 공개 읽기 권한 설정

        s3Client.putObject(putObjectRequest);
        fileObj.delete(); // 임시 파일 삭제

        // 클라우드 스토리지에 업로드된 파일의 URL 반환
        return s3Client.getUrl(bucketName, keyName).toString();
    }

    private File convertMultiPartFileToFile(MultipartFile multipartFile) throws IOException {
        File convertedFile = new File(System.getProperty("java.io.tmpdir") + System.getProperty("file.separator")
                + multipartFile.getOriginalFilename());
        convertedFile.createNewFile();
        try (var fos = new FileOutputStream(convertedFile)) {
            fos.write(multipartFile.getBytes());
        }
        return convertedFile;
    }

    @Override
    public void deleteFileFromS3(String bucketName, String fileKey) throws Exception {
        s3Client.deleteObject(bucketName, fileKey);
    }

}
