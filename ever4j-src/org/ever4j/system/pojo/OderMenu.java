package org.ever4j.system.pojo;

import java.util.List;

/**
 * 排序菜单对象
 * @author Administrator
 *
 */
public class OderMenu {

	private Long parentId;
	
	private Long moveId;
	
	private List<OderChildMenu> childrens;

	public List<OderChildMenu> getChildrens() {
		return childrens;
	}

	public void setChildrens(List<OderChildMenu> childrens) {
		this.childrens = childrens;
	}

	@Override
	public String toString() {
		return "OderMenu [parentId=" + parentId + ", moveId=" + moveId + ", childrens=" + childrens + "]";
	}

	public Long getParentId() {
		return parentId;
	}

	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}

	public Long getMoveId() {
		return moveId;
	}

	public void setMoveId(Long moveId) {
		this.moveId = moveId;
	}
}
