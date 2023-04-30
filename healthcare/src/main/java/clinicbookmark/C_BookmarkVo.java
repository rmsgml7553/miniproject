package clinicbookmark;


public class C_BookmarkVo {
	private String id;
	private String code;
	private String c_name;
	private String phone;
	private String address;
	private String subject;
	private String clinic;
	private String x;
	private String y;
	
	public C_BookmarkVo() {}

	public C_BookmarkVo(String id, String code, String name) {
		this.id = id;
		this.code = code;
		this.c_name = name;
	}
	
	public C_BookmarkVo(String id, String code, String c_name, String phone, String address, String subject,
			String clinic, String x, String y) {
		super();
		this.id = id;
		this.code = code;
		this.c_name = c_name;
		this.phone = phone;
		this.address = address;
		this.subject = subject;
		this.clinic = clinic;
		this.x = x;
		this.y = y;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
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

	public String getSubject() {
		return subject;
	}

	public void setSubject(String subject) {
		this.subject = subject;
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

	@Override
	public String toString() {
		return "C_BookmarkVo [id=" + id + ", code=" + code + ", c_name=" + c_name + ", phone=" + phone + ", address="
				+ address + ", subject=" + subject + ", clinic=" + clinic + ", x=" + x + ", y=" + y + "]";
	}

	
}
