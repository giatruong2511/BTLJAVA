/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.btl.pojo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import java.io.Serializable;
import java.util.Date;
import java.util.Set;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author DELL
 */
@Entity
@Table(name = "bushome")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Bushome.findAll", query = "SELECT b FROM Bushome b"),
    @NamedQuery(name = "Bushome.findById", query = "SELECT b FROM Bushome b WHERE b.id = :id"),
    @NamedQuery(name = "Bushome.findByName", query = "SELECT b FROM Bushome b WHERE b.name = :name"),
    @NamedQuery(name = "Bushome.findByAddress", query = "SELECT b FROM Bushome b WHERE b.address = :address"),
    @NamedQuery(name = "Bushome.findByPhone", query = "SELECT b FROM Bushome b WHERE b.phone = :phone"),
    @NamedQuery(name = "Bushome.findByImage", query = "SELECT b FROM Bushome b WHERE b.image = :image"),
    @NamedQuery(name = "Bushome.findByEmail", query = "SELECT b FROM Bushome b WHERE b.email = :email"),
    @NamedQuery(name = "Bushome.findByCreatedDate", query = "SELECT b FROM Bushome b WHERE b.createdDate = :createdDate"),
    @NamedQuery(name = "Bushome.findByActive", query = "SELECT b FROM Bushome b WHERE b.active = :active")})
public class Bushome implements Serializable {
    
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bushomeId")
    private Set<Comment> commentSet;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @NotNull(message = "{name.NotNull}")
    @Size(min = 1, max = 255, message = "{name.required}")
    @Column(name = "name")
    private String name;
    @Basic(optional = false)
    @NotNull(message = "{name.NotNull}")
    @Size(min = 1, max = 255, message = "{name.required}")
    @Column(name = "address")
    private String address;
    // @Pattern(regexp="^\\(?(\\d{3})\\)?[- ]?(\\d{3})[- ]?(\\d{4})$", message="Invalid phone/fax format, should be as xxx-xxx-xxxx")//if the field contains phone or fax number consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull(message = "{name.NotNull}")
    @Size(min = 10, max = 10, message = "{phone.required}")
    @Column(name = "phone")
    private String phone;
    @Basic(optional = false)
    @NotNull(message = "{name.NotNull}")
    @Size(min = 1, max = 255, message = "{name.required}")
    @Column(name = "image")
    private String image;
    // @Pattern(regexp="[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?", message="Invalid email")//if the field contains email address consider using this annotation to enforce field validation
    @Basic(optional = false)
    @NotNull(message = "{name.NotNull}")
    @Size(min = 1, max = 200)
    @Column(name = "email")
    private String email;
    @Column(name = "created_date")
    @Temporal(TemporalType.TIMESTAMP)
    private Date createdDate;
    @Column(name = "active")
    private Boolean active;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bushomeId")
    private Set<Route> routeSet;
    @JsonIgnore
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bushomeId")
    private Set<Car> carSet;
    
    @Transient
    private MultipartFile file;
    
    public Bushome() {
    }

    public Bushome(Integer id) {
        this.id = id;
    }

    public Bushome(Integer id, String name, String address, String phone, String image, String email) {
        this.id = id;
        this.name = name;
        this.address = address;
        this.phone = phone;
        this.image = image;
        this.email = email;
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

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Date getCreatedDate() {
        return createdDate;
    }

    public void setCreatedDate(Date createdDate) {
        this.createdDate = createdDate;
    }

    public Boolean getActive() {
        return active;
    }

    public void setActive(Boolean active) {
        this.active = active;
    }

    @XmlTransient
    public Set<Route> getRouteSet() {
        return routeSet;
    }

    public void setRouteSet(Set<Route> routeSet) {
        this.routeSet = routeSet;
    }

    @XmlTransient
    public Set<Car> getCarSet() {
        return carSet;
    }

    public void setCarSet(Set<Car> carSet) {
        this.carSet = carSet;
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
        if (!(object instanceof Bushome)) {
            return false;
        }
        Bushome other = (Bushome) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.btl.pojo.Bushome[ id=" + id + " ]";
    }

    /**
     * @return the file
     */
    public MultipartFile getFile() {
        return file;
    }

    /**
     * @param file the file to set
     */
    public void setFile(MultipartFile file) {
        this.file = file;
    }

    @XmlTransient
    public Set<Comment> getCommentSet() {
        return commentSet;
    }

    public void setCommentSet(Set<Comment> commentSet) {
        this.commentSet = commentSet;
    }
    
}
