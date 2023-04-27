package clinic;

import java.util.ArrayList;

public class Vo {
	private String num;
	private String code;
	private String onoff;
	private String phone;
	private String address;
	private String name;
	private String clinic;
	private String x;
	private String y;

	private ArrayList<String> subject;

	public Vo() {
	}

	public Vo(String num, String code, String onoff, String phone, String address, String name, String clinic, String x,
			String y, ArrayList<String> subject) {
		super();
		this.num = num;
		this.code = code;
		this.onoff = onoff;
		this.phone = phone;
		this.address = address;
		this.name = name;
		this.clinic = clinic;
		this.x = x;
		this.y = y;
		this.subject = subject;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getOnoff() {
		return onoff;
	}

	public void setOnoff(String onoff) {
		this.onoff = onoff;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getClinic() {
		return clinic;
	}

	public void setClinic(String clinic) {
		this.clinic = clinic;
	}

	public String getX() {
		return x;
	}

	public void setX(String x) {
		this.x = x;
	}

	public String getY() {
		return y;
	}

	public void setY(String y) {
		this.y = y;
	}

	public ArrayList<String> getSubject() {
		return subject;
	}

	public void setSubject(ArrayList<String> subject) {
		this.subject = subject;
	}

	@Override
	public String toString() {
		return "Vo [num=" + num + ", code=" + code + ", onoff=" + onoff + ", phone=" + phone + ", address=" + address
				+ ", name=" + name + ", clinic=" + clinic + ", x=" + x + ", y=" + y + ", subject=" + subject + "]";
	}
}

