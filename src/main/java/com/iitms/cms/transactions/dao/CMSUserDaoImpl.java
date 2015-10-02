package com.iitms.cms.transactions.dao;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.DetachedCriteria;
import org.hibernate.criterion.Projection;
import org.hibernate.criterion.ProjectionList;
import org.hibernate.criterion.Projections;
import org.hibernate.criterion.Property;
import org.hibernate.criterion.Restrictions;
import org.hibernate.criterion.Subqueries;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.iitms.cms.transactions.entity.ComplaintRepairEmployee;
import com.iitms.cms.transactions.entity.Employee;

@Repository
public class CMSUserDaoImpl implements CMSUserDao{

	@Autowired
	private SessionFactory sessionFactory;

	@SuppressWarnings("unchecked")
	@Override
	public List<Employee> getEmployeeOfDept(int deptId) {
		Session session = this.sessionFactory.getCurrentSession();
		
		ProjectionList projection = Projections.projectionList();
		projection.add(Projections.property("id").as("id"));
		projection.add(Projections.property("employeeName").as("employeeName"));
		
		DetachedCriteria detachedCriteria=DetachedCriteria.forClass(ComplaintRepairEmployee.class);
		detachedCriteria.setProjection(Property.forName("employeeId"));
		//List<Integer> employeeIds = detachedCriteria.
		List<Employee> list = session.createCriteria(Employee.class)
		.setProjection(projection)
		.add(Restrictions.eq("deptId", deptId))
		.add(Subqueries.propertyNotIn("id", detachedCriteria))
		.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
		.list();
		
		return list;
	}

	@Override
	public boolean addEmployeeOfDept(ComplaintRepairEmployee employee) {
		this.sessionFactory.getCurrentSession().save(employee);
		return true;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<ComplaintRepairEmployee> getComplaintRepairEmployee() {
		Session session = this.sessionFactory.getCurrentSession();
		
		ProjectionList projectionList = Projections.projectionList();
		projectionList.add(Projections.property("id").as("id"));
		projectionList.add(Projections.property("employee.employeeName").as("employee"));
		projectionList.add(Projections.property("complaintDepartment.deptName").as("deptName"));
		projectionList.add(Projections.property("status").as("status"));
		
		List<ComplaintRepairEmployee> list = session.createCriteria(ComplaintRepairEmployee.class)
		.createAlias("employee", "employee")
		.createAlias("complaintDepartment", "complaintDepartment")
		.setProjection(projectionList)
		.setResultTransformer(Criteria.ALIAS_TO_ENTITY_MAP)
		.list();
		
		return list;
	}

	@Override
	public boolean editEmployeeOfDept(int id, String status) {
		Session session = this.sessionFactory.getCurrentSession();
		ComplaintRepairEmployee entity = (ComplaintRepairEmployee) session.get(ComplaintRepairEmployee.class, id);
		entity.setStatus(status);
		session.update(entity);
		return true;
	}

	@Override
	public boolean deleteEmployeeOfDept(int id) {
		Session session = this.sessionFactory.getCurrentSession();
		int count = session.createQuery("Delete From ComplaintRepairEmployee entity where id = :id")
		.setParameter("id", id)
		.executeUpdate();
		return count>0?true:false;
	}
	
	
}
