package org.benturner.dominion.domain;

import org.benturner.dominion.domain.CardDataOnDemand;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CardIntegrationTest_Roo_IntegrationTest {
    
    declare @type: CardIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);    
    
    declare @type: CardIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");    
    
    @Autowired    
    private CardDataOnDemand CardIntegrationTest.dod;    
    
    @Test    
    public void CardIntegrationTest.testCountCards() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to initialize correctly", dod.getRandomCard());        
        long count = org.benturner.dominion.domain.Card.countCards();        
        org.junit.Assert.assertTrue("Counter for 'Card' incorrectly reported there were no entries", count > 0);        
    }    
    
    @Test    
    public void CardIntegrationTest.testFindCard() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to initialize correctly", dod.getRandomCard());        
        java.lang.Long id = dod.getRandomCard().getId();        
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to provide an identifier", id);        
        org.benturner.dominion.domain.Card obj = org.benturner.dominion.domain.Card.findCard(id);        
        org.junit.Assert.assertNotNull("Find method for 'Card' illegally returned null for id '" + id + "'", obj);        
        org.junit.Assert.assertEquals("Find method for 'Card' returned the incorrect identifier", id, obj.getId());        
    }    
    
    @Test    
    public void CardIntegrationTest.testFindAllCards() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to initialize correctly", dod.getRandomCard());        
        long count = org.benturner.dominion.domain.Card.countCards();        
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Card', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);        
        java.util.List<org.benturner.dominion.domain.Card> result = org.benturner.dominion.domain.Card.findAllCards();        
        org.junit.Assert.assertNotNull("Find all method for 'Card' illegally returned null", result);        
        org.junit.Assert.assertTrue("Find all method for 'Card' failed to return any data", result.size() > 0);        
    }    
    
    @Test    
    public void CardIntegrationTest.testFindCardEntries() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to initialize correctly", dod.getRandomCard());        
        long count = org.benturner.dominion.domain.Card.countCards();        
        if (count > 20) count = 20;        
        java.util.List<org.benturner.dominion.domain.Card> result = org.benturner.dominion.domain.Card.findCardEntries(0, (int)count);        
        org.junit.Assert.assertNotNull("Find entries method for 'Card' illegally returned null", result);        
        org.junit.Assert.assertEquals("Find entries method for 'Card' returned an incorrect number of entries", count, result.size());        
    }    
    
    @Test    
    @Transactional    
    public void CardIntegrationTest.testFlush() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to initialize correctly", dod.getRandomCard());        
        java.lang.Long id = dod.getRandomCard().getId();        
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to provide an identifier", id);        
        org.benturner.dominion.domain.Card obj = org.benturner.dominion.domain.Card.findCard(id);        
        org.junit.Assert.assertNotNull("Find method for 'Card' illegally returned null for id '" + id + "'", obj);        
        boolean modified =  dod.modifyCard(obj);        
        java.lang.Integer currentVersion = obj.getVersion();        
        obj.flush();        
        org.junit.Assert.assertTrue("Version for 'Card' failed to increment on flush directive", obj.getVersion() > currentVersion || !modified);        
    }    
    
    @Test    
    @Transactional    
    public void CardIntegrationTest.testMerge() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to initialize correctly", dod.getRandomCard());        
        java.lang.Long id = dod.getRandomCard().getId();        
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to provide an identifier", id);        
        org.benturner.dominion.domain.Card obj = org.benturner.dominion.domain.Card.findCard(id);        
        org.junit.Assert.assertNotNull("Find method for 'Card' illegally returned null for id '" + id + "'", obj);        
        boolean modified =  dod.modifyCard(obj);        
        java.lang.Integer currentVersion = obj.getVersion();        
        obj.merge();        
        obj.flush();        
        org.junit.Assert.assertTrue("Version for 'Card' failed to increment on merge and flush directive", obj.getVersion() > currentVersion || !modified);        
    }    
    
    @Test    
    @Transactional    
    public void CardIntegrationTest.testPersist() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to initialize correctly", dod.getRandomCard());        
        org.benturner.dominion.domain.Card obj = dod.getNewTransientCard(Integer.MAX_VALUE);        
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to provide a new transient entity", obj);        
        org.junit.Assert.assertNull("Expected 'Card' identifier to be null", obj.getId());        
        obj.persist();        
        obj.flush();        
        org.junit.Assert.assertNotNull("Expected 'Card' identifier to no longer be null", obj.getId());        
    }    
    
    @Test    
    @Transactional    
    public void CardIntegrationTest.testRemove() {    
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to initialize correctly", dod.getRandomCard());        
        java.lang.Long id = dod.getRandomCard().getId();        
        org.junit.Assert.assertNotNull("Data on demand for 'Card' failed to provide an identifier", id);        
        org.benturner.dominion.domain.Card obj = org.benturner.dominion.domain.Card.findCard(id);        
        org.junit.Assert.assertNotNull("Find method for 'Card' illegally returned null for id '" + id + "'", obj);        
        obj.remove();        
        org.junit.Assert.assertNull("Failed to remove 'Card' with identifier '" + id + "'", org.benturner.dominion.domain.Card.findCard(id));        
    }    
    
}
