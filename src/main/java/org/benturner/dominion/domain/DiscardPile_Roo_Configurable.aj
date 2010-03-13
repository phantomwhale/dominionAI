package org.benturner.dominion.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect DiscardPile_Roo_Configurable {
    
    declare @type: DiscardPile: @Configurable;    
    
}
