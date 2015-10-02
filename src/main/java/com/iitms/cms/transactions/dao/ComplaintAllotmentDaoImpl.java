package com.iitms.cms.transactions.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.sql.JoinType;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.cms.masters.entity.ComplaintItemEntity;
import com.iitms.cms.transactions.entity.ComplaintAllotmentEntity;
import com.iitms.cms.transactions.entity.ComplaintRegisterEntity;

@Repository
public class ComplaintAllotmentDaoImpl implements ComplaintAllotmentDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<ComplaintRegisterEntity> getAllComplaintsAllotment() {
		Session session = this.sessionFactory.getCurrentSession();
		ProjectionList  projectionList = Projections.projectionList();
		projectionList.add(Projections.property("complaintDate").as("complaintDate"));
		projectionList.add(Projections.property("complaintDetails").as("complaintDetails"));
		projectionList.add(Projections.property("complaintDepartment.deptName").as("deptName"));
		projectionList.add(Projections.property("complaintStatusEntity.statusName").as("statusName"));
		
		List<ComplaintRegisterEntity> list = session.createCriteria(ComplaintRegisterEntity.class)
		.createAlias("complaintDepartment", "complaintDepartment", JoinType.LEFT_OUTER_JOIN)
		.createAlias("complaintStatusEntity", "complaintStatusEntity", JoinType.LEFT_OUTER_JOIN)
		.setProjection(projectionList)
		.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
		.list();
		
		return list;
	}


	
	
	
}
