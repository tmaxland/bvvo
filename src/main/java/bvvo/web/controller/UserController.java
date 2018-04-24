package bvvo.web.controller;

import java.awt.Color;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import java.sql.Blob;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.imageio.ImageIO;
import javax.imageio.stream.ImageOutputStream;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.persistence.CascadeType;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.xml.ws.Response;

import org.hibernate.Hibernate;
import org.hibernate.annotations.Cascade;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.core.io.ResourceLoader;

import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.validation.BindingResultUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.client.HttpServerErrorException;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.MultipartFilter;



import bvvo.model.Lawyer;
import bvvo.model.Ranking;
import bvvo.model.Review;
import bvvo.model.User;
import bvvo.model.dao.UserDao;
import bvvo.web.validator.UserValidator;

@Controller
@SessionAttributes({"user","review"})

public class UserController {

	@Autowired
	UserDao userDao;

	 @Autowired
	 JavaMailSenderImpl mailSender;
	 
	 @PersistenceContext
	 EntityManager entityManager;

	 
	@RequestMapping("/user/register.html")
	public String register()

	{
		return "user/register";
	}

	// get users from database Users
	@RequestMapping("/user/lawyers.html")
	public String lawyers(ModelMap models)

	{
		models.put("lawyers", userDao.getLawyers());
		return "user/lawyers";
	}

	// get user from database where user is lawyer
	// get reviews of this user from the databse
	
	
	@RequestMapping("/user/lawyer.html")
	public  String lawyer(
			@RequestParam(value = "lawyerId", required = false) Integer id, HttpServletResponse response,
			 ModelMap models) {
		
		models.put("lawyer", userDao.getLawyer(id));
		
		
		models.put("reviews", userDao.getReviews(id));
		return "user/lawyer";
	
	}	
	
	
    
	@RequestMapping("/user/getImage.html")
		public  String lawyer(
				@RequestParam(value = "id") int id, HttpServletResponse response) throws IOException{
		Lawyer lawyer = userDao.getLawyerOnly(id);
        response.setHeader( "Conten-Disposition", "inline; filename=hello.png");
        byte[] imageBytes = userDao.getLawyerOnly(id).getImage();
        InputStream in = new ByteArrayInputStream( imageBytes );
        OutputStream out = response.getOutputStream();
        byte buffer[] = new byte[2048];
        int bytesRead;
        while( (bytesRead = in.read( buffer )) > 0 )
            out.write( buffer, 0, bytesRead );
        in.close();

        return null;

	}
	
	@RequestMapping("/user/getImage2.html")
	public  String lawyer2(
			@RequestParam(value = "id") int id, HttpServletResponse response) throws IOException{
	Lawyer lawyer = userDao.getLawyerOnly(id);

    response.setHeader( "Conten-Disposition", "inline; filename=hello.png");
    byte[] imageBytes = userDao.getLawyerOnly(id).getImage2();
    InputStream in = new ByteArrayInputStream( imageBytes );
    OutputStream out = response.getOutputStream();
    byte buffer[] = new byte[2048];
    int bytesRead;
    while( (bytesRead = in.read( buffer )) > 0 )
        out.write( buffer, 0, bytesRead );
    in.close();

    return null;

}

	@RequestMapping(value = "/user/addUser.html", method = RequestMethod.GET)
	public String addUser(ModelMap models) {
		models.put("user", new User());
		return "user/addUser";
	}

	
	@RequestMapping(value = "/user/addUser.html", method = RequestMethod.POST)
	public String addUser(@ModelAttribute User user){
		
		userDao.saveUser(user);
		return "redirect:../index.jsp";
	}
	
	
	
	@RequestMapping(value = "/user/addLawyer.html", method = RequestMethod.GET)
	public String addLawyer(ModelMap models) {
		models.put("lawyer", new Lawyer());
		return "user/addLawyer";
	}

	// put the user name and log in parameter here into a list
	
	@RequestMapping(value = "/user/addLawyer.html", method = RequestMethod.POST)
	public String addLawyer(@ModelAttribute Lawyer lawyer, @RequestParam("file") MultipartFile uploadedFile, HttpServletRequest resp) throws IOException
	{
		String fileLocation = resp.getServletContext().getRealPath("/src/main/webapp/WEB-INF/images/default.jpg");
		
		File file2 = new File( fileLocation);
		if( !uploadedFile.isEmpty() )
        {
			
			byte[] imageData = uploadedFile.getBytes();
			System.out.println("add this" + imageData);
			lawyer.setImage(scale(imageData,112,149));
			lawyer.setImage2(scale(imageData,66,88));
        }
		
		userDao.saveLawyer(lawyer);
		return "redirect:lawyers.html";
	}
	
	public byte[] scale(byte[] fileData, int width, int height) {
    	ByteArrayInputStream in = new ByteArrayInputStream(fileData);
    	try {
    		BufferedImage img = ImageIO.read(in);
    		if(height == 0) {
    			height = (width * img.getHeight())/ img.getWidth(); 
    		}
    		if(width == 0) {
    			width = (height * img.getWidth())/ img.getHeight();
    		}
    		Image scaledImage = img.getScaledInstance(width, height, Image.SCALE_SMOOTH);
    		BufferedImage imageBuff = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
    		imageBuff.getGraphics().drawImage(scaledImage, 0, 0, new Color(0,0,0), null);

    		ByteArrayOutputStream buffer = new ByteArrayOutputStream();

    		ImageIO.write(imageBuff, "jpg", buffer);
    		System.out.println("trythis" + buffer.toByteArray());
    		return buffer.toByteArray();
    	} catch (IOException e) {
    		
    	}
    	return null;
    }
	
	//add review
	@RequestMapping(value = "/user/addReview.html", method = RequestMethod.GET)
	public String addReview(ModelMap models, SessionStatus sessionStatus) {
		models.put("review", new Review());
	    return "user/addReview";
	}

	@RequestMapping(value = "/user/addReview.html", method = RequestMethod.POST)
	public String addUser(@ModelAttribute Review review,
			 HttpSession session,@RequestParam (value = "lawyerId", required = false) Integer id, SessionStatus sessionStatus ) throws MessagingException {
		
		//get username from spring security
		
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		String uname = auth.getName(); //get logged in
		
		User user = userDao.getId(uname);
		System.out.println("this i user id" +user.getId());
		
		MimeMessage message = mailSender.createMimeMessage();
		
		// use the true flag to indicate you need a multipart message
		MimeMessageHelper helper = new MimeMessageHelper(message, true);
		User lawyer = userDao.getLawyer(id);
		helper.setTo(lawyer.getEmail());
		helper.setFrom("tmax@aol.com");
		helper.setText("<html><body> "+uname+" wrote a review of you at" +new Date()+". You can check the review at <a href='http://localhost:8080/bvvo/user/lawyer.html?lawyerId="+id+"'>here.</a></body></html>", true);
		mailSender.send(message);
		
		review.setUser(user);
		
		userDao.saveReview(review);
		sessionStatus.setComplete();
		return "redirect:lawyers.html";
	}

	@RequestMapping(value = "/user/login.html", method = RequestMethod.GET)
	public String loginUser(ModelMap models) {
		models.put("login", new User());
		return "user/login";
	}

	@RequestMapping(value = "/user/login.html", method = RequestMethod.POST)
	public String loginUser(@RequestParam String email, String password,
			HttpSession session) {

		List<User> userdetails = userDao.getUserDetails(email, password);

		if (email != null && password != null) {
			for (User user : userdetails) {
				if (email.equalsIgnoreCase(user.getEmail())
						&& password.equalsIgnoreCase(user.getPassword())) {
					session.setAttribute("userChecked", user.getFirstName());
					session.setAttribute("userID", user.getId());
					return "redirect:../index.jsp";
				}
			}
		}

		return "redirect:login.html";
	}

	@RequestMapping(value = "/user/logout.html")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:lawyers.html";
	}

	// search lawyer

	@RequestMapping(value = "/user/search.html", method = RequestMethod.GET)
	public String searchUser(ModelMap models) {
		models.put("lawyers", new User());
		return "user/search";
	}

	@RequestMapping(value = "/user/search.html", method = RequestMethod.POST)
	public String searchUser(@RequestParam String searchByName,
			String searchByCityState, Integer searchByZipCode, String searchByExpertise, String searchByReview,
			ModelMap models) {
		
			models.put("lawyer", userDao.getLawyersForSearch());
			//to get lawyers
			models.put("lawyerOnly", userDao.getLawyersOnlyForSearch());
			
			
			List<User> lawyersForSearch = userDao.getLawyersForSearch();
			
			List<Lawyer> lawyersOnlyForSearch = userDao.getLawyersOnlyForSearch();

		if (searchByName != "") {

			for (User user : lawyersForSearch) {
//				System.out.println("this = " + user.getFirstName());
				if (searchByName.equalsIgnoreCase(user.getFirstName())
						| searchByName.equalsIgnoreCase(user.getLastName())) {
					List<User> searchedUsers = new ArrayList<User>();
					searchedUsers.add(user);
					models.put("results", searchedUsers);
					return "user/resultsPage";
				}
			}
		}

		 if (searchByCityState != "") {

			for (User user : lawyersForSearch) {
				if (searchByCityState.equalsIgnoreCase(user.getCity())
						| searchByCityState.equalsIgnoreCase(user.getState())) {
					List<User> searchedUsers = new ArrayList<User>();
					searchedUsers.add(user);
					models.put("results", searchedUsers);
					return "user/resultsPage";
				}
			}
		}
		 
		 if (searchByZipCode != null) {
			 System.out.println(searchByZipCode);
				for (User user : lawyersForSearch) {
					if (searchByZipCode.equals(user.getZipCode())) {
						List<User> searchedUsers = new ArrayList<User>();
						searchedUsers.add(user);
						models.put("results", searchedUsers);
						return "user/resultsPage";
					}
				}
			}
		
		 
		 if ( searchByExpertise != "") {
			 
			 for (Lawyer lawyer : lawyersOnlyForSearch) {
					
				 if (searchByExpertise.equalsIgnoreCase(lawyer.getAreaExpertise())) {
						
						List<Lawyer> searchedUsers = new ArrayList<Lawyer>();
						searchedUsers.add(lawyer);
						models.put("results", searchedUsers);
						return "user/resultsPage";
					}
				}
			}
		 
		 
		 	//full test search here search by review and search by title
		 	//first do the search on postgressql
		 	if (searchByReview != ""){

		 		System.out.println("main start here" );
		 		//search by review using full text search
		 		String sql = "select " +
//		 				"ts_rank ( tsv, plainto_tsquery(:searchByReview)) as ranking ," +
		 				"id, " +
		 				"lawyer_id, "+
		 				"user_id, "+
		 				"enabled, "+
		 				"rating_knowledge, "+
		 				"rating_overall, "+
		 				"rating_service, "+
		 				"ts_headline (title,plainto_tsquery(:searchByReview)) as title, " +
		 				"ts_headline (review_description , plainto_tsquery(:searchByReview)) as review_description " +
		 				"from reviews " +
		 				"where tsv @@ plainto_tsquery(:searchByReview) " +
		 				"order by ts_rank ( tsv, plainto_tsquery('business help')) desc;";
		 		
		 		System.out.println("works till here");
		 		
		 		List searchedReviews = entityManager.createNativeQuery(sql, Review.class).setParameter("searchByReview", searchByReview).
		 				getResultList();
		 		System.out.println("sql processing done");
		 		if (searchedReviews.size() > 0)
		 			{
		 			models.put ("searchedReviews", searchedReviews);
		 			return "user/resultsPage";
		 		
		 			}
		 	}
		 
		return "redirect:search.html";
		
				
	}
	
	@RequestMapping(value = "/user/editReview.html", method = RequestMethod.GET)
    public String editReview( @RequestParam (value = "reviewId", required = false)  Integer id, ModelMap models )
    {
        models.put( "review", userDao.getReview( id ) );
        return "user/editReview";
    }

    
	@RequestMapping(value = "/user/editReview.html", method = RequestMethod.POST)
    public String editUser( @ModelAttribute Review review,
        BindingResult bindingResult, SessionStatus sessionStatus )
    {

    	userDao.saveReview(review);
    	sessionStatus.setComplete();
		return "redirect:lawyers.html";
    	
    }
}