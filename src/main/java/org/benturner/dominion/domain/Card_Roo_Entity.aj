package org.benturner.dominion.domain;

import java.lang.Integer;
import java.lang.Long;
import java.util.List;
import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.PersistenceContext;
import javax.persistence.Version;
import org.benturner.dominion.domain.Card;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Card_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager Card.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long Card.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer Card.version;    
    
    private Card.new() {    
        super();        
    }    
    
    public Long Card.getId() {    
        return this.id;        
    }    
    
    public void Card.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer Card.getVersion() {    
        return this.version;        
    }    
    
    public void Card.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void Card.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void Card.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            Card attached = this.entityManager.find(Card.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void Card.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void Card.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Card merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager Card.entityManager() {    
        EntityManager em = new Card().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long Card.countCards() {    
        return (Long) entityManager().createQuery("select count(o) from Card o").getSingleResult();        
    }    
    
    public static List<Card> Card.findAllCards() {    
        return entityManager().createQuery("select o from Card o").getResultList();        
    }    
    
    public static Card Card.findCard(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of Card");        
        return entityManager().find(Card.class, id);        
    }    
    
    public static List<Card> Card.findCardEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from Card o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
