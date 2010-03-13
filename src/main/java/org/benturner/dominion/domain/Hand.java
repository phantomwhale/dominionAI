package org.benturner.dominion.domain;

import java.util.Set;

import javax.persistence.Entity;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.roo.addon.entity.RooEntity;
import org.benturner.dominion.domain.Card;
import javax.persistence.Enumerated;

@Entity
@RooJavaBean
@RooToString
@RooEntity
public class Hand {

    @Enumerated
    private Set<Card> cards;

	public void add(Card card) {
		cards.add(card);
	}

	public void remove(Card card) {
		if (!cards.remove(card)) {
			throw new IllegalStateException("Hand does not contain card " + card);
		}
	}
}
