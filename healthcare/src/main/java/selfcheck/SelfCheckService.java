package selfcheck;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;

public class SelfCheckService {
	private SelfCheckDao dao;

	public SelfCheckService() {
		dao = new SelfCheckDao();
	}

	public void addSelfCh(SelfCheckVo vo) {
		dao.insert(vo);
	}
	
//	private String id; 
//	private Date chDate; // 체크날짜
//	private int height; 
//	private int weight;
//	private double bmr; //기초대사량
//	private double amr; //활동대사량
//	private double bmi;  //비만지수
//	private double stress; //스트레스

	public ArrayList<SelfCheckVo> showChDate(String id) {
		return dao.selectDate(id);
	}

	public ArrayList<SelfCheckVo> showHeight(String id) {
		return dao.selectHeight(id);
	}

	public ArrayList<SelfCheckVo> showWeight(String id) {
		return dao.selectWeight(id);
	}

	public ArrayList<SelfCheckVo> showAmr(String id) {
		return dao.selectAmr(id);
	}
	
	public ArrayList<SelfCheckVo> showBmi(String id) {
		return dao.selectBmi(id);
	}
	
	public ArrayList<SelfCheckVo> showStress(String id) {
		return dao.selectStress(id);
	}

	public int getAge() {
		
		int birthYear = 1990;
		int birthMonth = 12; 
		int birthDay = 27;
		
		Calendar current = Calendar.getInstance();
        int currentYear  = current.get(Calendar.YEAR);
        int currentMonth = current.get(Calendar.MONTH) + 1;
        int currentDay   = current.get(Calendar.DAY_OF_MONTH);
        
        int age = currentYear - birthYear;
        if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) {
        	age--;
        }
        return age;
        
	}

	public double calBmr(int height, int weight, int age, String gender) {
		double result;
		
		if (gender.equals("m")) {
			result = 88.4 + 13.4 * weight + 4.8 * height - 5.68 * age;
		} else {
			result =  447.6 + 9.25 * weight + 3.1 * height - 4.33 * age;
		}
		return result;
	}
	
	public double calBmi(double height, double weight) {
		
		double result =(weight / ((height/100)*(height/100)));
		return result;
	}
	
	
	public String calStress(double sum) {
		String result;
		if(sum<6) {
			result = "평균 이하 수준으로 특별한 문제가 없다고 생각할 수 있습니다.";
		}else if(sum<13) {
			result = "대개 직장을 가진 성인남녀의 평균 수준입니다.";
		}else if(sum<20) {
			result = "평균보다 조금 높으므로 약간의 주의가 필요합니다.";
		}else {
			result = "위험수위, 상당한 주의 또는 의사와의 상의가 필요합니다.";
		}
		return result;
	}

	
}
