package selfcheck;

import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;

import member.MemberService;

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

	public SelfCheckVo selectSelfcheck(String id) {
		return dao.selectSelfcheck(id);
	}

	public int getAge(String id) {
		
		MemberService memberService = new MemberService();
		
		java.sql.Date sqlBirth = memberService.getByMember(id).getBirth();
		
		java.util.Date birth = new java.util.Date(sqlBirth.getTime());
		DateFormat dateFormat = new SimpleDateFormat("yyyy");
		int birthYear = Integer.parseInt(dateFormat.format(birth));
		dateFormat = new SimpleDateFormat("mm");
		int birthMonth = Integer.parseInt(dateFormat.format(birth));
		dateFormat = new SimpleDateFormat("dd");
		int birthDay= Integer.parseInt(dateFormat.format(birth));
		Calendar current = Calendar.getInstance();
        int currentYear  = current.get(Calendar.YEAR);
        int currentMonth = current.get(Calendar.MONTH) + 1;
        int currentDay   = current.get(Calendar.DAY_OF_MONTH);
        System.out.println("birthY : " + birthYear);
        System.out.println("currentY : " + currentYear);
        System.out.println("currentY : " + currentYear);
        int age = currentYear - birthYear;
        if (birthMonth * 100 + birthDay > currentMonth * 100 + currentDay) {
        	age--;
        }
        return age;
        
	}

	public double calBmr(int height, int weight, String id) {
		double result;
		int age = getAge(id);
		System.out.println(age);
		MemberService service = new MemberService();
		String gender = service.getByMember(id).getGender();
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
