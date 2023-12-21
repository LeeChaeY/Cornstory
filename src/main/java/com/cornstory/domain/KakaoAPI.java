package com.cornstory.domain;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.google.gson.JsonPrimitive;

public class KakaoAPI {


    public String getAccessToken(String code) {
        String accessToken = "";
        String refreshToken = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=a6407828773e6948b77603d6ce3ae02d");
            sb.append("&redirect_uri=http://cornstory.com/user/slogin");
            sb.append("&code="+code);

            bw.write(sb.toString());
            bw.flush();

            int responseCode = conn.getResponseCode();
            System.out.println("response code = " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";
            while((line = br.readLine())!=null) {
                result += line;
            }
            System.out.println("response body="+result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            accessToken = element.getAsJsonObject().get("access_token").getAsString();
            refreshToken = element.getAsJsonObject().get("refresh_token").getAsString();

            br.close();
            bw.close();
        }catch (Exception e) {
            e.printStackTrace();
        }
        return accessToken;
    }


    public HashMap<String, Object> getUserInfo(String accessToken) {
        HashMap<String, Object> userInfo = new HashMap<String, Object>();
        String reqUrl = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqUrl);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode  토큰 받은 후 2차 처리 =" + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line = "";
            String result = "";

            while((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body 토큰 받은 후 2차 처리 ="+result);

            JsonParser parser = new JsonParser();
            JsonElement element =  parser.parse(result);

            JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakaoAccount = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
            JsonElement idObject = element.getAsJsonObject().get("id");
            JsonPrimitive id = idObject.getAsJsonPrimitive();
            String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakaoAccount.getAsJsonObject().get("email").getAsString();

            userInfo.put("nickname", nickname);
            userInfo.put("email", email);
            userInfo.put("id", id);
            System.out.println("id==="+id);


        } catch (Exception e) {
            e.printStackTrace();
        }
        return userInfo;
    }


    public void kakaoLogout(String accessToken) throws Exception {
        String reqURL = "https://kapi.kakao.com/v1/user/logout";

        //https://kauth.kakao.com/oauth/logout 카카오 계정과 함께 로그아웃
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + accessToken);
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded"); // 추가: Content-Type 설정
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode = " + responseCode);

            if (responseCode == HttpURLConnection.HTTP_OK) {
                // 정상적으로 로그아웃 처리된 경우
                System.out.println("Logout successful");
            } else {
                // 에러 응답 처리
                BufferedReader br = new BufferedReader(new InputStreamReader(conn.getErrorStream()));
                StringBuilder errorResponse = new StringBuilder();
                String line;

                while ((line = br.readLine()) != null) {
                    errorResponse.append(line);
                }

                br.close();
                System.out.println("Error response: " + errorResponse.toString());
            }
        } catch (IOException e) {
            e.printStackTrace();
            System.out.println("Error during logout: " + e.getMessage());
        }
    }
}