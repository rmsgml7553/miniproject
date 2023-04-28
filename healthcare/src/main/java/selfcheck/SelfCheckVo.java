package selfcheck;

import java.sql.Date;

public class SelfCheckVo {
	private String id; 
	private Date chDate; // 체크날짜
	private int height; 
	private int weight;
	private double bmr; //기초대사량
	private double amr; //활동대사량
	private double bmi;  //비만지수
	private double stress; //스트레스
	
	public SelfCheckVo() {};
	
	public SelfCheckVo(String id, Date chDate, int height, int weight, double bmr, double amr, double bmi, double stress) {
		super();
		this.id = id;
		this.chDate = chDate;
		this.height = height;
		this.weight = weight;
		this.bmr = bmr;
		this.amr = amr;
		this.bmi = bmi;
		this.stress = stress;
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getChDate() {
		return chDate;
	}
	public void setChDate(Date chDate) {
		this.chDate = chDate;
	}
	public int getHeight() {
		return height;
	}
	public void setHeight(int height) {
		this.height = height;
	}
	public int getWeight() {
		return weight;
	}
	public void setWeight(int weight) {
		this.weight = weight;
	}
	public double getBmr() {
		return bmr;
	}
	public void setBmr(double bmr) {
		this.bmr = bmr;
	}
	public double getAmr() {
		return amr;
	}
	public void setAmr(double amr) {
		this.amr = amr;
	}
	public double getBmi() {
		return bmi;
	}
	public void setBmi(double bmi) {
		this.bmi = bmi;
	}
	public double getStress() {
		return stress;
	}
	public void setStress(double stress) {
		this.stress = stress;
	}
	@Override
	public String toString() {
		return "SelfCheckVo [id=" + id + ", chDate=" + chDate + ", height=" + height + ", weight=" + weight + ", bmr="
				+ bmr + ", amr=" + amr + ", bmi=" + bmi + ", stress=" + stress + "]";
	}
	
	

}
