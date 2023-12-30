package com.cornstory.service.storage;

import org.springframework.web.multipart.MultipartFile;

import java.io.File;

public interface StorageService {
    String uploadFileToS3(String bucketName, String keyName, MultipartFile file) throws Exception;

    void deleteFileFromS3(String bucketName, String fileKey) throws Exception;
}
