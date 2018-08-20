package board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import board.bean.BoardDTO;

@Component
@Transactional
public class BoardDAOMybatis implements BoardDAO{
	
	@Autowired
	private SqlSession sqlSession;
	
	public int getTotalA(int startNum, int endNum) {
		return  sqlSession.selectOne("boardSQL.getTotalA");
	}

	public List<BoardDTO> boardList(int startNum, int endNum) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startNum", startNum);
		map.put("endNum", endNum);
		List<BoardDTO> list = sqlSession.selectList("boardSQL.boardList",map);
		return list;
	}
	public void boardWrite(Map<String, String> map) {
		sqlSession.insert("boardSQL.boardWrite",map);
	}

	public BoardDTO boardView(Map<String, Object> map) {
		map.put("iseq", Integer.parseInt((String) map.get("seq")));
		return sqlSession.selectOne("boardSQL.boardView",map);
	}

	public void boardUpdate(Map<String,Object> map) {
		map.put("iseq", Integer.parseInt((String) map.get("seq")));
		map.put("ipg", Integer.parseInt((String) map.get("pg")));
		sqlSession.update("boardSQL.boardUpdate", map);
	}

	public void boardDelete(Map<String, Object> map) {
		System.out.println("");
		map.put("iseq", Integer.parseInt((String) map.get("seq")));
		map.put("ipg", Integer.parseInt((String) map.get("pg")));
		sqlSession.delete("boardSQL.boardDelete", map);
	}

}