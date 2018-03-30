package com.mast.shop.bean.admin;
/**
 * 积分等级分类实体
 * @author Administrator
 *
 */
public class GradeType {
	  /**
	   * 等级Id
	   */
	  private Integer gradeId;
	  /**
	   * 积分
	   */
	  private Integer score;
	  /**
	   * 等级类型
	   */
	  private String gradeType;

	  public GradeType()
	  {
	  }

	public Integer getGradeId() {
		return gradeId;
	}

	public void setGradeId(Integer gradeId) {
		this.gradeId = gradeId;
	}

	public Integer getScore() {
		return score;
	}

	public void setScore(Integer score) {
		this.score = score;
	}

	public String getGradeType() {
		return gradeType;
	}

	public void setGradeType(String gradeType) {
		this.gradeType = gradeType;
	}

	@Override
	public String toString() {
		return "GradeType [gradeId=" + gradeId + ", score=" + score
				+ ", gradeType=" + gradeType + "]";
	}
	  
	
	  
	  
}
