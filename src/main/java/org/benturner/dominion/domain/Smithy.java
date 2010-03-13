package org.benturner.dominion.domain;

import org.benturner.dominion.Player;

public class Smithy extends Action {

	public Smithy() {
		super("Smithy", 4);
	}
	
	@Override
	public void resolve(Player player) {
		// draw 3 cards
		player.drawCard();
		player.drawCard();
		player.drawCard();
	}

}
