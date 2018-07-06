package com.niuniu.ym.common.base;

import java.io.Serializable;

/**
 * 实体基类
 * @author tangshuren
 *
 */
public class BaseEntity implements Serializable{

	private static final long serialVersionUID = -627743046758021381L;
	
	/**
	 * 主键
	 */
	public int id;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}
	
	/**
 	 * 删除枚举
 	 * @author  www.jeecg.org
 	 *
 	 */
 	public static enum DELETED {
		NO(0, "未删除"), YES(1,"已删除");
		public int key;
		public String value;
		private DELETED(int key, String value) {
			this.key = key;
			this.value = value;
		}
		public static DELETED get(int key) {
			DELETED[] values = DELETED.values();
			for (DELETED object : values) {
				if (object.key == key) {
					return object;
				}
			}
			return null;
		}
	}

}
