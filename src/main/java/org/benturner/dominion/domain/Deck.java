package org.benturner.dominion.domain;

import java.util.LinkedList;
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
public class Deck {

	@Enumerated
    private LinkedList<Card> cards;
	
	public Deck(List<Card> cards) {
		this.cards = new LinkedList<Card>(cards);
	}

	public Card draw() {
		return cards.removeFirst();
	}

	public boolean isEmpty() {
		return cards.isEmpty();
	}
}
