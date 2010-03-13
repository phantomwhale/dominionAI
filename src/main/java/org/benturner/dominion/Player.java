package org.benturner.dominion;

import java.util.Set;

import org.benturner.dominion.domain.Action;
import org.benturner.dominion.domain.Card;
import org.benturner.dominion.domain.Deck;
import org.benturner.dominion.domain.DiscardPile;
import org.benturner.dominion.domain.Hand;

public class Player {

	private int actions;
	private int buys;
	private int coins;
	
    private Hand hand;

    private Deck deck;

    private DiscardPile discardPile;
    
    private Set<Card> playedCards;
    
    public void drawCard() {
    	if (deck.isEmpty()) {
    		deck = discardPile.shuffleAndEmpty();
    		// TODO still need to deal with the whole deck in hand scenario
    	}
    	hand.add(deck.draw());
    }
    
    public void playAction(Action action) {
    	if (actions == 0) {
    		throw new IllegalStateException("Player has no actions, cannot play " + action);
    	}
    	actions--;
    	playCard(action);
    	action.resolve(this);
    }
    
    public void buy(Card card) {
    	if (coins < card.getCost()) {
    		throw new IllegalStateException("Player cannot afford " + card);
    	}
    	coins = coins - card.getCost();
    	discardPile.addToPile(card);
    }
    
    public void gain(Card card) {
    	discardPile.addToPile(card);
    }
    
    public void addToHand(Card card) {
    	hand.add(card);
    }
    
    private void playCard(Card card) {
    	hand.remove(card);
    	playedCards.add(card);
    }
    
    public void cleanUp() {
    	for (Card card : playedCards) {
			discardPile.addToPile(card);
		}
    	playedCards.clear();
    	
    	for (int i=0; i < 5; i++) {
    		drawCard();
    	}
    }
    
    public void addActions(int numberOfActions) {
    	actions += numberOfActions;
    }

	public void addCoins(int numberOfCoins) {
		coins += numberOfCoins;
	}

	public void addBuy() {
		buys++;
	}

	public void addAction() {
		addActions(1);
	}
}
