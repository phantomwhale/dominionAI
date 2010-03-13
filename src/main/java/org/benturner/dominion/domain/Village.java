package org.benturner.dominion.domain;

import org.benturner.dominion.Player;

public class Village extends Action {

	public Village() {
		super("Village", 3);
	}

	@Override
	public void resolve(Player player) {
		// +1 card, +2 actions
		player.drawCard();
		player.addActions(2);
	}

}
