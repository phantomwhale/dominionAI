package org.benturner.dominion.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Card_Roo_Configurable {
    
    declare @type: Card: @Configurable;    
    
}
