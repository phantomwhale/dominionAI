package org.benturner.dominion.domain;

import java.util.Set;
import org.benturner.dominion.domain.Card;

privileged aspect Hand_Roo_JavaBean {
    
    public Set<Card> Hand.getCards() {    
        return this.cards;        
    }    
    
    public void Hand.setCards(Set<Card> cards) {    
        this.cards = cards;        
    }    
    
}
