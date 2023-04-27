package board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import conn.DBConnect;

//private int num;
//private String id;
//private String title;
//private String content;
//private int cnt;
//private String path;
//private Date w_date;

public class BoardDao {
	private DBConnect dbconn;
	
	public BoardDao() {
		dbconn = DBConnect.getInstance();
	}
	
	// 1. 원글 모두 보여주기.
		public ArrayList<BoardVo> selectAll() {
			Connection conn = dbconn.conn();
			String sql = "select * from board order by num desc"; // parent=0은 무슨뜻? 아마 댓글은 제외하고 보여준다고 하는듯.
			ArrayList<BoardVo> list = new ArrayList<>();
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery(); // 실행 결과를 rs에 담는다.
				while (rs.next()) {
					list.add(new BoardVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6),rs.getDate(7)));
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
			return list;
		}
		
		
	// 2. insert
		public void insert(BoardVo vo) {
			Connection conn = dbconn.conn();
			
			String sql = "insert into board values(seq_board.nextval, ?, ?, ?, ?, ?, sysdate)";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, vo.getId());
				pstmt.setString(2, vo.getTitle());
				pstmt.setString(3, vo.getContent());
				pstmt.setInt(4, vo.getCnt());
				pstmt.setString(5, vo.getPath());
				int num = pstmt.executeUpdate();
				System.out.println(num + " 줄이 추가되었다.");
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
		
	// 3. delete	
		public void delete(int num) {
			Connection conn = dbconn.conn();
			String sql = "delete from board where num = ?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				int x = pstmt.executeUpdate();
				System.out.println(x + " 줄이 삭제되었다.");
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
		
		//4 조회수
		public void updateCnt(int num) {
			Connection conn = dbconn.conn();
			String sql = "update board set cnt=cnt+1 where b_num=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				
				int num1 = pstmt.executeUpdate();
				System.out.println(num1 + " 줄이 수정됨");
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
		
	// id로 검색
		public BoardVo select(BoardVo vo) {
			Connection conn = dbconn.conn();
			String sql = "select * from board";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					vo = new BoardVo(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getDate(7));
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
			return vo;
		}
		
		// 숫자로 검색
		public BoardVo selectNum(int num) {
			BoardVo vo = null;
			Connection conn = dbconn.conn();
			String sql = "select * from board where num=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, num);
				ResultSet rs = pstmt.executeQuery();
				if(rs.next()) {
					vo = new BoardVo(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5), rs.getString(6), rs.getDate(7));
				}
//				System.out.println(vo);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return vo;
		}
		
		// 조회수 증가
		public void cnt(int num) {
			Connection conn = dbconn.conn();
			String sql = "update board set cnt = cnt + 1 where num=?";
			try {
				PreparedStatement pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1,num);
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
		
}
