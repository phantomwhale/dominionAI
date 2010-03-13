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
import org.benturner.dominion.domain.Deck;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Deck_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager Deck.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long Deck.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer Deck.version;    
    
    private Deck.new() {    
        super();        
    }    
    
    public Long Deck.getId() {    
        return this.id;        
    }    
    
    public void Deck.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer Deck.getVersion() {    
        return this.version;        
    }    
    
    public void Deck.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void Deck.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void Deck.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            Deck attached = this.entityManager.find(Deck.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void Deck.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void Deck.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Deck merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager Deck.entityManager() {    
        EntityManager em = new Deck().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long Deck.countDecks() {    
        return (Long) entityManager().createQuery("select count(o) from Deck o").getSingleResult();        
    }    
    
    public static List<Deck> Deck.findAllDecks() {    
        return entityManager().createQuery("select o from Deck o").getResultList();        
    }    
    
    public static Deck Deck.findDeck(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of Deck");        
        return entityManager().find(Deck.class, id);        
    }    
    
    public static List<Deck> Deck.findDeckEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from Deck o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
