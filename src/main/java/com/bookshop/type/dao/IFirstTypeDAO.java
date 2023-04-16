package com.bookshop.type.dao;

import java.util.List;

import com.bookshop.type.bean.FirstTypeDTO;

public interface IFirstTypeDAO {
	
	/**根据ID查询一级类目
	 * @param id
	 * @return firstType
	 */
	FirstTypeDTO queryFirstTypeById(Integer id);
	
	/**查询一级目录的总数量
	 * @return count
	 */
	int getFirstTypeCount();
	
	/**通过页码查询一级类目列表
	 * @param pageno
	 * @return typeList
	 */
	List<FirstTypeDTO> getFirstTypeByPage(Integer pageno);
	
	/**添加一条一级类目
	 * @param firstType
	 */
	void addFirstType(FirstTypeDTO firstType);
	
	/**修改一条一级目录
	 * @param firstType
	 */
	void updateFirstType(FirstTypeDTO firstType);
	
	/**根据ID删除一条一级目录
	 * @param id
	 */
	void deleteFirstType(Integer id);
	
	/**查询所有的一级类目
	 * @return
	 */
	List<FirstTypeDTO> getAllFirstType();
	
}
