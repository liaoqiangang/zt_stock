package com.niuniu.ym.enums;


public class StockType {

	private String stockCode;
	
	private String plateName;
	
	private int plateType;
	
	private String stockType = "sh";

	public StockType(String stockCode){
		this.stockCode = stockCode;
		convert();
	}
	
	private void convert(){
		if(stockCode.startsWith("6")){
			this.plateName = "沪市主板";
			this.plateType = 2;
			this.stockType = "sh";
		}else{
			String priffex = stockCode.substring(0, 3);
			switch (priffex) {
			case "600":
			case "603":
				this.plateName = "沪市主板";
				this.plateType = 2;
				this.stockType = "sh";
				break;
			case "000":
				this.plateName = "深市主板";
				this.plateType = 0;
				this.stockType = "sz";
				break;
			case "002":
				this.plateName = "中小板";
				this.plateType = 1;
				this.stockType = "sz";
				break;
			case "300":
				this.plateName = "创业板";
				this.plateType = 3;
				this.stockType = "sz";
				break;
			case "900":
				this.plateName = "沪市B股";
				this.plateType = 4;
				this.stockType = "B";
				break;
			case "200":
				this.plateName = "深市B股";
				this.plateType = 5;
				this.stockType = "B";
				break;
			default:
				break;
			}
		}
	}
	public String getStockCode() {
		return stockCode;
	}

	public void setStockCode(String stockCode) {
		this.stockCode = stockCode;
	}

	public String getPlateName() {
		return plateName;
	}

	public void setPlateName(String plateName) {
		this.plateName = plateName;
	}

	public int getPlateType() {
		return plateType;
	}

	public void setPlateType(int plateType) {
		this.plateType = plateType;
	}

	public String getStockType() {
		return stockType;
	}

	public void setStockType(String stockType) {
		this.stockType = stockType;
	}

	
}
