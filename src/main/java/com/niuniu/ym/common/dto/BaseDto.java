package com.niuniu.ym.common.dto;

import java.io.Serializable;

public abstract class BaseDto implements Serializable{
	
	private static final long serialVersionUID = -6362488405038922356L;
	
	protected long id;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

}
