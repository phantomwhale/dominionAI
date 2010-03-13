package org.benturner.dominion.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Deck_Roo_Configurable {
    
    declare @type: Deck: @Configurable;    
    
}
