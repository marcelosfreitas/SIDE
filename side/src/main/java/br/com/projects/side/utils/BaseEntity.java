package br.com.projects.side.utils;

import java.io.Serializable;

import org.springframework.data.jpa.domain.AbstractPersistable;

public abstract class BaseEntity<ID extends Serializable> 
extends AbstractPersistable<Serializable>{

	private static final long serialVersionUID = 1L;
	
	@Override
	public String toString() {
		return super.toString();
	}
	
	@Override
	public boolean equals(Object obj) {
		// TODO Auto-generated method stub
		return super.equals(obj);
	}
	
	@Override
	protected void setId(Serializable id) {
		// TODO Auto-generated method stub
		super.setId(id);
	}
	
	@Override
	public boolean isNew() {
		// TODO Auto-generated method stub
		return super.isNew();
	}
	
}
