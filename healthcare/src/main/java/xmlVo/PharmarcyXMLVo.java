package xmlVo;

import java.util.Arrays;

public class PharmarcyXMLVo {
	private String dutyAddr; // 주소
	private String dutyName; // 이름
	private String dutyTel;// 전화번호
	private String[][] dutyTime;// 요일 별 시간
								// 0 시작, 1 끝
	private String hpid; // 기관 id
	private String wgs84Lat; // lattitude 위도
	private String wgs84Lon; // longitude 경도


	public PharmarcyXMLVo(String dutyAddr, String dutyName, String dutyTel, String[][] dutyTime, String hpid,
			String wgs84Lat, String wgs84Lon) {
		super();
		this.dutyAddr = dutyAddr;
		this.dutyName = dutyName;
		this.dutyTel = dutyTel;
		this.dutyTime = dutyTime;
		this.hpid = hpid;
		this.wgs84Lat = wgs84Lat;
		this.wgs84Lon = wgs84Lon;
	}

	public String getDutyAddr() {
		return dutyAddr;
	}

	public void setDutyAddr(String dutyAddr) {
		this.dutyAddr = dutyAddr;
	}

	public String getDutyName() {
		return dutyName;
	}

	public void setDutyName(String dutyName) {
		this.dutyName = dutyName;
	}

	public String getDutyTel() {
		return dutyTel;
	}

	public void setDutyTel(String dutyTel) {
		this.dutyTel = dutyTel;
	}


	public String[][] getDutyTime() {
		return dutyTime;
	}

	public void setDutyTime(String[][] dutyTime) {
		this.dutyTime = dutyTime;
	}

	public String getHpid() {
		return hpid;
	}

	public void setHpid(String hpid) {
		this.hpid = hpid;
	}

	public String getWgs84Lat() {
		return wgs84Lat;
	}

	public void setWgs84Lat(String wgs84Lat) {
		this.wgs84Lat = wgs84Lat;
	}

	public String getWgs84Lon() {
		return wgs84Lon;
	}

	public void setWgs84Lon(String wgs84Lon) {
		this.wgs84Lon = wgs84Lon;
	}

	@Override
	public String toString() {
		return "PharmarcyXMLVo [dutyAddr=" + dutyAddr + ", dutyName=" + dutyName + ", dutyTel=" + dutyTel
				+ ", dutyTime=" + Arrays.toString(dutyTime) + ", hpid=" + hpid + ", wgs84Lat=" + wgs84Lat
				+ ", wgs84Lon=" + wgs84Lon + "]";
	}

	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		if(this == obj) return true;
		if(obj == null || getClass() != obj.getClass()) return false;
		PharmarcyXMLVo vo = (PharmarcyXMLVo) obj;
		if(vo.getHpid().equals(this.hpid)) return true;
		else {
			return false;
		}
	}

	

}
