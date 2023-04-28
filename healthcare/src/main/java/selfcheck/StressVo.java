package selfcheck;

public class StressVo {
	private String arg1;
	private String arg2;
	
	public StressVo() {}
	public StressVo(String arg1, String arg2) {

		this.arg1 = arg1;
		this.arg2 = arg2;
	}

	public String getArg1() {
		return arg1;
	}

	public void setArg1(String arg1) {
		this.arg1 = arg1;
	}

	public String getArg2() {
		return arg2;
	}

	public void setArg2(String arg2) {
		this.arg2 = arg2;
	}
	@Override
	public String toString() {
		return "StressVo [arg1=" + arg1 + ", arg2=" + arg2 + "]";
	}
	
	
}
