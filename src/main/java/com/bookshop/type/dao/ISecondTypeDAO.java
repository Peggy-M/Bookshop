package com.bookshop.type.dao;

import java.util.List;

import com.bookshop.type.bean.FirstTypeDTO;
import com.bookshop.type.bean.SecondTypeDTO;

public interface ISecondTypeDAO {
	/**根据firstTypeID查询二级类目
	 * @param id
	 * @return firstType
	 */
	List<SecondTypeDTO> querySecondTypeById(Integer id);
	
	/**查询二级目录的总数量
	 * @return count
	 */
	int getSecondTypeCount();
	
	/**通过页码查询二级类目列表
	 * @param pageno
	 * @return typeList
	 */
	List<SecondTypeDTO> getSecondTypeByPage(Integer pageno);
	
	/**添加一条二级类目
	 * @param firstType
	 */
	void addSecondType(SecondTypeDTO secondType);
	
	/**修改一条二级目录
	 * @param firstType
	 */
	void updateSecondType(SecondTypeDTO secondType);
	
	/**根据ID删除一条二级目录
	 * @param id
	 */
	void deleteSecondType(Integer id);
	
	SecondTypeDTO getSecondTypeBySecondTypeId(Integer id);
	
	List<SecondTypeDTO> getAllSecondType();
	
}
