package org.benturner.dominion.domain;

import java.lang.Integer;
import java.lang.String;

privileged aspect Card_Roo_JavaBean {
    
    public String Card.getName() {    
        return this.name;        
    }    
    
    public void Card.setName(String name) {    
        this.name = name;        
    }    
    
    public void Card.setCost(int cost) {    
        this.cost = cost;        
    }    
    
    public Integer Card.getVictoryCost() {    
        return this.victoryCost;        
    }    
    
    public void Card.setVictoryCost(Integer victoryCost) {    
        this.victoryCost = victoryCost;        
    }    
    
    public Integer Card.getValue() {    
        return this.value;        
    }    
    
    public void Card.setValue(Integer value) {    
        this.value = value;        
    }    
    
}
