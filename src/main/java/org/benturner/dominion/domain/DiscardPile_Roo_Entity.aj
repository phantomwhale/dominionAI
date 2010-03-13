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
import org.benturner.dominion.domain.DiscardPile;
import org.springframework.transaction.annotation.Transactional;

privileged aspect DiscardPile_Roo_Entity {
    
    @PersistenceContext    
    transient EntityManager DiscardPile.entityManager;    
    
    @Id    
    @GeneratedValue(strategy = GenerationType.AUTO)    
    @Column(name = "id")    
    private Long DiscardPile.id;    
    
    @Version    
    @Column(name = "version")    
    private Integer DiscardPile.version;    
    
    public Long DiscardPile.getId() {    
        return this.id;        
    }    
    
    public void DiscardPile.setId(Long id) {    
        this.id = id;        
    }    
    
    public Integer DiscardPile.getVersion() {    
        return this.version;        
    }    
    
    public void DiscardPile.setVersion(Integer version) {    
        this.version = version;        
    }    
    
    @Transactional    
    public void DiscardPile.persist() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.persist(this);        
    }    
    
    @Transactional    
    public void DiscardPile.remove() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        if (this.entityManager.contains(this)) {        
            this.entityManager.remove(this);            
        } else {        
            DiscardPile attached = this.entityManager.find(DiscardPile.class, this.id);            
            this.entityManager.remove(attached);            
        }        
    }    
    
    @Transactional    
    public void DiscardPile.flush() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        this.entityManager.flush();        
    }    
    
    @Transactional    
    public void DiscardPile.merge() {    
        if (this.entityManager == null) this.entityManager = entityManager();        
        DiscardPile merged = this.entityManager.merge(this);        
        this.entityManager.flush();        
        this.id = merged.getId();        
    }    
    
    public static final EntityManager DiscardPile.entityManager() {    
        EntityManager em = new DiscardPile().entityManager;        
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");        
        return em;        
    }    
    
    public static long DiscardPile.countDiscardPiles() {    
        return (Long) entityManager().createQuery("select count(o) from DiscardPile o").getSingleResult();        
    }    
    
    public static List<DiscardPile> DiscardPile.findAllDiscardPiles() {    
        return entityManager().createQuery("select o from DiscardPile o").getResultList();        
    }    
    
    public static DiscardPile DiscardPile.findDiscardPile(Long id) {    
        if (id == null) throw new IllegalArgumentException("An identifier is required to retrieve an instance of DiscardPile");        
        return entityManager().find(DiscardPile.class, id);        
    }    
    
    public static List<DiscardPile> DiscardPile.findDiscardPileEntries(int firstResult, int maxResults) {    
        return entityManager().createQuery("select o from DiscardPile o").setFirstResult(firstResult).setMaxResults(maxResults).getResultList();        
    }    
    
}
