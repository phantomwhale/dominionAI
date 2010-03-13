package org.benturner.dominion.domain;

import org.benturner.dominion.Player;

public class Woodcutter extends Action {

	public Woodcutter() {
		super("Woodcutter", 3);
	}
	
	@Override
	public void resolve(Player player) {
		player.addCoins(2);
		player.addBuy();
	}

}
