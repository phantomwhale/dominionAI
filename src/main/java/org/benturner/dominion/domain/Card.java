package org.benturner.dominion.domain;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Card {

    private String name;
    private int cost;
    
    protected Integer victoryCost = null;
    protected Integer value = null;
    
    public Card (String name, int cost) {
    	this.name = name;
    	this.cost = cost;
    }

	public int getCost() {
		return cost;
	}

	@Override
	public String toString() {
		return name;
	}
}
