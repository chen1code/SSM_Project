package com.erp.util;

import java.io.Serializable;
import java.util.HashMap;
import java.util.Map;

import com.erp.model.Users;


public class JsonResult implements Serializable{
	


	/**
	 * 
	 */
	private static final long serialVersionUID = 5735717025479800279L;

	private String errcode;
	
	private String message;

	private Map<Object, Object> item = new HashMap<Object, Object>();

	public JsonResult(){
        
    }

	public String getErrcode() {
		return errcode;
	}
	public void setErrcode(String errcode) {
		this.errcode = errcode;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public Map<Object, Object> getItem() {
		return item;
	}
	public void setItem(Map<Object, Object> item) {
		this.item = item;
	}


}
