package bvvo.model;

import java.util.List;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;



@Entity
@Table(name = "reviews")
public class Review {


	@Id
	@GeneratedValue
	private Integer id;

	@Column(nullable = false, name = "review_description")
	private String reviewDescription;

	@Column(nullable = false)
	private String title;

	@Column(nullable = false, name = "rating_knowledge")
	private Integer ratingKnowledge;

	@Column(nullable = false, name = "rating_service")
	private Integer ratingService;

	@Column(nullable = false, name = "rating_overall")
	private Integer ratingOverall;

	@ManyToOne
	@JoinColumn(name = "lawyer_id")
	private User Lawyer;

	// we assume that a review can be unique to one user only
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	@Column (nullable = false)
	boolean enabled;
	

	public Review() {
	}
	

	public Review(Integer id, String reviewDescription, String title,
			Integer ratingKnowledge, Integer ratingService,
			Integer ratingOverall, User lawyer, User user , boolean enabled) {
		this.id = id;
		this.reviewDescription = reviewDescription;
		this.title = title;
		this.ratingKnowledge = ratingKnowledge;
		this.ratingService = ratingService;
		this.ratingOverall = ratingOverall;
		Lawyer = lawyer;
		this.user = user;
		this.enabled = enabled;
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getReviewDescription() {
		return reviewDescription;
	}

	public void setReviewDescription(String reviewDescription) {
		this.reviewDescription = reviewDescription;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Integer getRatingKnowledge() {
		return ratingKnowledge;
	}

	public void setRatingKnowledge(Integer ratingKnowledge) {
		this.ratingKnowledge = ratingKnowledge;
	}

	public Integer getRatingService() {
		return ratingService;
	}

	public void setRatingService(Integer ratingService) {
		this.ratingService = ratingService;
	}

	public Integer getRatingOverall() {
		return ratingOverall;
	}

	public void setRatingOverall(Integer ratingOverall) {
		this.ratingOverall = ratingOverall;
	}

	public User getLawyer() {
		return Lawyer;
	}

	public void setLawyer(User lawyer) {
		Lawyer = lawyer;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	public boolean isEnabled() {
		return enabled;
	}


	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
}
