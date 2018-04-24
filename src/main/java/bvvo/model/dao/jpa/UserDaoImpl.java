package bvvo.model.dao.jpa;

import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import bvvo.model.Lawyer;
import bvvo.model.Review;
import bvvo.model.User;
import bvvo.model.dao.UserDao;
import org.springframework.security.access.prepost.PostAuthorize;
import org.springframework.security.access.prepost.PreAuthorize;


@Repository
public class UserDaoImpl implements UserDao {

	@PersistenceContext
	EntityManager entityManager;

	@Override
	public List<User> getLawyers() {
		return entityManager.createQuery("from User where user_type='ROLE_LAWYER'",
				User.class).getResultList();
	}

	@Override
	public User getLawyer(Integer id) {
		// get a user
		return entityManager.find(User.class, id);
	}
	
	@Override
	public Lawyer getLawyerOnly(Integer id) {
		//get lawyer
		return entityManager.find(Lawyer.class, id);
	}

	@Override
	public List<Review> getReviews(Integer id) {
		return entityManager.createQuery("from Review where Lawyer =" + id + " and enabled = true",
				Review.class).getResultList();
	}



	
	// adding a new user
	@Override
	@Transactional
	public User saveUser(User user) {
		return entityManager.merge(user);

	}
	
	
	@Override
	@Transactional
//	@PreAuthorize("principal.username == #user.username")
	public Review saveReview(Review review) {
		return entityManager.merge(review);
	}
	
	@Override
	@Transactional
	public Lawyer saveLawyer(Lawyer lawyer) {
		return entityManager.merge(lawyer);

	}
	
	@Override
    public List<User> getUserDetails( String email , String password) {
            
            List<User> userDetails = entityManager.createQuery("from User where email= :email and password= :password", User.class).
            		setParameter("email", email).setParameter("password", password).getResultList();
            return userDetails;
    }

	
	@Override
	public List<User> getLawyersForSearch() {
		List <User> lawyersForSearch = entityManager.createQuery("from User where user_type='ROLE_LAWYER'",
				User.class).getResultList();
			return lawyersForSearch;
	}

	@Override
	public List<Lawyer> getLawyersOnlyForSearch() {
		List <Lawyer> lawyersOnlyForSearch = entityManager.createQuery("from Lawyer ",
				Lawyer.class).getResultList();
			return lawyersOnlyForSearch;
	}

	@Override
	public Review getReview(Integer id) {
		// get review from database
		return entityManager.find(Review.class, id);
	}

	@Override
	public User getId(String uname) {
		User user  = entityManager.createQuery("from User where userName= :uname", User.class)
		.setParameter("uname", uname).getSingleResult();
		return user;
	}


}	
	



