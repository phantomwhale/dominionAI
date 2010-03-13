package org.benturner.dominion.domain;

import java.security.SecureRandom;
import java.util.List;
import java.util.Random;
import org.benturner.dominion.domain.Card;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CardDataOnDemand_Roo_DataOnDemand {
    
    declare @type: CardDataOnDemand: @Component;    
    
    private Random CardDataOnDemand.rnd = new SecureRandom();    
    
    private List<Card> CardDataOnDemand.data;    
    
    public Card CardDataOnDemand.getNewTransientCard(int index) {    
        org.benturner.dominion.domain.Card obj = new org.benturner.dominion.domain.Card();        
        obj.setCost(1);        
        obj.setName("name_" + index);        
        obj.setValue(new Integer(index));        
        obj.setVictoryCost(new Integer(index));        
        return obj;        
    }    
    
    public Card CardDataOnDemand.getRandomCard() {    
        init();        
        Card obj = data.get(rnd.nextInt(data.size()));        
        return Card.findCard(obj.getId());        
    }    
    
    public boolean CardDataOnDemand.modifyCard(Card obj) {    
        return false;        
    }    
    
    @Transactional(propagation = Propagation.REQUIRES_NEW)    
    public void CardDataOnDemand.init() {    
        if (data != null) {        
            return;            
        }        
                
        data = org.benturner.dominion.domain.Card.findCardEntries(0, 10);        
        if (data == null) throw new IllegalStateException("Find entries implementation for 'Card' illegally returned null");        
        if (data.size() > 0) {        
            return;            
        }        
                
        data = new java.util.ArrayList<org.benturner.dominion.domain.Card>();        
        for (int i = 0; i < 10; i++) {        
            org.benturner.dominion.domain.Card obj = getNewTransientCard(i);            
            obj.persist();            
            data.add(obj);            
        }        
    }    
    
}
