package org.benturner.dominion.domain;

import org.springframework.beans.factory.annotation.Configurable;

privileged aspect Hand_Roo_Configurable {
    
    declare @type: Hand: @Configurable;    
    
}
