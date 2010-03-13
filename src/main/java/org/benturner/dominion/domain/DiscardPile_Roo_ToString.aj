package org.benturner.dominion.domain;

import java.lang.String;

privileged aspect DiscardPile_Roo_ToString {
    
    public String DiscardPile.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("Cards: ").append(getCards() == null ? "null" : getCards().size());        
        return sb.toString();        
    }    
    
}
