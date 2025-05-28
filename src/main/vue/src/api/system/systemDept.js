/**
 * 系统部门接口
 */
export const systemDeptApi = {
  // 查询系统部门
  getById(id){
    return request({ url: '/systemDept/getById', method: 'get', params: { id } })
  },
  // 查询系统部门列表
  list(params){
    return request({ url: '/systemDept/list', method: 'get', params })
  },
  // 保存系统部门
  add(data){
    return request({ url: '/systemDept/add', method: 'post', data })
  },
  // 更新系统部门
  update(data){
    return request({ url: '/systemDept/update', method: 'post', data })
  },
  // 批量删除系统部门信息
  remove(data){
    return request({ url: '/systemDept/remove', method: 'delete', data })
  },
  // 导出系统部门
  exportData(data) {
    download('/systemDept/export', data, `系统部门_${getNowDate('_')}.xlsx`)
  },
  // 获取系统部门导入模板
  downloadTemplate() {
    downloadTemplate('/systemDept/downloadTemplate', `系统部门_模板_${getNowDate('_')}.xlsx`)
  },
  importUrl: '/systemDept/importData',
}
