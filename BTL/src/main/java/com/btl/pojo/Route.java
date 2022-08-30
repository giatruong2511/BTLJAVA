/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import java.io.Serializable;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "route")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Route.findAll", query = "SELECT r FROM Route r"),
    @NamedQuery(name = "Route.findById", query = "SELECT r FROM Route r WHERE r.id = :id"),
    @NamedQuery(name = "Route.findByName", query = "SELECT r FROM Route r WHERE r.name = :name"),
    @NamedQuery(name = "Route.findByStartingPOS", query = "SELECT r FROM Route r WHERE r.startingPOS = :startingPOS"),
    @NamedQuery(name = "Route.findByEndPOS", query = "SELECT r FROM Route r WHERE r.endPOS = :endPOS"),
    @NamedQuery(name = "Route.findByActive", query = "SELECT r FROM Route r WHERE r.active = :active")})
public class Route implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "startingPOS")
    private String startingPOS;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 255)
    @Column(name = "endPOS")
    private String endPOS;
    @Column(name = "active")
    private Boolean active;
    @JoinColumn(name = "bushome_id", referencedColumnName = "id")
    @ManyToOne(optional = false)
    @JsonIgnore
    private Bushome bushomeId;
    @JsonIgnore
    @OneToMany(mappedBy = "routeId")
    private Set<Buses> busesSet;

    public Route() {
    }

    public Route(Integer id) {
        this.id = id;
    }

    public Route(Integer id, String name, String startingPOS, String endPOS) {
        this.id = id;
        this.name = name;
        this.startingPOS = startingPOS;
        this.endPOS = endPOS;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getStartingPOS() {
        return startingPOS;
    }

    public void setStartingPOS(String startingPOS) {
        this.startingPOS = startingPOS;
    }

    public String getEndPOS() {
        return endPOS;
    }

    public void setEndPOS(String endPOS) {
        this.endPOS = endPOS;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    public Bushome getBushomeId() {
        return bushomeId;
    }

    public void setBushomeId(Bushome bushomeId) {
        this.bushomeId = bushomeId;
    }

    @XmlTransient
    public Set<Buses> getBusesSet() {
        return busesSet;
    }

    public void setBusesSet(Set<Buses> busesSet) {
        this.busesSet = busesSet;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Route)) {
            return false;
        }
        Route other = (Route) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.btl.pojo.Route[ id=" + id + " ]";
    }

    public void setBushomeId() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
}
