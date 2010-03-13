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
import org.benturner.dominion.domain.Hand;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Hand_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager Hand.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long Hand.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer Hand.version;    
    
    public Long Hand.getId() {    
        return this.id;        
    }    
    
    public void Hand.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer Hand.getVersion() {    
        return this.version;        
    }    
    
    public void Hand.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void Hand.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void Hand.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            Hand attached = this.entityManager.find(Hand.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void Hand.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void Hand.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        Hand merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager Hand.entityManager() {    
        EntityManager em = new Hand().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long Hand.countHands() {    
        return (Long) entityManager().createQuery("select count(o) from Hand o").getSingleResult();        
    }    
    
    public static List<Hand> Hand.findAllHands() {    
        return entityManager().createQuery("select o from Hand o").getResultList();        
    }    
    
    public static Hand Hand.findHand(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of Hand");        
        return entityManager().find(Hand.class, id);        
    }    
    
    public static List<Hand> Hand.findHandEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from Hand o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
