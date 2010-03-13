package org.benturner.dominion.domain;

import java.util.Collections;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.Enumerated;

import org.springframework.roo.addon.entity.RooEntity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class DiscardPile {

    @Enumerated
    private List<Card> cards;
    
    public void addToPile(Card card) {
    	cards.add(card);
    }
    
    public Deck shuffleAndEmpty() {
    	Collections.shuffle(cards);
    	Deck deck = new Deck(cards); 
    	cards.clear();
    	return deck;
    }
}
