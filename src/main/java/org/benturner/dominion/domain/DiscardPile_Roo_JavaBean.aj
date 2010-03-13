package org.benturner.dominion.domain;

import java.util.List;
import org.benturner.dominion.domain.Card;

privileged aspect DiscardPile_Roo_JavaBean {
    
    public List<Card> DiscardPile.getCards() {    
        return this.cards;        
    }    
    
    public void DiscardPile.setCards(List<Card> cards) {    
        this.cards = cards;        
    }    
    
}
