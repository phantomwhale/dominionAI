package org.benturner.dominion.domain;

import java.lang.String;

privileged aspect Deck_Roo_ToString {
    
    public String Deck.toString() {    
        StringBuilder sb = new StringBuilder();        
        sb.append("Empty: ").append(isEmpty()).append(", ");        
        sb.append("Id: ").append(getId()).append(", ");        
        sb.append("Version: ").append(getVersion()).append(", ");        
        sb.append("Cards: ").append(getCards());        
        return sb.toString();        
    }    
    
}
