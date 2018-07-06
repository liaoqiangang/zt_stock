package com.niuniu.ym.enums;

public enum GoldRatioEnum {
	
	goldratio_num_1(0.618,1),
	goldratio_num_2(0.5,2),
	goldratio_num_3(0.382,3),
	goldratio_num_4(0.23,4);
	
	

	private double ratio;
	
	private int index;
	
	private GoldRatioEnum(double ratio,int index) {
		  this.ratio = ratio;  
	      this.index = index;
	}

	public double getRatio() {
		return ratio;
	}

	public void setRatio(double ratio) {
		this.ratio = ratio;
	}

	public int getIndex() {
		return index;
	}

	public void setIndex(int index) {
		this.index = index;
	}
	
}
