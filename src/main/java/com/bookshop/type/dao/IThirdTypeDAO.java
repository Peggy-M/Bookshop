package com.bookshop.type.dao;

import java.util.List;

import com.bookshop.type.bean.ThirdTypeDTO;

public interface IThirdTypeDAO {
	/**根据ID查询三级类目
	 * @param id
	 * @return firstType
	 */
	List<ThirdTypeDTO> queryThirdTypeById(Integer id);
	
	/**查询三级目录的总数量
	 * @return count
	 */
	int getThirdTypeCount();
	
	/**通过页码查询三级类目列表
	 * @param pageno
	 * @return typeList
	 */
	List<ThirdTypeDTO> getThirdTypeByPage(Integer pageno);
	
	/**添加一条三级类目
	 * @param firstType
	 */
	void addThirdType(ThirdTypeDTO thirdType);
	
	/**修改一条三级目录
	 * @param firstType
	 */
	void updateThirdType(ThirdTypeDTO thirdType);
	
	/**根据ID删除一条三级目录
	 * @param id
	 */
	void deleteThirdType(Integer id);
	
	/**根据3级类目ID查询一条三级目录
	 * @param id
	 */
	ThirdTypeDTO getThirdTypeByThirdId(Integer id);
}
