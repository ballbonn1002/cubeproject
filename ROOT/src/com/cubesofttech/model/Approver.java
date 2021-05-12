package com.cubesofttech.model;

import java.io.Serializable;
import java.util.*;
import java.math.*;
import javax.persistence.*;

@Entity
@Table(name = "approver")
@NamedQueries({
    @NamedQuery(name = "Approver.findAll", query = "SELECT t FROM Approver t")})
public class Approver implements Serializable {
    
    /** Creates a new instance of Approver */
    public Approver() {
    }
    public Approver(
            Integer id	
            , String userId	
            , String apprId	
            , String apprName	
            , Integer row	
            , Integer apprNo	
        ) {
        this.id = id;	
        this.userId = userId;	
        this.apprId = apprId;	
        this.apprName = apprName;	
        this.row = row;	
        this.apprNo = apprNo;	
    }
    
    @Id
    @Column(name = "id")
    private Integer id;	
    @Column(name = "user_id")
    private String userId;	
    @Column(name = "appr_id")
    private String apprId;	
    @Column(name = "appr_name")
    private String apprName;	
    @Column(name = "row")
    private Integer row;	
    @Column(name = "appr_no")
    private Integer apprNo;	



    public Integer getId() {
        return this.id;
    }		
    public void setId(Integer id) {
        this.id = id;
    }
    public String getUserId() {
        return this.userId;
    }		
    public void setUserId(String userId) {
        this.userId = userId;
    }
    public String getApprId() {
        return this.apprId;
    }		
    public void setApprId(String apprId) {
        this.apprId = apprId;
    }
    public String getApprName() {
        return this.apprName;
    }		
    public void setApprName(String apprName) {
        this.apprName = apprName;
    }
    public Integer getRow() {
        return this.row;
    }		
    public void setRow(Integer row) {
        this.row = row;
    }
    public Integer getApprNo() {
        return this.apprNo;
    }		
    public void setApprNo(Integer apprNo) {
        this.apprNo = apprNo;
    }


    
    public String toString() {
        return super.toString() + "id=[" + id + "]\n" + "userId=[" + userId + "]\n" + "apprId=[" + apprId + "]\n" + "apprName=[" + apprName + "]\n" + "row=[" + row + "]\n" + "apprNo=[" + apprNo + "]\n";
    }

    public boolean equals(Object obj) {
        if (this == obj) {
                return true;
        }
        if (!(obj instanceof Approver)) {
                return false;
        }
        Approver that = (Approver) obj;
        if (!(that.getId() == null ? this.getId() == null
                        : that.getId().equals(this.getId()))) {
                return false;
        }
        if (!(that.getUserId() == null ? this.getUserId() == null
                        : that.getUserId().equals(this.getUserId()))) {
                return false;
        }
        if (!(that.getApprId() == null ? this.getApprId() == null
                        : that.getApprId().equals(this.getApprId()))) {
                return false;
        }
        if (!(that.getApprName() == null ? this.getApprName() == null
                        : that.getApprName().equals(this.getApprName()))) {
                return false;
        }
        if (!(that.getRow() == null ? this.getRow() == null
                        : that.getRow().equals(this.getRow()))) {
                return false;
        }
        if (!(that.getApprNo() == null ? this.getApprNo() == null
                        : that.getApprNo().equals(this.getApprNo()))) {
                return false;
        }
    return true;
    }

}
