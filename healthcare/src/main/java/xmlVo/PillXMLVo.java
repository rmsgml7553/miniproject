package xmlVo;

public class PillXMLVo {
	private String entpName; // 업체명
	private String itemName; // 제품명
	private String itemSeq; // 품목기준코드
	private String efcyQesitm; // 효능
	private String useMethodQesitm; // 사용법
	private String atpnWarnQesitm; // 주의사항 경고
	private String atpnQesitm; // 주의 사항
	private String intrcQesitm; //상호 작용
	private String seQesitm; //부작용
	private String depositMethodQesitm; // 보관법
	private String itemImage; // 이미지 경로

	public PillXMLVo(String entpName, String itemName, String itemSeq, String efcyQesitm, String useMethodQesitm,
			String atpnWarnQesitm, String atpnQesitm, String intrcQesitm, String seQesitm, String depositMethodQesitm,
			String itemImage) {
		this.entpName = entpName;
		this.itemName = itemName;
		this.itemSeq = itemSeq;
		this.efcyQesitm = efcyQesitm;
		this.useMethodQesitm = useMethodQesitm;
		this.atpnWarnQesitm = atpnWarnQesitm;
		this.atpnQesitm = atpnQesitm;
		this.intrcQesitm = intrcQesitm;
		this.seQesitm = seQesitm;
		this.depositMethodQesitm = depositMethodQesitm;
		this.itemImage = itemImage;
	}

	public String getEntpName() {
		return entpName;
	}

	public void setEntpName(String entpName) {
		this.entpName = entpName;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemSeq() {
		return itemSeq;
	}

	public void setItemSeq(String itemSeq) {
		this.itemSeq = itemSeq;
	}

	public String getEfcyQesitm() {
		return efcyQesitm;
	}

	public void setEfcyQesitm(String efcyQesitm) {
		this.efcyQesitm = efcyQesitm;
	}

	public String getUseMethodQesitm() {
		return useMethodQesitm;
	}

	public void setUseMethodQesitm(String useMethodQesitm) {
		this.useMethodQesitm = useMethodQesitm;
	}

	public String getAtpnWarnQesitm() {
		return atpnWarnQesitm;
	}

	public void setAtpnWarnQesitm(String atpnWarnQesitm) {
		this.atpnWarnQesitm = atpnWarnQesitm;
	}

	public String getAtpnQesitm() {
		return atpnQesitm;
	}

	public void setAtpnQesitm(String atpnQesitm) {
		this.atpnQesitm = atpnQesitm;
	}

	public String getIntrcQesitm() {
		return intrcQesitm;
	}

	public void setIntrcQesitm(String intrcQesitm) {
		this.intrcQesitm = intrcQesitm;
	}

	public String getSeQesitm() {
		return seQesitm;
	}

	public void setSeQesitm(String seQesitm) {
		this.seQesitm = seQesitm;
	}

	public String getDepositMethodQesitm() {
		return depositMethodQesitm;
	}

	public void setDepositMethodQesitm(String depositMethodQesitm) {
		this.depositMethodQesitm = depositMethodQesitm;
	}

	public String getItemImage() {
		return itemImage;
	}

	public void setItemImage(String itemImage) {
		this.itemImage = itemImage;
	}

	@Override
	public String toString() {
		return "PillXMLVo [entpName=" + entpName + ", itemName=" + itemName + ", itemSeq=" + itemSeq + ", efcyQesitm="
				+ efcyQesitm + ", useMethodQesitm=" + useMethodQesitm + ", atpnWarnQesitm=" + atpnWarnQesitm
				+ ", atpnQesitm=" + atpnQesitm + ", intrcQesitm=" + intrcQesitm + ", seQesitm=" + seQesitm
				+ ", depositMethodQesitm=" + depositMethodQesitm + ", itemImage=" + itemImage + "]";
	}

}
