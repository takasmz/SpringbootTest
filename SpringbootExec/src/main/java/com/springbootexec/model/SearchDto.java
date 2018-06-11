package com.springbootexec.model;

public class SearchDto {
	 private String key;
	    private String operation;
	    private Object value;

	    public SearchDto(String key, String operation, Object value) {
	        this.key = key;
	        this.operation = operation;
	        this.value = value;
	    }
	    
	    public void setkey(String key){
	    	this.key = key;
	    }
	    
	    public void setoperation(String operation){
	    	this.operation = operation;
	    }
	    public void setvalue(Object value){
	    	this.value = value;
	    }
	    
	    public String getkey(){
			return key;
	    }
	    public String getoperation(){
			return operation;
	    }
	    
	    public Object getvalue(){
	    	return value;
	    }
}
