package kr.spring.board.vo;

import java.sql.Date;

import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	private long boa_num;
	private long mem_num;
	private long item_num;
	@NotBlank
	private String boa_category;
	@NotBlank
	@Size(max = 50, message = "제목은 최대 50자까지 입력 가능합니다")
	private String boa_title;
	@NotEmpty
	private String boa_content;
	private int boa_hit;
	private Date boa_rdate;
	private Date boa_mdate;
	private int boa_auth;
	private MultipartFile upload;
	private String filename;



	private String mem_email;
	private String mem_nickname;
	private Integer mem_auth;
	private String item_name;

	private int re_cnt;
	private int fav_cnt;

}
