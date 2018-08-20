package board.bean;

import lombok.Data;

@Data
public class BoardDTO {
	private String seq;
	private String subject;
	private String name;
	private String content;
	private String logtime;
}
