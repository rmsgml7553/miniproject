package selfcheck;


import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import conn.DBConnect;


public class SelfCheckDao {

	private DBConnect dbconn;
	
	public SelfCheckDao() {
		dbconn = DBConnect.getInstance();
	}
	
	public void insert(SelfCheckVo vo) {
		Connection conn = dbconn.conn();
		String sql = "insert into selfcheck values(?, sysdate, ?, ?, ?, ?,?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
//			private String id; 
//			private Date chDate; // 체크날짜
//			private int height; 
//			private int weight;
//			private double bmr; //기초대사량
//			private double amr; //활동대사량
//			private double bmi;  //비만지수
//			private double stress; //스트레스
			pstmt.setString(1, vo.getId());
			pstmt.setInt(2, vo.getHeight());
			pstmt.setInt(3, vo.getWeight());
			pstmt.setDouble(4, vo.getBmr());
			pstmt.setDouble(5, vo.getAmr());
			pstmt.setDouble(6, vo.getBmi());
			pstmt.setDouble(7, vo.getStress());
			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public ArrayList<SelfCheckVo> selectDate(String id){
		Connection conn = dbconn.conn();
		ArrayList<SelfCheckVo> list = new ArrayList<>();
		String sql = "select chDate from selfcheck where id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new SelfCheckVo(rs.getString(1),rs.getDate(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getInt(8)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public ArrayList<SelfCheckVo> selectWeight(String id){
		Connection conn = dbconn.conn();
		ArrayList<SelfCheckVo> list = new ArrayList<>();
		String sql = "select weight from selfcheck where id=? order by chDate desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				list.add(new SelfCheckVo(rs.getString(1),rs.getDate(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getInt(8)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	public ArrayList<SelfCheckVo> selectHeight(String id){
		Connection conn = dbconn.conn();
		ArrayList<SelfCheckVo> list = new ArrayList<>();
		String sql = "select height from selfcheck where id=? order by chDate desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				list.add(new SelfCheckVo(rs.getString(1),rs.getDate(2),rs.getInt(3),rs.getInt(4),rs.getInt(5),rs.getInt(6),rs.getInt(7),rs.getInt(8)));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return list;
	}
	
	public SelfCheckVo selectSelfcheck(String id){
		Connection conn = dbconn.conn();
		SelfCheckVo vo = null;
		String sql = "select bmr, amr, bmi, stress from selfcheck where id=? order by chDate desc";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new SelfCheckVo(id, null, 0, 0, rs.getDouble(1), rs.getDouble(2), rs.getDouble(3), rs.getDouble(4));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return vo;
	}
	
	
}
