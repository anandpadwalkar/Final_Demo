package com.iitms.cms.transactions.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.AliasToBeanResultTransformer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.iitms.cms.transactions.entity.ComplaintAllotmentEntity;

@Repository
public class ComplaintAllotmentDaoImpl implements ComplaintAllotmentDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	
	@Override
	@Transactional
	public List<ComplaintAllotmentEntity> getAllComplaintsAllotment() {
		List<ComplaintAllotmentEntity> list = 
			  	this.sessionFactory.getCurrentSession()
			 	.createCriteria(ComplaintAllotmentEntity.class)
			 	.list();

		return list;
	}


	
	
	
}
