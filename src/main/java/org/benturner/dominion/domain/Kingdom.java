package org.benturner.dominion.domain;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

public class Kingdom {

	private int goldCount;
	private int silverCount;
	private int copperCount;
	
	private int estateCount;
	private int duchyCount;
	private int provinceCount;
	private int curseCount;
	
	private ArrayList<Card> trash;
	
	private Map<Class<Action>, Integer> actionPiles = new HashMap<Class<Action>, Integer>();
	
	public void trash(Card card) {
		trash.add(card);
	}
	
	public Gold drawGold() {
		if (goldCount == 0) {
			throw new IllegalStateException("Attempted to draw gold but none remain in pile");
		}
		
		return new Gold();
	}
	
	public Silver drawSilver() {
		if (silverCount == 0) {
			throw new IllegalStateException("Attempted to draw silver but none remain in pile");
		}
		
		return new Silver();
	}
	
	public Copper drawCopper() {
		if (copperCount == 0) {
			throw new IllegalStateException("Attempted to draw copper but none remain in pile");
		}
		
		return new Copper();
	}
	
	public Estate drawEstate() {
		if (estateCount == 0) {
			throw new IllegalStateException("Attempted to draw estate but none remain in pile");
		}
		
		return new Estate();
	}
	
	public Duchy drawDuchy() {
		if (duchyCount == 0) {
			throw new IllegalStateException("Attempted to draw duchy but none remain in pile");
		}

		return new Duchy();
	}
	
	public Province drawProvince() {
		if (provinceCount == 0) {
			throw new IllegalStateException("Attempted to draw province but none remain in pile");
		}
		
		return new Province();
	}
	
	public Curse drawCurse() {
		if (curseCount == 0) {
			throw new IllegalStateException("Attempted to draw curse but none remain in pile");
		}
		
		return new Curse();
	}

	public Action drawAction(Class<Action> actionClass) {
		Integer actionCount = actionPiles.get(actionClass);
		Action action = Action.createInstance(actionClass);
		if (actionCount == 0) {
			throw new IllegalStateException("Attempted to draw " + action + " but none remain in pile");
		}
		
		actionCount--;
		return action;
	}
}
