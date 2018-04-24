package bvvo.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.DiscriminatorValue;
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
//do we need to add discriminator column here?
@DiscriminatorValue("ROLE_LAWYER")
public class Lawyer extends User {

	private static final long serialVersionUID = 1L;


	@Column(nullable = true, name = "area_expertise")
	private String areaExpertise;

	@Column(nullable = true, name = "year_started")
	private Integer yearStarted;
	
	private byte[] image;
	private byte[] image2;
	


	public Lawyer() {
	}

	public Lawyer(String areaExpertise, Integer yearStarted , byte[] image , byte[] image2) {
		this.areaExpertise = areaExpertise;
		this.yearStarted = yearStarted;
		this.image = image;
		this.image = image2;
	}
	

	public String getAreaExpertise() {
		return areaExpertise;
	}

	public void setAreaExpertise(String areaExpertise) {
		this.areaExpertise = areaExpertise;
	}

	public Integer getYearStarted() {
		return yearStarted;
	}

	public void setYearStarted(Integer yearStarted) {
		this.yearStarted = yearStarted;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}


	public byte[] getImage() {
		return image;
	}

	public void setImage(byte[] image) {
		this.image = image;
	}
	
	public byte[] getImage2() {
		return image2;
	}

	public void setImage2(byte[] image2) {
		this.image2 = image2;
	}
}
