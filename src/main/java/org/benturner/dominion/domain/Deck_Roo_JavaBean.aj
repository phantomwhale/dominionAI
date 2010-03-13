package org.benturner.dominion.domain;

import java.util.LinkedList;
import org.benturner.dominion.domain.Card;

privileged aspect Deck_Roo_JavaBean {
    
    public LinkedList<Card> Deck.getCards() {    
        return this.cards;        
    }    
    
    public void Deck.setCards(LinkedList<Card> cards) {    
        this.cards = cards;        
    }    
    
}
