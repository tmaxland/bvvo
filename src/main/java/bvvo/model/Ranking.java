package bvvo.model;

public class Ranking {

	int resultRank;
	String resultTitle;
	String resultDescription;

	public Ranking() {
	}

	public Ranking(int resultRank, String resultTitle, String resultDescription) {
		this.resultRank = resultRank;
		this.resultTitle = resultTitle;
		this.resultDescription = resultDescription;
	}

	public int getResultRank() {
		return resultRank;
	}

	public void setResultRank(int resultRank) {
		this.resultRank = resultRank;
	}

	public String getResultTitle() {
		return resultTitle;
	}

	public void setResultTitle(String resultTitle) {
		this.resultTitle = resultTitle;
	}

	public String getResultDescription() {
		return resultDescription;
	}

	public void setResultDescription(String resultDescription) {
		this.resultDescription = resultDescription;
	}

}
