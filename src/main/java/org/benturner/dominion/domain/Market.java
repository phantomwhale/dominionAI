package org.benturner.dominion.domain;

import org.benturner.dominion.Player;

public class Market extends Action {

	public Market() {
		super("Market", 5);
	}
	
	@Override
	public void resolve(Player player) {
		player.drawCard();
		player.addAction();
		player.addBuy();
		player.addCoins(1);
	}

}
