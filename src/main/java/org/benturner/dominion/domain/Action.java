package org.benturner.dominion.domain;

import org.benturner.dominion.Player;

public abstract class Action extends Card {

	public Action(String name, int cost) {
		super(name, cost);
	}

	public static Action createInstance(Class<Action> actionClass) {
		try {
			return actionClass.newInstance();
		} catch (InstantiationException e) {
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			e.printStackTrace();
		}
		return null;
	}

	public abstract void resolve(Player player);
}
