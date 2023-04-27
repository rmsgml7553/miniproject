package like_board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import conn.DBConnect;

public class Like_BoardDao {
  private DBConnect dbconn;
  
  public Like_BoardDao() {
	  dbconn = DBConnect.getInstance();
  }
	
  
	//클릭시 num=1 또는 -1으로 만듬. 
	public void click(int num) {
		Connection conn = dbconn.conn();
		String sql = "update like_board set num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	// 좋아요 총 수를 표시하는 sql
	// select count(*) from like_board where num = 1;
	public int selectByNum(int num) {
		Connection conn = dbconn.conn();
		String sql = "select count(*) from like_board where num = ?";
		int count = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) { // 행에 값이 있으면 true. 행 단위로 표시함.
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return count;
	}
	
	
	public boolean selectByLike(Like_BoardVo vo) {
		Connection conn = dbconn.conn();
		String sql = "select * from like_board where num = ? and id = ?";
		int count = 0;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getId());
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				return false; 
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return true; 
	}
	
	
	// 아이디로 검색
	public Like_BoardVo selectId(String id) {
		Connection conn = dbconn.conn();
		String sql = "select * from like_board where id=?";
		Like_BoardVo vo = null;
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			
			while(rs.next()) {
				vo = new Like_BoardVo(rs.getInt(1), rs.getString(2));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return vo;
	}
	
	// id를 넣는것.
	public void insertId(String id) {
		Connection conn = dbconn.conn();
		String sql = "insert into like_board where id=? ";
		try {
			PreparedStatement pstmt= conn.prepareStatement(sql);
			pstmt.setString(1, id);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	
	//insert
	public void insert(Like_BoardVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into like_board values(?, ?) ";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getNum());
			pstmt.setString(2, vo.getId());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	// delete
	public void delete(int num) {
		Connection conn = dbconn.conn();
		String sql = "delete * from like_board where num = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
}
