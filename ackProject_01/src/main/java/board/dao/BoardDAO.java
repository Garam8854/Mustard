package board.dao;

import java.util.List;
import java.util.Map;

import board.bean.BoardDTO;

public interface BoardDAO {

	int getTotalA(int startNum, int endNum);

	List<BoardDTO> boardList(int startNum, int endNum);

	void boardWrite(Map<String, String> map);

	BoardDTO boardView(Map<String, Object> map);

	void boardUpdate(Map<String, Object> map);

	void boardDelete(Map<String, Object> map);

}
