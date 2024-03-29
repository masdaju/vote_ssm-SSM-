package edu.example.entity;

import lombok.Data;

import java.util.Date;
import java.io.Serializable;

/**
 * (SmbmsProvider)实体类
 *
 * @author makejava
 * @since 2024-01-12 20:48:25
 */
@Data
public class Provider implements Serializable {
    private static final long serialVersionUID = -29991825124344126L;
/**
     * 主键ID
     */
    private Long id;
/**
     * 供应商编码
     */
    private String procode;
/**
     * 供应商名称
     */
    private String proname;
/**
     * 供应商详细描述
     */
    private String prodesc;
/**
     * 供应商联系人
     */
    private String procontact;
/**
     * 联系电话
     */
    private String prophone;
/**
     * 地址
     */
    private String proaddress;
/**
     * 传真
     */
    private String profax;
/**
     * 创建者（userId）
     */
    private Long createdby;
/**
     * 创建时间
     */
    private Date creationdate;
/**
     * 更新时间
     */
    private Date modifydate;
/**
     * 更新者（userId）
     */
    private Long modifyby;


    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getProcode() {
        return procode;
    }

    public void setProcode(String procode) {
        this.procode = procode;
    }

    public String getProname() {
        return proname;
    }

    public void setProname(String proname) {
        this.proname = proname;
    }

    public String getProdesc() {
        return prodesc;
    }

    public void setProdesc(String prodesc) {
        this.prodesc = prodesc;
    }

    public String getProcontact() {
        return procontact;
    }

    public void setProcontact(String procontact) {
        this.procontact = procontact;
    }

    public String getProphone() {
        return prophone;
    }

    public void setProphone(String prophone) {
        this.prophone = prophone;
    }

    public String getProaddress() {
        return proaddress;
    }

    public void setProaddress(String proaddress) {
        this.proaddress = proaddress;
    }

    public String getProfax() {
        return profax;
    }

    public void setProfax(String profax) {
        this.profax = profax;
    }

    public Long getCreatedby() {
        return createdby;
    }

    public void setCreatedby(Long createdby) {
        this.createdby = createdby;
    }

    public Date getCreationdate() {
        return creationdate;
    }

    public void setCreationdate(Date creationdate) {
        this.creationdate = creationdate;
    }

    public Date getModifydate() {
        return modifydate;
    }

    public void setModifydate(Date modifydate) {
        this.modifydate = modifydate;
    }

    public Long getModifyby() {
        return modifyby;
    }

    public void setModifyby(Long modifyby) {
        this.modifyby = modifyby;
    }

}

