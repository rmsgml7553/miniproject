package member;

import java.sql.Date;

public class MemberVo {
	private String id;
	private String pwd;
	private String name;
	private String phone;
	private String address;
	private int mCode;
	private String code;
	private String gender;
	private Date birth;
	
	public MemberVo() {}
	public MemberVo(String id, String pwd, String name, String phone, String address, int mCode,
			String gender, Date birth) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.mCode = mCode;
		this.gender = gender;
		this.birth = birth;
	}
	public MemberVo(String id, String pwd, String name, String phone, String address, int mCode, String code,
			String gender, Date birth) {
		this.id = id;
		this.pwd = pwd;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.mCode = mCode;
		this.code = code;
		this.gender = gender;
		this.birth = birth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public int getmCode() {
		return mCode;
	}
	public void setmCode(int mCode) {
		this.mCode = mCode;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public Date getBirth() {
		return birth;
	}
	public void setBirth(Date birth) {
		this.birth = birth;
	}
	
	@Override
	public String toString() {
		return "MemberVo [id=" + id + ", pwd=" + pwd + ", name=" + name + ", phone=" + phone + ", address=" + address
				+ ", mCode=" + mCode + ", code=" + code + ", gender=" + gender + ", birth=" + birth + "]";
	}
	
	
	

}
