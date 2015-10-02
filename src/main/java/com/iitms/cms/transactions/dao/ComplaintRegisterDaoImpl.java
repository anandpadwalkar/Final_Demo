package com.iitms.cms.transactions.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.sql.JoinType;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.cms.transactions.entity.ComplaintRegisterEntity;

@Repository
public class ComplaintRegisterDaoImpl implements ComplaintRegisterDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public boolean addComplaint(ComplaintRegisterEntity entity) {
		this.sessionFactory.getCurrentSession().save(entity);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ComplaintRegisterEntity> getAllComplaints() {
Session session = this.sessionFactory.getCurrentSession();
		
		ProjectionList projectionList = Projections.projectionList();
		projectionList.add(Projections.property("id").as("id"));
		projectionList.add(Projections.property("complaintDate").as("complaintDate"));
		projectionList.add(Projections.property("complaintDetails").as("complaintDetails"));
		projectionList.add(Projections.property("complaintDepartment.deptName").as("complaintDepartment"));
		projectionList.add(Projections.property("complaintTypeEntity.id").as("complaintTypeId"));
		projectionList.add(Projections.property("complaintLocation").as("complaintLocation"));
		projectionList.add(Projections.property("complaintDepartment.deptId").as("deptId"));
		projectionList.add(Projections.property("complaintStatus.statusName").as("complaintStatus"));
		projectionList.add(Projections.property("employee.employeeName").as("employeeName"));
		projectionList.add(Projections.property("complainteePhoneNumber").as("complainteePhoneNumber"));
		
		List<ComplaintRegisterEntity> list = session.createCriteria(ComplaintRegisterEntity.class)
		.setProjection(projectionList)
		.createAlias("complaintDepartment", "complaintDepartment", JoinType.LEFT_OUTER_JOIN)
		.createAlias("complaintStatusEntity", "complaintStatus", JoinType.LEFT_OUTER_JOIN)
		.createAlias("complaintTypeEntity", "complaintTypeEntity", JoinType.LEFT_OUTER_JOIN)
		.createAlias("employee", "employee", JoinType.LEFT_OUTER_JOIN)
		.setResultTransformer(new AliasToBeanResultTransformer(ComplaintRegisterEntity.class))
		.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
		.list();
		
		return list;
	}

	public boolean updateComplaint(ComplaintRegisterEntity entity){
		this.sessionFactory.getCurrentSession().update(entity);
		return true;
		
	}
	
	@Override
	public boolean deleteComplaint(int complaintId) {
		Session session = this.sessionFactory.getCurrentSession();
		int count = session.createQuery("Delete From ComplaintRegisterEntity entity where id = :id")
		.setParameter("id", complaintId)
		.executeUpdate();
		return count>0?true:false;
	}
}
