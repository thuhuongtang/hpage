package com.posco.ict.hp.resource;

import java.util.Date;

public class HPageContent {
	private int contentId;
	private String contentTp;
	private int contentSeq;
	private String title;
	private String subtitle;
	private String subtitle1;
	private String subtitle2;
	private String contentDetails;
	private String representResource;
	private String postedDate;
	private String lang;

	public HPageContent() {

	}

	public HPageContent(int contentId, String subtitle1, String contentDetails) {
		this.contentId = contentId;
		this.subtitle1 = subtitle1;
		this.contentDetails = contentDetails;
	}

	public HPageContent(int contentId, String subtitle, String subtitle1,
			String subtitle2, String contentDetails) {
		this.contentId = contentId;
		this.subtitle = subtitle;
		this.subtitle1 = subtitle1;
		this.subtitle2 = subtitle2;
		this.contentDetails = contentDetails;
	}

	public HPageContent(String subtitle, String contentDetails) {
		this.subtitle = subtitle;
		this.contentDetails = contentDetails;
	}

	public HPageContent(String contentId, String subtitle1, String subtitle2,
			String representResource, String contentDetails) {
		this.contentId = Integer.valueOf(contentId);
		this.subtitle1 = subtitle1;
		this.subtitle2 = subtitle2;
		this.representResource = representResource;
		this.contentDetails = contentDetails;
	}

	public HPageContent(String contentId, String subtitle1, String subtitle2,
			String representResource, String postedDate, String contentDetails) {
		this.contentId = Integer.valueOf(contentId);
		this.subtitle1 = subtitle1;
		this.subtitle2 = subtitle2;
		this.representResource = representResource;
		this.postedDate = postedDate;
		this.contentDetails = contentDetails;
	}
	
	/**
	 * @return the contentId
	 */
	public int getContentId() {
		return contentId;
	}

	/**
	 * @param contentId
	 *            the contentId to set
	 */
	public void setContentId(int contentId) {
		this.contentId = contentId;
	}

	/**
	 * @return the contentTp
	 */
	public String getContentTp() {
		return contentTp;
	}

	/**
	 * @param contentTp
	 *            the contentTp to set
	 */
	public void setContentTp(String contentTp) {
		this.contentTp = contentTp;
	}

	/**
	 * @return the contentSeq
	 */
	public int getContentSeq() {
		return contentSeq;
	}

	/**
	 * @param contentSeq
	 *            the contentSeq to set
	 */
	public void setContentSeq(int contentSeq) {
		this.contentSeq = contentSeq;
	}

	/**
	 * @return the title
	 */
	public String getTitle() {
		return title;
	}

	/**
	 * @param title
	 *            the title to set
	 */
	public void setTitle(String title) {
		this.title = title;
	}

	/**
	 * @return the subtitle
	 */
	public String getSubtitle() {
		return subtitle;
	}

	/**
	 * @param subtitle
	 *            the subtitle to set
	 */
	public void setSubtitle(String subtitle) {
		this.subtitle = subtitle;
	}

	/**
	 * @return the subtitle1
	 */
	public String getSubtitle1() {
		return subtitle1;
	}

	/**
	 * @param subtitle1
	 *            the subtitle1 to set
	 */
	public void setSubtitle1(String subtitle1) {
		this.subtitle1 = subtitle1;
	}

	/**
	 * @return the subtitle2
	 */
	public String getSubtitle2() {
		return subtitle2;
	}

	/**
	 * @param subtitle2
	 *            the subtitle2 to set
	 */
	public void setSubtitle2(String subtitle2) {
		this.subtitle2 = subtitle2;
	}

	/**
	 * @return the contentDetails
	 */
	public String getContentDetails() {
		return contentDetails;
	}

	/**
	 * @param contentDetails
	 *            the contentDetails to set
	 */
	public void setContentDetails(String contentDetails) {
		this.contentDetails = contentDetails;
	}

	/**
	 * @return the representResource
	 */
	public String getRepresentResource() {
		return representResource;
	}

	/**
	 * @param representResource
	 *            the representResource to set
	 */
	public void setRepresentResource(String representResource) {
		this.representResource = representResource;
	}

	/**
	 * @return the postedDate
	 */
	public String getPostedDate() {
		return postedDate;
	}

	/**
	 * @param postedDate
	 *            the postedDate to set
	 */
	public void setPostedDate(String postedDate) {
		this.postedDate = postedDate;
	}

	/**
	 * @return the lang
	 */
	public String getLang() {
		return lang;
	}

	/**
	 * @param lang
	 *            the lang to set
	 */
	public void setLang(String lang) {
		this.lang = lang;
	}
}
