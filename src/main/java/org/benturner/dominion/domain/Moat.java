package org.benturner.dominion.domain;

import org.benturner.dominion.Player;

public class Moat extends Action {

	public Moat() {
		super("Moat", 2);
	}
	
	@Override
	public void resolve(Player player) {
		player.drawCard();
		player.drawCard();
	}

}
