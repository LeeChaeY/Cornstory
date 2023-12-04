package com.cornstory.service.chat;

import com.cornstory.domain.Chat;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.mongodb.core.mapping.event.AbstractMongoEventListener;
import org.springframework.data.mongodb.core.mapping.event.BeforeConvertEvent;
import org.springframework.stereotype.Component;

// MongoDB 에서는 Sequence 를 지원하지 않기 때문에, Sequence 를 구현하기 위한 Listener 를 생성한다.
// 시퀀스를 자동으로 생성해서 부여하기 위한 이벤트 리스너
@Component
public class ChatListener extends AbstractMongoEventListener<Chat> {

    @Autowired
    private SequenceGeneratorService generatorService;

        @Override
        public void onBeforeConvert(BeforeConvertEvent<Chat> event) {
            // Chat 객체의 chatNo 에 시퀀스를 부여한다.
            event.getSource().setChatNo(generatorService.generateSequence(Chat.SEQUENCE_NAME));
        }

}
