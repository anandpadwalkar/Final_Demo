package com.iitms.cms.masters.dao;

import java.util.List;

import com.iitms.cms.masters.entity.ComplaintItemEntity;

public interface ComplaintItemDao{

	public boolean addComplaintItem(ComplaintItemEntity entity);
	public List<ComplaintItemEntity> listComplaintItem();
	public boolean deleteComplaintItem(Integer  complaintItemId);
	public boolean updateComplaintItem(ComplaintItemEntity complaintItem);
	public ComplaintItemEntity getComplaintItem(int complaintItemId);
}
