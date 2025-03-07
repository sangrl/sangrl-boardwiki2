package kr.spring.stream.service;

import kr.spring.stream.vo.StreamKeyVO;

public interface StreamKeyService {
    StreamKeyVO findByStreamKey(Long mem_num);

	StreamKeyVO findByUsername(Long mem_num);

	StreamKeyVO selectstream(Long str_key);

	Integer streamingNumber(long mem_num);

	Integer streamingNum(Long str_num);
	
	void save(StreamKeyVO str_Key);
}