package com.bookshop.advertise.dao;

import java.util.List;

import com.bookshop.advertise.bean.AdvertiseDTO;

public interface IAdvertiseDAO {
	
	/**根据ID查询一条公告的内容
	 * @param id
	 * @return
	 */
	AdvertiseDTO queryAdvertiseById(Integer id);
	
	/**根据页码查询一列公告
	 * @param pageno
	 * @return
	 */
	List<AdvertiseDTO> queryAdvertiseListByPage(Integer pageno);
	
	/**查询公告数量
	 * @return
	 */
	int queryAdvertiseCount();
	
	/**增加一条公告
	 * @param advertise
	 */
	void addAdvertise(AdvertiseDTO advertise);
	
	/**修改一条公告
	 * @param advertise
	 */
	void updateAdvertise(AdvertiseDTO advertise);
	
	/**删除一条公告
	 * @param id
	 */
	void deleteAdvertise(Integer id);
	
}
