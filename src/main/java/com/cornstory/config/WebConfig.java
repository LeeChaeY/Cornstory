package com.cornstory.config;

import com.cornstory.common.web.LogonCheckInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

//===================== 추가된 Class  ======================//
// Interceptor 등록하는 WebMvcCongigurer 구현 Bean
//=======================================================//
@Configuration
public class WebConfig implements WebMvcConfigurer {

    ///Field
	@Autowired
    private LogonCheckInterceptor logonCheckInterceptor;

	public WebConfig() {
		System.out.println("==> WebConfig default Constructor call.............");
	}

    @Override
    public void addInterceptors(InterceptorRegistry registry) {

        // URL Pattern 을 확인하고. interceptor 적용유무 등록함.
        System.out.println("WebConfig");
        String[] excludePatterns = {"/user/login", "/user/addUser",
                "/work/listWork", "/work/getDetailWork", "/episode/getEpisode",
                "/support/listSupport", "/support/getSupport", "/product/listProduct",
                "/story/listStory", "/story/getStory"};
        registry.addInterceptor( logonCheckInterceptor )
                .addPathPatterns("/*/*")
                .excludePathPatterns(excludePatterns);


    }

}

