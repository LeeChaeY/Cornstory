package com.cornstory.service.chat;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

@Document(collection = "auto_sequence")
public class AutoIncrementSequence {

    // mySQL에서 auto_increment와 같은 역할을 하는 sequence를 만들기 위한 클래스
    // MongoDB에서 db.auto_sequence.insert({ _id: 'auto_sequence', seq: 9999 })
    // 초기값을 인텔리제이에서 설정하는 방법을 못찾아서 일단은 직접 넣어줌

    @Id
    private String id;      // seq_name
    private Long seq;       // auto_increment되는 값, 1씩 증가되는 값

    public AutoIncrementSequence() {
    }

    public AutoIncrementSequence(String id, Long seq) {
        this.id = id;
        this.seq = seq;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Long getSeq() {
        return seq;
    }

    public void setSeq(Long seq) {
        this.seq = seq;
    }
}
