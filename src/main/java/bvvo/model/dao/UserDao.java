package bvvo.model.dao;

import java.util.List;
import bvvo.model.Lawyer;
import bvvo.model.Review;
import bvvo.model.User;

public interface UserDao {

	// get a list of lawyers
	List<User> getLawyers();

	// get lawyers from database
	User getLawyer(Integer id);
	
	Lawyer getLawyerOnly(Integer id);
	
	// get reviews from the database
	List<Review> getReviews(Integer id);

	// add a new user to database
	User saveUser(User user);
	
	Lawyer saveLawyer(Lawyer lawyer);

	List<User> getUserDetails(String email, String password);

	List <User> getLawyersForSearch();
	
	List <Lawyer> getLawyersOnlyForSearch();
	
	
	Review saveReview(Review review);

	Review getReview(Integer id);

	User getId(String uname);


	






}
