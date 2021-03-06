package dao;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import com.projet.outils.StaticValues;

//import com.projet.outiles.StaticValues;

@Entity
@Table(name ="signatures")
public class Signatures {

	
 

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "signatures_id")
	private Long id;

	@Column(name = "sig_tabrg")
	private int[] tabRG=new int[StaticValues.NOMBRE_DE_DIVISION_RG];

	@Column(name = "sig_tabby")
	private int[] tabBY  =new int[StaticValues.NOMBRE_DE_DIVISION_BY];

	@Column(name = "sig_tabwb")
	private int[] tabWB=new int[StaticValues.NOMBRE_DE_DIVISION_WB];;
	
	@OneToOne 
	@JoinColumn(name ="imageId", updatable=true)
	private Image image;
	 
	public Image getImage() {
		return image;
	}

	public void setImage(Image image) {
		this.image = image;
	}

	public Signatures() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Signatures(int[] tabRG, int[] tabBY, int[] tabWB) {
		super();
		this.tabRG = tabRG;
		this.tabBY = tabBY;
		this.tabWB = tabWB;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public int[] getTabRG() {
		return tabRG;
	}

	public int[] getTabBY() {
		return tabBY;
	}

	public int[] getTabWB() {
		return tabWB;
	}

	public void setTabRG(int[] tabRG) {
		this.tabRG = tabRG;
	}

	public void setTabBY(int[] tabBY) {
		this.tabBY = tabBY;
	}

	public void setTabWB(int[] tabWB) {
		this.tabWB = tabWB;
	}

}
