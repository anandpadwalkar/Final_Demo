package com.iitms.cms.masters.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

@Entity
@Table(name = "complaint_item_master")
public class ComplaintItemEntity implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "itemid")
	private int itemId;
	@Column(name = "itemcode")
	@NotEmpty
	private String itemCode;
	@Column(name = "itemname")
	@NotEmpty(message = "Item Name ?")
	@NotNull
	private String itemName;
	@Column(name = "itemunit")
	@NotEmpty
	private String itemUnit;
	@Column(name = "maxstock")
	@NotNull
	@Pattern(regexp = "^\\d+$")
	private String maxStock;
	@Column(name = "minstock")
	@NotNull
	@Pattern(regexp = "^\\d+$")
	private String minStock;
	@Column(name = "currentstock")
	@NotNull
	@Pattern(regexp = "^\\d+$")
	private String currentStock;
	@Column(name = "deptid")
	@Range(min=1)
	private int deptId;
	@Column(name = "complainttypeid")
	@Range(min=1)
	private int complaintTypeId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "deptId", referencedColumnName = "deptid", insertable = false, updatable = false, nullable = false)
	private ComplaintDepartment ComplaintDepartment;

	public int getItemId() {
		return itemId;
	}

	public void setItemId(int itemId) {
		this.itemId = itemId;
	}

	public String getItemCode() {
		return itemCode;
	}

	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemUnit() {
		return itemUnit;
	}

	public void setItemUnit(String itemUnit) {
		this.itemUnit = itemUnit;
	}

	

	public String getMaxStock() {
		return maxStock;
	}

	public void setMaxStock(String maxStock) {
		this.maxStock = maxStock;
	}

	

	public String getMinStock() {
		return minStock;
	}

	public void setMinStock(String minStock) {
		this.minStock = minStock;
	}

	public String getCurrentStock() {
		return currentStock;
	}

	public void setCurrentStock(String currentStock) {
		this.currentStock = currentStock;
	}

	public int getDeptId() {
		return deptId;
	}

	public void setDeptId(int deptId) {
		this.deptId = deptId;
	}

	public int getComplaintTypeId() {
		return complaintTypeId;
	}

	public void setComplaintTypeId(int complaintTypeId) {
		this.complaintTypeId = complaintTypeId;
	}

	public ComplaintDepartment getComplaintDepartment() {
		return ComplaintDepartment;
	}

	public void setComplaintDepartment(ComplaintDepartment complaintDepartment) {
		ComplaintDepartment = complaintDepartment;
	}

	@Override
	public String toString() {
		return "ComplaintItemEntity [itemId=" + itemId + ", itemCode=" + itemCode + ", itemName=" + itemName
				+ ", itemUnit=" + itemUnit + ", maxStock=" + maxStock + ", minStock=" + minStock + ", currentStock="
				+ currentStock + ", deptId=" + deptId + ", complaintTypeId=" + complaintTypeId + "]";
	}

	
	
	
}
